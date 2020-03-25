if empty(globpath(&rtp, 'autoload/jsonnet.vim'))
    finish
endif

let g:jsonnet_fmt_on_save = 0
