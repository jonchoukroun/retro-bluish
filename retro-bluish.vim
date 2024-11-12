set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
set fillchars+=vert:║

let g:colors_name = "retroBluish"

let s:vmode = "gui"
let s:none = "NONE"

let s:black = "#010414"
let s:grey = "#787878"
let s:white = "#c3c3c3"
let s:blue = "#53b3f8"
let s:darkblue = "#20455f"
let s:green = "#53f8a6"
let s:cyan = "#4adfdf"
let s:purple = "#644384"
let s:magenta = "#ff57ff"

" Older
" let s:darkred = "#a80000"
" let s:darkmagenta = "#a800a8"
let s:darkyellow = "#a85700"
let s:lightblack = "#575757"
" let s:lightred = "#ff5757"
let s:lightyellow = "#ffff57"

let s:italic = "italic"
let s:bold = "bold"
let s:underline = "underline"
let s:undercurl = "undercurl"
let s:reverse = "reverse"
let s:standout = "standout"

function! s:setGroup(name, foreground, background, style)
  exe "hi! ".a:name." term=none cterm=none gui=none"
  exe "hi! ".a:name." ".s:vmode."fg=".a:foreground." ".s:vmode."bg=".a:background." ".s:vmode."=".a:style
endf

function! s:linkGroup(name, parent)
  exe "hi! def link ".a:name." ".a:parent
endf

" Helper highlight groups
call s:setGroup("PrimaryText", s:blue, s:none, s:none)
call s:setGroup("SecondaryText", s:white, s:none, s:none)
call s:setGroup("AccentText", s:cyan, s:none, s:none)
call s:setGroup("CalloutText", s:green, s:none, s:bold)
call s:setGroup("SubtleCalloutText", s:purple, s:none, s:none)
call s:setGroup("WarningText", s:magenta, s:none, s:bold)
call s:setGroup("DisabledText", s:grey, s:none, s:none)
call s:setGroup("NonText", s:darkblue, s:none, s:none)

call s:setGroup("HighlightLine", s:black, s:green, s:bold)
call s:setGroup("HighlightBlock", s:black, s:blue, s:bold)
call s:setGroup("HighlightLineCallout", s:black, s:green, s:bold)


" DEBUG: use to identify text
call s:setGroup("Debug", s:black, s:magenta, s:bold)

" Normal text; any text that matches no syntax pattern
call s:setGroup("Normal", s:blue, s:black, s:none)
call s:setGroup("Scroll", s:none, s:darkblue, s:none)
call s:setGroup("ScrollReverse", s:darkblue, s:none, s:none)
call s:setGroup("WindowBase", s:blue, s:none, s:none)

" Vim default highlight groups
call s:setGroup("ColorColumn", s:none, s:black, s:none)
call s:linkGroup("Conceal", "DisabledText")
call s:linkGroup("CurSearch", "CalloutText")
call s:linkGroup("Cursor", "Debug")
call s:linkGroup("lCursor", "Debug")
call s:linkGroup("CursorIM", "Debug")
call s:linkGroup("CursorColumn", "Scroll")
call s:linkGroup("CursorLine", "Scroll")
call s:linkGroup("Directory", "AccentText")
call s:linkGroup("EndOfBuffer", "NonText")
call s:linkGroup("TermCursor", "Debug")
call s:linkGroup("TermCursorNC", "Debug")
call s:linkGroup("ErrorMsg", "WarningText")
call s:linkGroup("WinSeparator", "HighlightBlock")
call s:linkGroup("Folded", "CalloutText")
call s:linkGroup("FoldColumn", "NonText")
call s:linkGroup("SignColumn", "NonText")
call s:linkGroup("IncSearch", "HighlightLineCallout")
call s:linkGroup("Substitute", "HighlightLineCallout")
call s:linkGroup("LineNr", "NonText")
call s:linkGroup("LineNrAbove", "NonText")
call s:linkGroup("LineNrBelow", "NonText")
call s:linkGroup("CursorLineNr", "SubtleCalloutText")
call s:linkGroup("CursorLineFold", "SubtleCalloutText")
call s:linkGroup("CursorLineSign", "SubtleCalloutText")
call s:setGroup("MatchParen", s:darkblue, s:blue, s:none)
call s:linkGroup("ModeMsg", "Debug")
call s:linkGroup("MsgSeparator", "Debug")
call s:linkGroup("MsgArea", "Debug")
call s:linkGroup("MoreMsg", "Debug")
call s:linkGroup("NormalFloat", "Debug")
" call s:setGroup("FloatBorder", s:blue, s:black, s:none)
" call s:setGroup("FloatTitle", s:grey, s:black, s:bold)
" call s:linkGroup("NormalNC", "WindowBase")
" call s:linkGroup("Pmenu", "WindowBase")
" call s:linkGroup("PmenuSel", "HighlightLine")
" call s:linkGroup("PmenuKind", "WindowBase")
" call s:linkGroup("PmenuKindSel", "HighlightLine")
" call s:linkGroup("PmenuExtra", "WindowBase")
" call s:linkGroup("PmenuExtraSel", "HighlightLine")
" call s:linkGroup("PmenuSbar", "Scroll")
" call s:linkGroup("PmenuThumb", "ScrollReverse")
" Question
" QuickFixLine
" call s:linkGroup("Search", "HighlightLine")
" SpecialKey
" SpellBad
" SpellCap
" SpellLocal
" SpellRare
" call s:linkGroup("TabLine", "WindowBase")
" call s:linkGroup("TabLineFill", "Scroll")
" call s:linkGroup("TabLineSel", "HighlightBlock")
" call s:setGroup("Title", s:magenta, s:none, s:bold)
" call s:linkGroup("Visual", "HighlightLine")
" call s:linkGroup("VisualNOS", "HighlightLine")
" call s:linkGroup("WarningMsg", "Alert")
" call s:setGroup("Whitespace", s:none, s:none, s:none)
" " Wildmenu
" call s:linkGroup("WinBarNC", "WindowBase")


" INFO Recommended group names for syntax highlighting (:help group-names)

" Comment	         any comment
call s:setGroup("Comment", s:grey, s:none, s:none)
" Constant	       any constant
call s:linkGroup("Constant", "PrimaryText")
" String           a string constant: "this is a string"
call s:linkGroup("String", "SecondaryText")
" Character        a character constant: 'c', '\n'
call s:linkGroup("Character", "WarningText")
" " Number           a number constant: 234, 0xff
" call s:linkGroup("Number", "Constant")
" " Boolean          a boolean constant: TRUE, false
" call s:linkGroup("Boolean", "Constant")
" " Float           a floating point constant: 2.3e10
" call s:linkGroup("Float", "Constant")
"
" " Identifier      any variable name
" call s:linkGroup("Identifier", "NormalTransparent")
" " Function        function name (also: methods for classes)
" call s:linkGroup("Function", "NormalTransparent")
"
" " Statement       any statement
" call s:setGroup("Statement", s:blue, s:none, s:none)
" " Operator        "sizeof", "+", "*", etc.
" call s:linkGroup("Operator", "Statement")
" " Keyword         any other keyword
" call s:linkGroup("Keyword", "Statement")
" " Conditional     if, then, else, endif, switch, etc.
" call s:linkGroup("Conditional", "Keyword")
" " Repeat          for, do, while, etc.
" call s:linkGroup("Repeat", "Keyword")
" " Label           case, default, etc.
" call s:linkGroup("Label", "Keyword")
" " Exception       try, catch, throw
" call s:linkGroup("Exception", "Keyword")
"
" " Type            int, long, char, etc.
" call s:setGroup("Type", s:blue, s:none, s:none)
" " StorageClass    static, register, volatile, etc.
" call s:linkGroup("StorageClass", "Type")
" " Structure       struct, union, enum, etc.
" call s:linkGroup("Structure", "Type")
" " Typedef         a typedef
" call s:linkGroup("Typedef", "Type")
"
" " PreProc         generic Preprocessor
" call s:setGroup("PreProc", s:green, s:none, s:none)
" " Include         preprocessor #include
" call s:linkGroup("Include", "PreProc")
" " Define          preprocessor #define
" call s:linkGroup("Define", "PreProc")
" " Macro           same as Define
" call s:linkGroup("Macro", "PreProc")
" " PreCondit       preprocessor #if, #else, #endif, etc.
" call s:linkGroup("PreCondit", "PreProc")
"
" " Special         any special symbol
" call s:setGroup("Special", s:cyan, s:none, s:none)
" " SpecialChar     special character in a constant
" call s:linkGroup("SpecialChar", "Special")
" " Tag             you can use CTRL-] on this
" call s:linkGroup("Tag", "Special")
" " Delimiter       character that needs attention
" call s:setGroup("Delimiter", s:green, s:none, s:none)
" " SpecialComment  special things inside a comment
" call s:linkGroup("SpecialComment", "Special")
" " Debug           debugging statements
" call s:linkGroup("Debug", "Special")
"
" " Underlined      text that stands out, HTML links
" call s:linkGroup("Underlined", "NormalTransparent")
"
" " Ignore          left blank, hidden  |hl-Ignore|
" call s:linkGroup("Ignore", "NormalTransparent")
"
" " Error           any erroneous construct
" call s:linkGroup("Error", "NormalTransparent")
"
" " Todo            anything that needs extra attention; mostly the keywords TODO FIXME and XXX
" call s:setGroup("Todo", s:magenta, s:none, s:none)
"
" " " Notify          notification UI for noice & nvim-notify
" " call s:setGroup("NotifyBody", s:cyan, s:none, s:none)
" " call s:linkGroup("NotifyERRORBody", "NotifyBody")
" " call s:linkGroup("NotifyWARNBody", "NotifyBody")
" " call s:linkGroup("NotifyINFOBody", "NotifyBody")
" " call s:linkGroup("NotifyDEBUGBody", "NotifyBody")
" " call s:linkGroup("NotifyTRACEBody", "NotifyBody")
" "
" " call s:setGroup("NotifyBorder", s:cyan, s:none, s:none)
" " call s:linkGroup("NotifyERRORBorder", "NotifyBorder")
" " call s:linkGroup("NotifyWARNBorder", "NotifyBorder")
" " call s:linkGroup("NotifyINFOBorder", "NotifyBorder")
" " call s:linkGroup("NotifyDEBUGBorder", "NotifyBorder")
" " call s:linkGroup("NotifyTRACEBorder", "NotifyBorder")
" "
" " call s:setGroup("NotifyERRORIcon", s:magenta, s:none, s:none)
" " call s:setGroup("NotifyERRORTitle", s:magenta, s:none, s:none)
" " call s:setGroup("NotifyWARNIcon", s:magenta, s:none, s:none)
" " call s:setGroup("NotifyWARNTitle", s:magenta, s:none, s:none)
" " call s:setGroup("NotifyINFOIcon", s:purple, s:none, s:none)
" " call s:setGroup("NotifyINFOTitle", s:purple, s:none, s:none)
" " call s:setGroup("NotifyDEBUGIcon", s:darkgreen, s:none, s:none)
" " call s:setGroup("NotifyDEBUGTitle", s:darkgreen, s:none, s:none)
" " call s:setGroup("NotifyTRACEIcon", s:darkgreen, s:none, s:none)
" " call s:setGroup("NotifyTRACETitle", s:darkgreen, s:none, s:none)
    
