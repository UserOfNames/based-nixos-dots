use std::{
    io::{self, BufWriter, Write},
    path::{Path, PathBuf},
    process::{Command, ExitCode},
};

use clap::{Args, Parser, Subcommand};

#[derive(Debug, Parser)]
#[command(name = "nix-utils", about = "NixOS system utility wrapper")]
struct CliArgs {
    #[command(subcommand)]
    command: Commands,
}

#[derive(Debug, Subcommand)]
enum Commands {
    /// Rebuild the NixOS system
    #[command(alias = "rb")]
    Rebuild {
        /// Update flake inputs before rebuilding
        #[arg(short, long)]
        update: bool,
    },

    /// Update flake inputs
    #[command(alias = "up")]
    Update,

    /// List installed packages in the Nix store
    #[command(alias = "ls")]
    List(ListArgs),
}

#[derive(Debug, Args)]
struct ListArgs {
    /// Show package sizes: (size, closure size)
    #[arg(short, long)]
    sizes: bool,

    /// Show package hashes
    #[arg(short, long)]
    hashes: bool,

    /// Search package names for the given string
    #[arg(short, long)]
    filter: Option<String>,
}

fn main() -> ExitCode {
    #[cfg(windows)]
    panic!("Windows is not supported");

    let args = CliArgs::parse();

    let os_dots_path: PathBuf = std::env::var_os("OS_DOTS_PATH")
        .expect("This is always provided by the Nix-generated wrapper")
        .into();

    match args.command {
        Commands::Rebuild { update } => rebuild(update, &os_dots_path),
        Commands::Update => update(&os_dots_path),
        Commands::List(list_args) => list(list_args),
    }
    .err()
    .unwrap_or(ExitCode::SUCCESS)
}

fn rebuild(update: bool, os_dots_path: &Path) -> Result<(), ExitCode> {
    if update {
        crate::update(os_dots_path)?;
    }

    let status = Command::new("nixos-rebuild")
        .arg("switch")
        .arg("--flake")
        .arg(os_dots_path)
        .arg("--sudo")
        .status()
        .expect("Failed to execute `nixos-rebuild`");

    if !status.success() {
        eprintln!("Error: nixos-rebuild failed!");
        let code = status.code().unwrap_or(1) as u8;
        return Err(ExitCode::from(code));
    }

    Ok(())
}

fn update(os_dots_path: &Path) -> Result<(), ExitCode> {
    let status = Command::new("nix")
        .arg("flake")
        .arg("update")
        .arg("--flake")
        .arg(os_dots_path)
        .status()
        .expect("Failed to execute `nix flake update`");

    if !status.success() {
        eprintln!("Error: flake update failed!");
        let code = status.code().unwrap_or(1) as u8;
        return Err(ExitCode::from(code));
    }

    Ok(())
}

fn list(args: ListArgs) -> Result<(), ExitCode> {
    let mut command = Command::new("nix");
    command.args(["path-info", "/run/current-system", "--recursive"]);

    if args.sizes {
        command
            .arg("--size")
            .arg("--closure-size")
            .arg("--human-readable");
    }

    let output = command.output().expect("Failed to execute `nix path-info`");

    let status = output.status;

    if !status.success() {
        eprintln!("Error: `nix path-info` failed:");
        eprintln!("{}", String::from_utf8_lossy(&output.stderr).trim());
        let code = status.code().unwrap_or(1) as u8;
        return Err(ExitCode::from(code));
    }

    let stdout = std::str::from_utf8(&output.stdout).expect("Nix output was not valid UTF-8");

    let mut lines: Vec<_> = stdout
        .lines()
        .filter_map(|line| line.split_once('-'))
        .filter(|(_, right_side)| {
            args.filter.as_ref().is_none_or(|filter_str| {
                right_side
                    .split_whitespace()
                    .next()
                    .unwrap_or(right_side)
                    .contains(filter_str)
            })
        })
        .collect();

    lines.sort_unstable_by_key(|&(_, right_side)| right_side);

    let mut lock = BufWriter::new(io::stdout().lock());
    for (hash_part, right_side) in lines {
        let res = if args.hashes {
            writeln!(lock, "{}-{}", hash_part, right_side)
        } else {
            writeln!(lock, "{}", right_side)
        };

        // If writing fails (e.g. the user piped to `head`, which closed the stdout pipe), just
        // break the loop and let the program exit gracefully.
        if res.is_err() {
            break;
        }
    }

    Ok(())
}
