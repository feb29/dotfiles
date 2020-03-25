if empty(globpath(&rtp, 'autoload/easy_align.vim'))
    finish
endif

vmap <Enter> <Plug>(EasyAlign)
