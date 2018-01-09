""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" LaTeX imaps using UltiSnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Really these should be in a ftplugin for LaTeX.
inoremap <silent> __ __<c-r>=UltiSnips#Anon('_{$1}$0', '__', '', 'i')<cr>
inoremap <silent> ^^ ^^<c-r>=UltiSnips#Anon('^{$1}$0', '^^', '', 'i')<cr>
inoremap <silent> `2 `2<c-r>=UltiSnips#Anon('\sqrt{$1}$0', '`2', '', 'i')<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable callbacks to remove a warning
" https://github.com/lervag/vimtex/issues/791
" https://github.com/lervag/vimtex/issues/852
let g:vimtex_compiler_latexmk = {'callback' : 0}
