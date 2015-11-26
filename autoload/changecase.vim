" Yanked from vim-abolish
" https://github.com/tpope/vim-abolish/blob/master/plugin/abolish.vim#L107-L139

function! g:changecase#mixedcase(word)
  return substitute(g:changecase#camelcase(a:word),'^.','\u&','')
endfunction

function! g:changecase#camelcase(word)
  let word = substitute(a:word, '-', '_', 'g')
  if word !~# '_' && word =~# '\l'
    return substitute(word,'^.','\l&','')
  else
    return substitute(word,'\C\(_\)\=\(.\)','\=submatch(1)==""?tolower(submatch(2)) : toupper(submatch(2))','g')
  endif
endfunction

function! g:changecase#snakecase(word)
  let word = substitute(a:word,'::','/','g')
  let word = substitute(word,'\(\u\+\)\(\u\l\)','\1_\2','g')
  let word = substitute(word,'\(\l\|\d\)\(\u\)','\1_\2','g')
  let word = substitute(word,'[.-]','_','g')
  let word = tolower(word)
  return word
endfunction

function! g:changecase#dashcase(word)
  return substitute(g:changecase#snakecase(a:word),'_','-','g')
endfunction

function! g:changecase#dotcase(word)
  return substitute(g:changecase#snakecase(a:word),'_','.','g')
endfunction

function! g:changecase#replace(type, func)
  let sel_save = &selection
  let &selection = 'inclusive'
  let reg_save = @@

  if a:type == 'line'
    silent exe "normal! '[V']y"
  elseif a:type == 'block'
    silent exe "normal! `[\<C-V>`]y"
  else
    silent exe "normal! `[v`]y"
  endif

  call setreg('@@', function(a:func)(@@))
  exe 'normal! gv""p'

  let &selection = sel_save
  let @@ = reg_save
endfunction
