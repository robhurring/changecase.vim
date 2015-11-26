if exists('g:changecase_loaded')
  finish
end

let g:changecase_loaded = 1

function! s:OpMixedCase(type)
  call g:changecase#replace(a:type, 'changecase#mixedcase')
endfunction

function! s:OpSnakeCase(type)
  call g:changecase#replace(a:type, 'changecase#snakecase')
endfunction

function! s:OpCamelCase(type)
  call g:changecase#replace(a:type, 'changecase#camelcase')
endfunction

function! s:OpDashCase(type)
  call g:changecase#replace(a:type, 'changecase#dashcase')
endfunction

function! s:OpDotCase(type)
  call g:changecase#replace(a:type, 'changecase#dotcase')
endfunction

" Operator-Pending Mappings
nnoremap <Plug>(op-changecase-mixedcase) :set opfunc=<SID>OpMixedCase<CR>g@
nnoremap <Plug>(op-changecase-snakecase) :set opfunc=<SID>OpSnakeCase<CR>g@
nnoremap <Plug>(op-changecase-camelcase) :set opfunc=<SID>OpCamelCase<CR>g@
nnoremap <Plug>(op-changecase-dashcase) :set opfunc=<SID>OpDashCase<CR>g@
nnoremap <Plug>(op-changecase-dotcase) :set opfunc=<SID>OpDotCase<CR>g@

" Mappings
nnoremap <Plug>(changecase-snakecase) :call changecase#snakecase(<cWORD>)<CR>
nnoremap <Plug>(changecase-mixedcase) :call changecasehelpers#mixedcase(<cWORD>)<CR>
nnoremap <Plug>(changecase-camelcase) :call changecasehelpers#camelcase(<cWORD>)<CR>
nnoremap <Plug>(changecase-dashcase) :call changecasehelpers#dashcase(<cWORD>)<CR>
nnoremap <Plug>(changecase-dotcase) :call changecasehelpers#dotcase(<cWORD>)<CR>
