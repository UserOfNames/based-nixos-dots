# Mappings list  
Custom mappings are assigned in their respsective plugin files, except general maps which are in mappings.lua.  
Mapleader is space. Most mappings use <leader> then two keys, the first of which (I will call this the gateway key) groups maps with similar purposes. Some important mappings are instead one keystroke, or one after <leader>.  
**Single key:**  
- **<Enter>** - Create new line below.  
  
**<leader>:**  
- **Single key after leader:**  
	- **u** - Open undotree.  
  
- **g** - General mappings gateway.  
	- **s** - Toggle spellcheck.  
  
- **t** - Terminal mappings gateway. Escape automatically exits terminal mode (while in terminal mode). Uses floaterm.  
	- **t** - Toggle terminal window.  
	- **n** - New floaterm instance.  
	- **h** - Previous floaterm instance.  
	- **l** - Previous floaterm instance.  
  
- **f** - File mappings gateway.  
	- **t** - Open oil.nvim.  
	- **f** - Telescope file search.  
	- **g** - Telescope git search.  
	- **s** - Telescope string search.  
	- **b** - Telescope buffer search.  

**Splits:** - Hold alt. Controls splits.  
- **hjkl** - Move through splits.  
- **HJKL** - Resize splits. Directions correspond to size change, not direction (e.g. H always decreases size).  
- **v** - Create vertical split.  
- **s** - Create horizontal split.  
- **x** - Swap splits.  
