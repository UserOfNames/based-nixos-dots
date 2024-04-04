My NixOS dotfiles. Nothing too special.

# Hosts
Host files are for enabling/disabling modules for a particular machine, as well as machine-specific options and packages.  
- **nyx** - Main desktop.  

# Modules
Modules are options that are reused between multiple machines. Can be toggled in host files using:  
`module-<module name>.enable = <boolean>`  
- **system** - Basic system options for all machines. Includes essentials like zsh, bootloader, network, etc.  
- **utilities** - Useful utilities such as git.  
