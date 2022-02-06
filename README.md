# nvim-treesitter-frontend-textobjects

## Install

```vim
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'singlexyz/treesitter-frontend-textobjects' 
```

## Config

```lua
require'nvim-treesitter.configs'.setup {
 textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["ax"] = "@attribute.outer",
        ["ix"] = "@attribute.inner",

        ["am"] = "@import.outer",
        ["im"] = "@import.inner",

        ["at"] = "@tag.outer",

        ["a,"] = "@lhs.outer",
        ["i,"] = "@lhs.inner",
        ["a."] = "@rhs.outer",
        ["i."] = "@rhs.inner",

        ["ad"] = "@declaration.outer",
        ["id"] = "@declaration.inner",

        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["aC"] = "@class.outer",
        ["iC"] = "@class.inner",
        ["ar"] = "@call.outer",
        ["ir"] = "@call.inner",

        ["a;"] = "@block.outer",
        ["i;"] = "@block.inner",

        ["ak"] = "@key.outer",
        ["ik"] = "@key.inner",
        ["av"] = "@value.outer",
        ["iv"] = "@value.inner",
      },
    },
  },
}
```
