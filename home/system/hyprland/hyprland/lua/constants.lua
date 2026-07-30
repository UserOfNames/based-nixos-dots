-- TODO: Inject these from Nix
local terminal = "kitty"

return {
   terminal = terminal,
   browser = "firefox",
   editor = terminal.." -e nvim",
   file_manager = terminal.." -e yazi",
   launcher = "fuzzel",
   task_manager = terminal.." -e btop",
}
