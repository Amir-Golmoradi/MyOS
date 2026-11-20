function lv --description 'Launch the isolated LazyVim development environment'
    env NVIM_APPNAME=lazyvim KOTLIN_LSP_DIR=$HOME/.local/opt/lv-kotlin-lsp/current nvim $argv
end
