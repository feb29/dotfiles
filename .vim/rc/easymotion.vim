if empty(globpath(&rtp, 'autoload/easymotion.vim'))
    finish
endif

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase  = 1
let g:EasyMotion_use_upper  = 1 " Use uppercase target labels and type as a lower case

" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)

nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>t <Plug>(easymotion-t2)
