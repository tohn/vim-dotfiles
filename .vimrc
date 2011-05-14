" ~/.vimrc
" 2011 Yannic Haupenthal thedarksite.org
" github.com/tohn

" fuer deutsches Tastaturlayout um in der Hilfe bequemer zu navigieren
map <F9> <C-]>

" copy to x-clipboard
set go+=a

" Mit [F8] Automatisches Einruecken und Treppeneffekt beim Copy & Paste verhindern
set pastetoggle=<F8>

" Mit [F7] Zeilennummerierung ein/ausschalten
:nmap <F7> :set invnumber <CR>

" show numbers
set number

" autocomplete fuer klammern und co
":filetype on

"autocmd FileType mine,c,cs,cpp,java,javascript,php inoremap <buffer> { {<CR>}<C-O>O  " ???
"autocmd FileType mine,erocola,c,cs,cpp,java,javascript,php inoremap <buffer> { {}<LEFT>
"autocmd FileType mine,erocola,c,cs,cpp,java,javascript,php inoremap <buffer> [ []<Left>
"autocmd FileType mine,erocola,c,cs,cpp,java,javascript,php inoremap <buffer> " ""<Left>
"autocmd FileType mine,erocola,c,cs,cpp,java,javascript,php inoremap <buffer> < <><Left>
"autocmd FileType mine,erocola,c,cs,cpp,java,javascript,php inoremap <buffer> ( ()<Left>

" statusline
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer nummer
set statusline+=%f\                          " dateiname
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " dateityp
set statusline+=%=                           " folgendes rechts
set statusline+=0x%-8B                       " hex-wert des zeichens
set statusline+=%-14(%l,%c%V%)               " zeile, zeichen
set statusline+=%<%P                         " datei position

" show cursor position
set ruler

" mit suche am anfang fortfahren wenn ende der datei erreicht ist
set wrapscan

" zeige den befehl immer
set showcmd

" benutze autoindent
set autoindent

" expandiere tabs
"set expandtab

" wieviele leerzeichen zum einruecken
"set shiftwidth=4 " war 2

" ersetze tabs mit » und leerzeichen mit ·
" set list listchars=tab:»-,trail:·

" tabulator weite
"set tabstop=4
set ts=4
set noexpandtab
" :retab!

" wir wollen vim und nicht vi
set nocompatible

" ergebnisse schon waehrend der Suche highlighten (on the fly)
set incsearch

" verhalten der backspace-taste
set backspace=2

" syntaxhighlighting
syntax on

" faerbt suchergebnisse on the fly ein
set hlsearch

" ???
" set paste

"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

" suckless.org : ii
"map t1 :.w >> \#test/in<cr>dd
"map u1 :.w >> \#foo/in<cr>dd
"imap /me <C-V><C-A>ACTION

" mutt
au BufRead /tmp/mutt-* set tw=72

" keine swapfile anlegen
"set noswapfile

" Zeilenumbruch nach 80 Zeichen
set tw=80
"set textwidth=10
set wrapmargin=80
"set nowrap

" mappt Reformat auf ^j im Input-Mode
"map! <C-j><Esc>gqapi

" mappt Reformat auf Q im Command-Mode
"map Q gqap

" title auch in screen von http://zinformatik.de/linux/titel-von-screen-fenstern-automatisch-von-vim-bash-und-zsh-setzen/ mit verweis auf http://blog.256bit.org/archives/451-Vim-in-Screen.html
"if (&term =~ '^screen')
"set title for screen
" VimTip http://vim.wikia.com/wiki/VimTip1126
"set title t_Co=256
"set t_ts=^[k
"set t_fs=^[\
"let &titleold = fnamemodify(&shell, ":t")
"set titlelen=15
"set information for title in screen (see :h 'statusline')
"set titlestring=%t%=%<%(\ %{&encoding},[%{&modified?'+':'-'}],%p%%%)
"endif

" use other features in /usr/share/vim/vim72/vimrc_example.vim
"runtime vimrc_example.vim

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" vimcasts.org
" set list as default
set list

" toggle between list and nolist
nmap <leader>l :set list!<CR>
" set listchars
set listchars=tab:▸\ ,eol:¬

" --- COLORS ---
" Invisible Charakter Colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" swpfile auslagern
set directory=~/.vim_swp/
set backupdir=~/.vim_swp/

" http://vim.wikia.com/wiki/Fix_email_quotations_with_long_lines
"set comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-

" http://www.uninformativ.de/?ndo=single&newsid=120
" color column // erst in v7.3
set colorcolumn=80
" Umbruch
"set tw=72
" schnellere klammerpaarhervorhebung
let loaded_matchparen=1
set showmatch
" kein auto-backup
"set nobackup
" keine viminfo benutzen
"set viminfo=""
" schoenerer workflow: wartet nach escape nicht so ewig
set timeoutlen=300
" farben
hi  Normal       cterm=NONE   ctermfg=229  ctermbg=232
hi  ColorColumn  ctermbg=Black

" vimcasts.org # 29 (gist)
"inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

"function! s:align()
"  let p = '^\s*|\s.*\s|\s*$'
"  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
"    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
"    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
"    Tabularize/|/l1
"    normal! 0
"    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
"  endif
"endfunction

" vimcasts.org # 30
"nnoremap <F5> :GundoToggle<CR>

" http://zinformatik.de/tipps-tricks/interessante-programme/plugins-erweiterungen/vim-plugin-taglist-splitscreen-mit-ubersicht-der-funkionen-in-einer-datei/
"function OpenTlist()
"    let myfile = expand("%")
"    let myfiletype = expand("%:e")
"    if myfiletype == "pl" || myfiletype == "java" || myfiletype == "c" || myfile == "cpp" 
"        Tlist
"    end
"endfunction
"au BufRead * call OpenTlist()
"map <F3> :TlistToggle<cr>
"map <F4> :w<cr>:TlistUpdate<cr>
