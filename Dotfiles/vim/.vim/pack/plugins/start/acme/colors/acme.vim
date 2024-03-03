highlight clear 

let g:colors_name = "acme"

" for cterm, 'black' might get overwritten by the terminal emulator, so we use
" 232 (#080808), which is close enough.

hi Normal guibg=#ffffea guifg=#000000 ctermbg=230 ctermfg=232 
hi NonText guibg=bg guifg=#ffffea ctermbg=bg ctermfg=230
hi StatusLine guibg=#aeeeee guifg=#000000 gui=NONE ctermbg=159 ctermfg=232 cterm=NONE
hi StatusLineNC guibg=#eaffff guifg=#000000 gui=NONE ctermbg=194 ctermfg=232 cterm=NONE
hi WildMenu guibg=#000000 guifg=#eaffff gui=NONE ctermbg=black ctermfg=159 cterm=NONE
hi VertSplit guibg=#ffffea guifg=#000000 gui=NONE ctermbg=159 ctermfg=232 cterm=NONE
hi Folded guibg=#cccc7c guifg=fg gui=italic ctermbg=187 ctermfg=fg cterm=italic
hi FoldColumn guibg=#fcfcce guifg=fg ctermbg=229 ctermfg=fg
hi Conceal guibg=bg guifg=fg gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
hi LineNr guibg=bg guifg=#505050 gui=italic ctermbg=bg ctermfg=239 cterm=italic
hi Visual guibg=fg guifg=bg ctermbg=fg ctermfg=bg
hi CursorLine guibg=#ffffca guifg=fg ctermbg=230 ctermfg=fg
hi Pmenu guibg=bg guifg=fg ctermbg=bg ctermfg=fg
hi PmenuSel guibg=fg guifg=bg ctermbg=fg ctermfg=bg

hi Statement guibg=bg guifg=fg gui=italic ctermbg=bg ctermfg=fg cterm=italic
hi Identifier guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
hi Type guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
hi PreProc guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
hi Constant guibg=bg guifg=#101010 gui=bold ctermbg=bg ctermfg=233 cterm=italic
hi Comment guibg=bg guifg=#303030 gui=italic ctermbg=bg ctermfg=236 cterm=italic
hi Special guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
hi SpecialKey guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
hi NonText guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
hi Directory guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
hi link Title Directory
hi link MoreMsg Comment
hi link Question Comment

" vim
hi link vimFunction Identifier
