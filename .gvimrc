" System gvimrc file for MacVim
"
" Maintainer:	Bjorn Winckler <bjorn.winckler@gmail.com>
" Last Change:	Sun Aug 29 2009
"
" This is a work in progress.  If you feel so inclined, please help me improve
" this file.


" Make sure the '<' and 'C' flags are not included in 'cpoptions', otherwise
" <CR> would not be recognized.  See ":help 'cpoptions'".
let s:cpo_save = &cpo
set cpo&vim

set backspace+=indent,eol,start

"
" Global default options
"

if !exists("syntax_on")
  syntax on
endif

colorscheme desert

" To make tabs more readable, the label only contains the tail of the file
" name and the buffer modified flag.
set guitablabel=%M%t

" Send print jobs to Preview.app.  This does not delete the temporary ps file
" that is generated by :hardcopy.
set printexpr=system('open\ -a\ Preview\ '.v:fname_in)\ +\ v:shell_error


" This is so that HIG Cmd and Option movement mappings can be disabled by
" adding the line
"   let macvim_skip_cmd_opt_movement = 1
" to the user .vimrc
"
if !exists("macvim_skip_cmd_opt_movement")
  no   <D-Left>       <Home>
  no!  <D-Left>       <Home>
  no   <M-Left>       <C-Left>
  no!  <M-Left>       <C-Left>

  no   <D-Right>      <End>
  no!  <D-Right>      <End>
  no   <M-Right>      <C-Right>
  no!  <M-Right>      <C-Right>

  no   <D-Up>         <C-Home>
  ino  <D-Up>         <C-Home>
  map  <M-Up>         {
  imap <M-Up>         <C-o>{

  no   <D-Down>       <C-End>
  ino  <D-Down>       <C-End>
  map  <M-Down>       }
  imap <M-Down>       <C-o>}

  imap <M-BS>         <C-w>
  imap <D-BS>         <C-u>
endif " !exists("macvim_skip_cmd_opt_movement")


" This is so that the HIG shift movement related settings can be enabled by
" adding the line
"   let macvim_hig_shift_movement = 1
" to the user .vimrc (not .gvimrc!).
"
if exists("macvim_hig_shift_movement")
  " Shift + special movement key (<S-Left>, etc.) and mouse starts insert mode
  set selectmode=mouse,key
  set keymodel=startsel,stopsel

  " HIG related shift + special movement key mappings
  nn   <S-D-Left>     <S-Home>
  vn   <S-D-Left>     <S-Home>
  ino  <S-D-Left>     <S-Home>
  nn   <S-M-Left>     <S-C-Left>
  vn   <S-M-Left>     <S-C-Left>
  ino  <S-M-Left>     <S-C-Left>

  nn   <S-D-Right>    <S-End>
  vn   <S-D-Right>    <S-End>
  ino  <S-D-Right>    <S-End>
  nn   <S-M-Right>    <S-C-Right>
  vn   <S-M-Right>    <S-C-Right>
  ino  <S-M-Right>    <S-C-Right>

  nn   <S-D-Up>       <S-C-Home>
  vn   <S-D-Up>       <S-C-Home>
  ino  <S-D-Up>       <S-C-Home>

  nn   <S-D-Down>     <S-C-End>
  vn   <S-D-Down>     <S-C-End>
  ino  <S-D-Down>     <S-C-End>
endif " exists("macvim_hig_shift_movement")


" Restore the previous value of 'cpoptions'.
let &cpo = s:cpo_save
unlet s:cpo_save

set lsp=2
set guifont=Menlo:h14
set lsp=3
set lines=55 columns=200
set transparency=10
