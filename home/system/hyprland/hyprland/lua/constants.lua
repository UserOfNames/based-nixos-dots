-- TODO: Inject these from Nix
local terminal = "kitty"
local dmenu = "bemenu"

return {
   terminal = terminal,
   browser = "firefox",
   editor = terminal.." -e nvim",
   file_manager = terminal.." -e yazi",
   dmenu = dmenu,
   launcher = "j4-dmenu-desktop --dmenu="..dmenu.." --term "..terminal.." --no-generic",
   task_manager = terminal.." -e btop",
}
