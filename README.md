# TYPEIT

A simple plugin to type a content char by char.
I made it as sometimes I need to record a clip
of me writing something and that's it :)


## Installation
### Lazy
```lua
{
    "0xWaleed/typeit-nvim",
    init = function()
        vim.keymap.set("n", "<leader>Ty", function() 
            require("typeit").typeit({delay = 30})
        end, {desc = "Re-type what in current buffer"})
    end
}
```

## API
### `typeit(opt)`
* `opt.delay` is the delay in between each char in milliseconds
* `opt.content` the content to be writter, when nil, it will use the current buffer content


