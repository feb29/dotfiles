if empty(globpath(&rtp, 'autoload/rust.vim'))
    finish
endif

let g:rustfmt_autosave = 1
