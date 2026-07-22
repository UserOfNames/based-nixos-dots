use std::{io, path::PathBuf, time::Duration};

use clap::Parser;
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

    /// Interval, in seconds, between wallpaper switches
    #[arg(short, long)]
    interval: u64,
}

fn main() -> io::Result<()> {
    #[cfg(windows)]
    panic!("Windows is not supported");

    let args = Args::parse();

    let interval = Duration::from_secs(args.interval);

    let paths: Vec<PathBuf> = WalkDir::new(&args.directory)
        .into_iter()
        .filter_entry(|e| !is_hidden(e))
        .inspect(|res| {
            if let Err(e) = res {
                eprintln!("Error reading file: {e}");
            }
        })
        .filter_map(|e| e.ok())
        .filter(|e| !e.file_type().is_dir())
        .map(|e| e.into_path())
        .collect();

    Ok(())
}

fn is_hidden(entry: &DirEntry) -> bool {
    entry
        .file_name()
        .to_str()
        .map(|s| s.starts_with("."))
        .unwrap_or(false)
}
