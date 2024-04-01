My NixOS dotfiles. Nothing too special, lots of "borrowing" from other people's dotfiles.

# Hosts
Host files are for machine-specific options and enabling optional modules.
**nyx** - Main desktop.

# Modules
Modules are options that are reused between multiple machines (when I actually get multiple machines) but not all. Can be toggled in host files using `module-<module name>.enable = true`
Modules are grouped by purpose. Anything not self-explanatory will be explained here.
