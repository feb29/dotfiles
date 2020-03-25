" vim/nvim compatible alt key binding
" https://github.com/neovim/neovim/issues/5576
function! s:mkalt(key)
    if has('nvim')
        return "<A-" . a:key . ">" " <A-k>
    else
        return "<Esc>" . a:key
    endif
endfun

function! s:mapalt(m, key, action)
    exec a:m . " <silent>" . s:mkalt(a:key). " " a:action
endfun

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1
let g:tmux_navigator_no_mappings         = 1
call s:mapalt("nnoremap", "j", ":TmuxNavigateDown<CR>")
call s:mapalt("nnoremap", "k", ":TmuxNavigateUp<CR>")
call s:mapalt("nnoremap", "h", ":TmuxNavigateLeft<CR>")
call s:mapalt("nnoremap", "l", ":TmuxNavigateRight<CR>")
