scriptencoding utf-8

function! iferr#ifErr() abort
  let bpos = wordcount()['cursor_bytes']
  let out = systemlist('iferr -pos ' . bpos, bufnr('%'))
  if len(out) == 1
    return
  endif
  let pos = getcurpos()
  call append(pos[1], out)
  silent normal! j=2j
  call setpos('.', pos)
  silent normal! 4j
endfunction
