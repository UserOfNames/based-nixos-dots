# Mappings list  
Custom mappings are assigned in their respective plugin files, except general maps which are in mappings.lua.  
Mapleader is space. Most mappings use leader followed by two keys, the first of which (I call this the gateway key) groups maps with similar purposes. Some important/commonly used mappings are instead one keystroke, or one after leader.  
**Single key:**  
- **Enter** - Create new line below.  
  
**Leader:**  
- **Single key after leader:**  
    - **u** - Open undotree.  
  
- **m** - General mappings gateway.  
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
  
- **h** - Harpoon maps.  
    - **h** - Open harpoon menu.  
    - **a** - Add file to harpoon.  
    - **1234** - Open respective file from menu.  
  
**Splits:** - Hold alt. Controls splits.
    - **hjkl** - Move through splits.  
    - **HJKL** - Resize splits. Directions correspond to size change, not direction (e.g. H always decreases size).  
    - **v** - Create vertical split.  
    - **s** - Create horizontal split.  
    - **x** - Swap splits.  
