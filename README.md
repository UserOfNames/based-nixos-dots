My NixOS dotfiles. Nothing too special.

# Hosts
Host files are for enabling/disabling modules for a particular machine, as well as machine-specific options and packages.  
- **nyx** - Main desktop.  

# Modules
Modules are options that are reused between multiple machines. Can be toggled in host files using:  
`module-<module name>.enable = <boolean>`  
Self-explanatory modules aren't elaborated on here.  
This structure is likely to change.  
- **system** - Basic system options for all machines. Includes essentials like zsh, bootloader, network, etc.  
    - **security** - For *local* security-related settings. Network security (e.g. firewall, fail2ban) are handled in **network** instead.  
- **utilities** - Productivity software such as git and neovim.  
- **desktop** - Software that isn't strictly productive. Includes explicitly recreational software such as steam, but also some mixed software such as firefox.  
