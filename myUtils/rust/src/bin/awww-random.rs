#[cfg(windows)]
compile_error!("Windows is not supported");

use std::{
    path::{Path, PathBuf},
    process::Command,
    thread::sleep,
    time::Duration,
};

use anyhow::{Context, bail};
use clap::Parser;
use rand::seq::SliceRandom;
use walkdir::{DirEntry, WalkDir};

#[derive(Debug, Parser)]
#[command(
    name = "awww-random",
    about = "Random multi-monitor wallpaper selector using `awww`"
)]
struct Args {
    /// Directory containing wallpapers to cycle through
    #[arg(short, long)]
    directory: PathBuf,

    /// Interval (in seconds) between wallpaper switches
    #[arg(short, long, default_value_t = 300)]
    interval: u64,

    /// Do not ignore files and directories starting with '.'
    #[arg(short('h'), long)]
    include_hidden: bool,

    /// Include files with extensions not typically associated with images
    #[arg(short('e'), long)]
    include_odd_extensions: bool,
}

fn main() -> ! {
    let args = Args::parse();

    let interval = Duration::from_secs(args.interval);

    let mut wallpapers: Vec<PathBuf> = Vec::new();

    loop {
        let displays = match fetch_displays() {
            Ok(displays) => displays,
            Err(e) => {
                eprintln!("{e:?}");
                sleep(interval);
                continue;
            }
        };

        let num_displays = displays.len();

        for display in &displays {
            let mut img_path = None;

            while img_path.is_none() {
                if wallpapers.is_empty() {
                    wallpapers = fetch_wallpaper_paths(&args, num_displays);

                    // If `wallpapers` is still empty, there are no images.
                    if wallpapers.is_empty() {
                        eprintln!("No images found in target directory");
                        break;
                    }
                }

                img_path = std::iter::from_fn(|| wallpapers.pop()).find(|path| path.exists());
            }

            // There's technically a TOCTOU here, but it really doesn't matter. It's extremely
            // unlikely, and even if it did happen, it would just mean 1 display doesn't update for
            // 1 cycle.
            if let Some(path) = img_path {
                update_wallpaper(&path, display);
            } else {
                // If we reach this `else`, it means the directory is completely empty.
                // There's no point checking the remaining displays this cycle.
                break;
            }
        }

        sleep(interval);
    }
}

fn fetch_displays() -> anyhow::Result<Vec<String>> {
    let output = Command::new("awww")
        .arg("query")
        .output()
        .context("Invoking `awww query`")?;

    if !output.status.success() {
        bail!("AWWW error: {}", String::from_utf8_lossy(&output.stderr));
    }

    // Not all fields are valid UTF-8, but the one we care about always is
    let stdout = String::from_utf8_lossy(&output.stdout);

    Ok(stdout
        .lines()
        .filter_map(|line| {
            line.split_whitespace()
                .nth(1) // output field
                .map(|word| word.trim_end_matches(':').to_owned())
        })
        .collect())
}

fn fetch_wallpaper_paths(args: &Args, num_displays: usize) -> Vec<PathBuf> {
    // https://codeberg.org/LGFae/awww
    const IMAGE_EXTS: &[&str] = &[
        "jpg", "jpeg", "jxl", "jpegxl", "png", "gif", "pnm", "tga", "tiff", "webp", "bmp",
        "farbfeld", "svg",
    ];

    let mut wallpaper_paths: Vec<_> = WalkDir::new(&args.directory)
        .into_iter()
        .filter_entry(|entry| args.include_hidden || !is_hidden(entry))
        .inspect(|res| {
            if let Err(e) = res {
                eprintln!("Error reading file: {e}");
            }
        })
        .filter_map(Result::ok)
        .filter(|entry| entry.file_type().is_file())
        .map(DirEntry::into_path)
        .filter(|path| {
            args.include_odd_extensions
                || path
                    .extension()
                    .and_then(|ext| ext.to_str())
                    .map(|ext| IMAGE_EXTS.iter().any(|&e| ext.eq_ignore_ascii_case(e)))
                    .unwrap_or(false)
        })
        .collect();

    if wallpaper_paths.is_empty() {
        return Vec::new();
    }

    // First shuffle to randomize which (if any) elements get duplicated.
    wallpaper_paths.shuffle(&mut rand::rng());

    // Duplicate images as many times as necessary to cover all displays, but always take at least
    // one of every image.
    let num_wallpapers = wallpaper_paths.len();
    let mut wallpaper_paths: Vec<_> = wallpaper_paths
        .into_iter()
        .cycle()
        .take(num_displays.max(num_wallpapers))
        .collect();

    // Prevent cycle patterns. If we don't do this, certain monitors would always get the same
    // wallpapers as each other, even though *which* wallpaper they get is different each time.
    wallpaper_paths.shuffle(&mut rand::rng());

    wallpaper_paths
}

fn update_wallpaper(img_path: &Path, display: &str) {
    let output = match Command::new("awww")
        .arg("img")
        .arg(img_path)
        .arg("--outputs")
        .arg(display)
        .output()
    {
        Ok(output) => output,
        Err(e) => {
            eprintln!("Error setting wallpaper: {e}");
            return;
        }
    };

    if !output.status.success() {
        eprintln!("AWWW error: {}", String::from_utf8_lossy(&output.stderr));
    }
}

fn is_hidden(entry: &DirEntry) -> bool {
    entry
        .file_name()
        .to_str()
        .map(|s| s.starts_with("."))
        .unwrap_or(false)
}
