if empty(globpath(&rtp, 'autoload/editorconfig.vim'))
    finish
endif

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
