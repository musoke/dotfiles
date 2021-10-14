// Hide the title and main toolbar
$([IPython.events]).on("app_initialized.NotebookApp", function () {
    $('div#header-container').hide();
    $('div#maintoolbar').hide();
});

// jupyter-vim config
require([
  'nbextensions/vim_binding/vim_binding',   // depends your installation
], function() {
  // // Swap j/k and gj/gk (Note that <Plug> mappings)
  // CodeMirror.Vim.map("j", "<Plug>(vim-binding-gj)", "normal");
  // CodeMirror.Vim.map("k", "<Plug>(vim-binding-gk)", "normal");
  // CodeMirror.Vim.map("gj", "<Plug>(vim-binding-j)", "normal");
  // CodeMirror.Vim.map("gk", "<Plug>(vim-binding-k)", "normal");
  // Map "jk" and "kj" to esc in vim mode
  CodeMirror.Vim.map("jk", "<Esc>", "insert");
});
