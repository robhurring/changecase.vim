# Change Case

If you want to convert between different cases easily this plugin provides a few
[operator-pending](http://learnvimscriptthehardway.stevelosh.com/chapters/15.html) functions
and regular mappings to achieve this.

## Operator-Pending

An example of setting up OP methods would be:

```viml
nmap grm <Plug>(op-changecase-mixedcase)
nmap grc <Plug>(op-changecase-camelcase)
nmap grs <Plug>(op-changecase-snakecase)
nmap grd <Plug>(op-changecase-dashcase)
```

You can now change cases with (* = cursor):

* `hello_wor*d` and type `grmaw` to get `HelloWorld`
* `hello_wor*d` and type `grdaw` to get `hello-world`
* `HelloWor*d` and type `grsaw` to get `hello_world`

## Regular mappings

If you wanted to map this instead to a regular map, you can use:

```viml
nnoremap <leader>cs <Plug>(changecase-snakecase)
nnoremap <leader>cc <Plug>(changecase-camelcase)
```

