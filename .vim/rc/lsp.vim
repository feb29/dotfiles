if empty(globpath(&rtp, 'autoload/lsp'))
    finish
endif

" set foldmethod=expr
"   \ foldexpr=lsp#ui#vim#folding#foldexpr()
"   \ foldtext=lsp#ui#vim#folding#foldtext()

let g:lsp_diagnostics_enabled       = 1
let g:lsp_diagnostics_echo_cursor   = 1
let g:lsp_text_edit_enabled         = 1
let g:lsp_signs_error               = {'text': '✘'}
let g:lsp_signs_warning             = {'text': '⚠'}
let g:asyncomplete_auto_popup       = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay      = 100

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    nmap <silent><buffer>gd  <Plug>(lsp-definition)
    nmap <silent><buffer>gt  <Plug>(lsp-type-definition)
    nmap <silent><buffer>gr  <Plug>(lsp-references)
    nmap <silent><buffer>gi  <Plug>(lsp-implementation)

    nmap <silent><buffer>[g  <Plug>(lsp-previous-diagnostic)
    nmap <silent><buffer>]g  <Plug>(lsp-next-diagnostic)
    nmap <silent><buffer>[e  <plug>(lsp-previous-error)
    nmap <silent><buffer>]e  <plug>(lsp-next-error)

    nmap <silent><buffer>K   <Plug>(lsp-peek-definition)

    nmap <silent><buffer><f2> <Plug>(lsp-rename)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" force refresh completion
imap <C-space> <Plug>(asyncomplete_force_refresh)
