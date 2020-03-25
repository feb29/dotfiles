if empty(globpath(&rtp, 'autoload/fzf'))
    finish
endif

let g:fzf_buffers_jump = 1 " Jump to the existing window if possible

let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit'
            \ }

function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2>/dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

nnoremap <silent><Leader>.  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent><Leader>:  :<C-u>Commands<CR>
nnoremap <silent><Leader>'  :<C-u>Marks<CR>
nnoremap <silent><Leader>/  :<C-u>BLines<CR>
nnoremap <silent><Leader>?  :<C-u>Lines<CR>

nnoremap <silent><Leader>f  :<C-u>Files<CR>
nnoremap         <Leader>d  :<C-u>Files<space>
nnoremap <silent><Leader>p  :<C-u>ProjectFiles<CR>
nnoremap <silent><Leader>;  :<C-u>History<CR>|     " open buffers and v:oldfiles
nnoremap <silent><Leader>ls :<C-u>Files %:p:h<CR>| " files existing in the same dir with the current buffer

" nnoremap         <Leader>ag :<C-u>Ag<space>
" nnoremap         <Leader>rg :<C-u>Rg<space>

" nnoremap <silent><Leader>ls :<C-u>BLines<CR>
" nnoremap <silent><Leader>LS :<C-u>Lines<CR>

" nnoremap <silent><Leader>gf :<C-u>GFiles<CR>
" nnoremap <silent><Leader>GF :<C-u>GFiles?<CR>

" nnoremap <silent><Leader>hh :<C-u>History<CR>
" nnoremap <silent><Leader>h/ :<C-u>History/<CR>
" nnoremap <silent><Leader>h: :<C-u>History:<CR>

" Replace the default dictionary completion with fzf-based fuzzy completion
" inoremap <expr><c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')
