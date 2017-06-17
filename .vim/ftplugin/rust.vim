""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Config for rust.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rustfmt_command = 'rustup run nightly rustfmt'
" Run rustfmt on save
let g:rustfmt_autosave = 1
" Enable folding
let g:rust_fold = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Config for racer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden
" let g:racer_cmd = "~/.cargo/bin/racer"
let $RUST_SRC_PATH="/usr/src/rust/src/"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Configure YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_rust_src_path = '/usr/src/rust/src'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Configure Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_rust_checkers = ['rustc']
