if ( exists('g:loaded_ctrlp_rel') && g:loaded_ctrlp_rel)
  \ || v:version < 700 || &cp
  finish
endif
let g:loaded_ctrlp_rel = 1

call add(g:ctrlp_ext_vars, {
  \ 'init': 'ctrlp#rel#init(s:crbufnr)',
  \ 'accept': 'ctrlp#acceptfile',
  \ 'lname': 'related files',
  \ 'sname': 'rel',
  \ 'type': 'path',
  \ 'sort': 0,
  \ 'specinput': 0,
  \ })

function! ctrlp#rel#init(bufnr)
  let results = []
  let files = ctrlp#files()
  let name = substitute(fnamemodify(bufname(a:bufnr), ":t"), '\..*', '', '')
  for file in files
    if fnamemodify(file, ':t') =~ name | call add(results, file) | endif
  endfor
  return results
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#rel#id()
  return s:id
endfunction
