set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
set fillchars+=vert:║

let g:colors_name = "retro-bluish"

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
call s:setGroup("HiddenText", s:darkblue, s:none, s:none)

call s:setGroup("HighlightLine", s:black, s:green, s:bold)
call s:setGroup("HighlightBlock", s:black, s:blue, s:bold)
call s:setGroup("ReverseBackdrop", s:white, s:darkblue, s:none)

" DEBUG: use to identify text
call s:setGroup("Debug", s:black, s:magenta, s:bold)

" Normal text; any text that matches no syntax pattern
call s:setGroup("Scroll", s:none, s:darkblue, s:none)
call s:setGroup("ScrollReverse", s:none, s:darkblue, s:none)
call s:setGroup("WindowBase", s:blue, s:none, s:none)

" Vim default highlight groups
call s:setGroup("ColorColumn", s:none, s:black, s:none)
call s:linkGroup("Conceal", "DisabledText")
call s:linkGroup("CurSearch", "CalloutText")
call s:linkGroup("Cursor", "HighlightLine")
call s:linkGroup("lCursor", "HighlightLine")
call s:linkGroup("CursorIM", "HighlightLine")
call s:linkGroup("CursorColumn", "Debug")
call s:setGroup("CursorLine", s:none, s:none, s:underline)
call s:linkGroup("Directory", "AccentText")
call s:linkGroup("EndOfBuffer", "NonText")
call s:linkGroup("TermCursor", "Debug")
call s:linkGroup("TermCursorNC", "Debug")
call s:linkGroup("ErrorMsg", "WarningText")
call s:linkGroup("WinSeparator", "HighlightBlock")
call s:linkGroup("Folded", "CalloutText")
call s:linkGroup("FoldColumn", "NonText")
call s:linkGroup("SignColumn", "NonText")
call s:linkGroup("IncSearch", "HighlightLine")
call s:linkGroup("Substitute", "HighlightLine")
call s:linkGroup("LineNr", "NonText")
call s:linkGroup("LineNrAbove", "NonText")
call s:linkGroup("LineNrBelow", "NonText")
call s:linkGroup("CursorLineNr", "SubtleCalloutText")
call s:linkGroup("CursorLineFold", "SubtleCalloutText")
call s:linkGroup("CursorLineSign", "SubtleCalloutText")
call s:setGroup("MatchParen", s:darkblue, s:blue, s:none)
call s:linkGroup("ModeMsg", "Debug")
call s:linkGroup("MsgArea", "CalloutText")
call s:linkGroup("MsgSeparator", "Debug")
call s:linkGroup("MoreMsg", "Debug")
call s:linkGroup("NonText", "HiddenText")
call s:setGroup("Normal", s:blue, s:black, s:none)
" Need to break out the index at the top
call s:setGroup("NormalFloat", s:none, s:none, s:none)
call s:setGroup("FloatBorder", s:none, s:none, s:none)
call s:linkGroup("FloatTitle", "Debug")
call s:linkGroup("FloatFooter", "Debug")
call s:linkGroup("NormalNC", "Normal")
call s:linkGroup("Pmenu", "PrimaryText")
call s:linkGroup("PmenuSel", "HighlightBlock")
" call s:linkGroup("PmenuKind", "Debug")
" call s:linkGroup("PmenuKindSel", "Debug")
call s:linkGroup("PmenuExtra", "HighlightBlock")
call s:linkGroup("PmenuExtraSel", "HighlightLine")
" call s:linkGroup("PmenuSbar", "Debug")
" call s:linkGroup("PmenuThumb", "Debug")
call s:linkGroup("Question", "Debug")
call s:linkGroup("QuickFixLine", "Debug")
call s:linkGroup("Search", "HighlightLine")
call s:linkGroup("SnippetTabstop", "Debug")
" SpecialKey
" SpellBad
" SpellCap
" SpellLocal
" SpellRare
call s:linkGroup("StatusLine", "HighlightBlock")
call s:linkGroup("StatusLineNC", "CalloutText")
call s:linkGroup("TabLine", "HiddenText")
call s:linkGroup("TabLineFill", "HiddenText")
" call s:linkGroup("TabLineSel", "HighlightBlock")
call s:linkGroup("Title", "Debug")
call s:linkGroup("Visual", "HighlightBlock")
" call s:linkGroup("VisualNOS", "HighlightLine")
call s:linkGroup("WarningMsg", "WarningText")
call s:setGroup("Whitespace", s:none, s:none, s:none)
" " Wildmenu
call s:linkGroup("WinBar", "PrimaryText")
call s:linkGroup("WinBarNC", "SubtleCalloutText")

" INFO Recommended group names for syntax highlighting (:help group-names)

" Comment	         any comment
call s:linkGroup("Comment", "DisabledText")
" Constant	       any constant
call s:linkGroup("Constant", "PrimaryText")
" String           a string constant: "this is a string"
call s:linkGroup("String", "CalloutText")
" Character        a character constant: 'c', '\n'
call s:linkGroup("Character", "CalloutText")
" Number           a number constant: 234, 0xff
call s:linkGroup("Number", "AccentText")
" Boolean          a boolean constant: TRUE, false
call s:linkGroup("Boolean", "PrimaryText")
" Float           a floating point constant: 2.3e10
call s:linkGroup("Float", "AccentText")

" Identifier      any variable name
call s:linkGroup("Identifier", "PrimaryText")
" Variable        variable names
call s:linkGroup("@variable.builtin", "PrimaryText")
call s:linkGroup("@variable.tmux", "PrimaryText")
" Function        function name (also: methods for classes)
call s:linkGroup("Function", "PrimaryText")
"
" Statement       any statement
call s:linkGroup("Statement", "Debug")
" Operator        "sizeof", "+", "*", etc.
call s:linkGroup("Operator", "SecondaryText")
" Keyword         any other keyword
call s:linkGroup("Keyword", "PrimaryText")
" Conditional     if, then, else, endif, switch, etc.
call s:linkGroup("Conditional", "Debug")
" Repeat          for, do, while, etc.
call s:linkGroup("Repeat", "Debug")
" Label           case, default, etc.
call s:linkGroup("Label", "Debug")
" Exception       try, catch, throw
call s:linkGroup("Exception", "Debug")

call s:setGroup("IlluminatedWordRead", s:none, s:none, s:underline)

" Type            int, long, char, etc.
call s:linkGroup("Type", "PrimaryText")
" StorageClass    static, register, volatile, etc.
call s:linkGroup("StorageClass", "Debug")
" Structure       struct, union, enum, etc.
call s:linkGroup("Structure", "SecondaryText")
" Typedef         a typedef
call s:linkGroup("Typedef", "Debug")

" PreProc         generic Preprocessor
call s:linkGroup("PreProc", "Debug")
" Include         preprocessor #include
call s:linkGroup("Include", "Debug")
" Define          preprocessor #define
call s:linkGroup("Define", "Debug")
" Macro           same as Define
call s:linkGroup("Macro", "Debug")
" PreCondit       preprocessor #if, #else, #endif, etc.
call s:linkGroup("PreCondit", "Debug")

" Special         any special symbol
call s:linkGroup("Special", "SecondaryText")
" SpecialChar     special character in a constant
call s:linkGroup("SpecialChar", "CalloutText")
" Tag             you can use CTRL-] on this
call s:linkGroup("Tag", "AccentText")
" Delimiter       character that needs attention
call s:linkGroup("Delimiter", "SecondaryText")
" SpecialComment  special things inside a comment
call s:linkGroup("SpecialComment", "SubtleCalloutText")
" Debug           debugging statements
call s:linkGroup("Debug", "Debug")

" Underlined      text that stands out, HTML links
call s:linkGroup("Underlined", "HighlightLine")
"
" Ignore          left blank, hidden  |hl-Ignore|
call s:linkGroup("Ignore", "Debug")

" Error           any erroneous construct
call s:linkGroup("Error", "Debug")

" Todo            anything that needs extra attention; mostly the keywords TODO FIXME and XXX
call s:linkGroup("Todo", "Debug")

" zsh highlight groups
call s:linkGroup( "zshSubstDelim", "CalloutText")
call s:linkGroup( "zshDeref", "CalloutText")

" Man/help pages
call s:linkGroup("manHeader", "CalloutText")
call s:linkGroup("manSectionHeading", "CalloutText")
call s:linkGroup("manReference", "CalloutText")

" Vim
call s:setGroup("@label.vim", s:none, s:none, s:none)

" Markup
call s:linkGroup("@markup.heading.git_config", "SecondaryText")
call s:linkGroup("@markup.heading.1.markdown", "CalloutText")
call s:linkGroup("@markup.heading.2.markdown", "@markup.heading.1.markdown")
call s:linkGroup("@markup.heading.3.markdown", "@markup.heading.1.markdown")
call s:linkGroup("@markup.link.label.markdown_inline", "SecondaryText")
call s:linkGroup("@markup.link.label.markdown", "SecondaryText")
call s:linkGroup("@label.markdown", "SecondaryText")
call s:linkGroup("@markup.link.markdown_inline", "HiddenText")
call s:linkGroup("@markup.link.url.markdown", "HiddenText")

" Treesitter Context
call s:linkGroup("TreesitterContextLineNumber", "DisabledText")
call s:setGroup("TreesitterContextBottom", s:none, s:none, s:underline)

" Notify          notification UI for noice & nvim-notify
call s:setGroup("NotifyError", s:magenta, s:none, s:none)
call s:setGroup("NotifyWarn", s:darkyellow, s:none, s:none)
call s:setGroup("NotifyInfo", s:blue, s:none, s:none)
call s:setGroup("NotifyDebug", s:green, s:none, s:none)
call s:setGroup("NotifyTrace", s:cyan, s:none, s:none)
call s:linkGroup("NotifyERRORBody", "NotifyError")
call s:linkGroup("NotifyWARNBody", "NotifyWarn")
call s:linkGroup("NotifyINFOBody", "NotifyInfo")
call s:linkGroup("NotifyDEBUGBody", "NotifyDebug")
call s:linkGroup("NotifyTRACEBody", "NotifyTrace")

call s:linkGroup("NotifyERRORBorder", "NotifyError")
call s:linkGroup("NotifyWARNBorder", "NotifyWarn")
call s:linkGroup("NotifyINFOBorder", "NotifyInfo")
call s:linkGroup("NotifyDEBUGBorder", "NotifyDebug")
call s:linkGroup("NotifyTRACEBorder", "NotifyTrace")

call s:linkGroup("NotifyERRORIcon", "NotifyError")
call s:linkGroup("NotifyERRORTitle", "NotifyError")
call s:linkGroup("NotifyWARNIcon", "NotifyWarn")
call s:linkGroup("NotifyWARNTitle", "NotifyWarn")
call s:linkGroup("NotifyINFOIcon", "NotifyInfo")
call s:linkGroup("NotifyINFOTitle", "NotifyInfo")
call s:linkGroup("NotifyDEBUGIcon", "NotifyDebug")
call s:linkGroup("NotifyDEBUGTitle", "NotifyDebug")
call s:linkGroup("NotifyTRACEIcon", "NotifyTrace")
call s:linkGroup("NotifyTRACETitle", "NotifyTrace")

" LazyGit
call s:linkGroup("LazyCommitType", "SecondaryText")
call s:linkGroup("LazyReasonKeys", "SecondaryText")
