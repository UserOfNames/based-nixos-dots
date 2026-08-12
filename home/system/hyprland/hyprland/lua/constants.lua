local terminal = "kitty"

return {
   terminal = terminal,
   browser = "firefox",
   editor = terminal .. " -e nvim",
   file_manager = terminal .. " -e yazi",
   launcher = "fuzzel",
   task_manager = terminal .. " -e btop",
   clipboard_history = terminal .. " --class='stash-tui' -e stash list"
}
