if exists("b:did_autoload_ultisnips_map_keys")
   finish
endif
let b:did_autoload_ultisnips_map_keys = 1

" The trigger used to expand a snippet.
" NOTE: expansion and forward jumping can, but needn't be the same trigger
if !exists("g:UltiSnipsExpandTrigger")
    let g:UltiSnipsExpandTrigger = "<tab>"
endif

" The trigger used to display all triggers that could possible
" match in the current position. Use empty to disable.
if !exists("g:UltiSnipsListSnippets")
    let g:UltiSnipsListSnippets = "<c-tab>"
endif

" The trigger used to jump forward to the next placeholder.
" NOTE: expansion and forward jumping can be the same trigger.
if !exists("g:UltiSnipsJumpForwardTrigger")
    let g:UltiSnipsJumpForwardTrigger = "<c-j>"
endif

" The trigger to jump backward inside a snippet
if !exists("g:UltiSnipsJumpBackwardTrigger")
    let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
endif

" Should UltiSnips unmap select mode mappings automagically?
if !exists("g:UltiSnipsRemoveSelectModeMappings")
    let g:UltiSnipsRemoveSelectModeMappings = 1
end

" If UltiSnips should remove Mappings, which should be ignored
if !exists("g:UltiSnipsMappingsToIgnore")
    let g:UltiSnipsMappingsToIgnore = []
endif

" UltiSnipsEdit will use this variable to decide if a new window
" is opened when editing. default is "normal", allowed are also
" "tabdo", "vertical", "horizontal", and "context".
if !exists("g:UltiSnipsEditSplit")
    let g:UltiSnipsEditSplit = 'normal'
endif

" A list of directory names that are searched for snippets.
if !exists("g:UltiSnipsSnippetDirectories")
    let g:UltiSnipsSnippetDirectories = [ "UltiSnips" ]
endif

" Enable or Disable snipmate snippet expansion.
if !exists("g:UltiSnipsEnableSnipMate")
    let g:UltiSnipsEnableSnipMate = 1
endif

function! UltiSnips#map_keys#MapKeys() abort
    if exists("g:UltiSnipsExpandOrJumpTrigger")
        exec "inoremap <silent> " . g:UltiSnipsExpandOrJumpTrigger . " <C-R>=UltiSnips#ExpandSnippetOrJump()<cr>"
        exec "snoremap <silent> " . g:UltiSnipsExpandOrJumpTrigger . " <Esc>:call UltiSnips#ExpandSnippetOrJump()<cr>"
    elseif exists("g:UltiSnipsJumpOrExpandTrigger")
        exec "inoremap <silent> " . g:UltiSnipsJumpOrExpandTrigger . " <C-R>=UltiSnips#JumpOrExpandSnippet()<cr>"
        exec "snoremap <silent> " . g:UltiSnipsJumpOrExpandTrigger . " <Esc>:call UltiSnips#JumpOrExpandSnippet()<cr>"
    elseif g:UltiSnipsExpandTrigger == g:UltiSnipsJumpForwardTrigger
        exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=UltiSnips#ExpandSnippetOrJump()<cr>"
        exec "snoremap <silent> " . g:UltiSnipsExpandTrigger . " <Esc>:call UltiSnips#ExpandSnippetOrJump()<cr>"
    else
        exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=UltiSnips#ExpandSnippet()<cr>"
        exec "snoremap <silent> " . g:UltiSnipsExpandTrigger . " <Esc>:call UltiSnips#ExpandSnippet()<cr>"
        exec "inoremap <silent> " . g:UltiSnipsJumpForwardTrigger . " <C-R>=UltiSnips#JumpForwards()<cr>"
        exec "snoremap <silent> " . g:UltiSnipsJumpForwardTrigger . " <Esc>:call UltiSnips#JumpForwards()<cr>"
        exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=UltiSnips#JumpBackwards()<cr>"
        exec "snoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <Esc>:call UltiSnips#JumpBackwards()<cr>"
    endif
    exec "xnoremap <silent> " . g:UltiSnipsExpandTrigger. " :call UltiSnips#SaveLastVisualSelection()<cr>gvs"
    if len(g:UltiSnipsListSnippets) > 0
       exec "inoremap <silent> " . g:UltiSnipsListSnippets . " <C-R>=UltiSnips#ListSnippets()<cr>"
       exec "snoremap <silent> " . g:UltiSnipsListSnippets . " <Esc>:call UltiSnips#ListSnippets()<cr>"
    endif

    snoremap <silent> <BS> <c-g>"_c
    snoremap <silent> <DEL> <c-g>"_c
    snoremap <silent> <c-h> <c-g>"_c
    snoremap <c-r> <c-g>"_c<c-r>
endf
