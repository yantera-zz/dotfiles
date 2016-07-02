"---------------------------------------------NeoBundle------------------------------------------------"
"filetype off
"filetype plugin indent off

" プラグインのセットアップ
if has('vim_starting')
    set nocompatible               " Be iMproved
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" ...省略

"ツリー
NeoBundle 'scrooloose/nerdtree'
"隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1

" デフォルトでツリーを表示させる
"autocmd VimEnter * execute 'NERDTree'

"まとめてコメントアウト
NeoBundle 'tomtom/tcomment_vim'

" 履歴管理
NeoBundle 'sjl/gundo.vim'

"コデック(変数名検索)
NeoBundle 'koron/codic-vim'

"ファイル管理
NeoBundle 'rking/ag.vim'
NeoBundle 'Shougo/neomru.vim'

" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

" ヤンク履歴利用
NeoBundle 'vim-scripts/YankRing.vim'

"カラースキーマ
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'jeffreyiacono/vim-colors-wombat'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/Lucius'
NeoBundle 'vim-scripts/Zenburn'
NeoBundle 'mrkn/mrkn256.vim'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'therubymug/vim-pyte'
NeoBundle 'tomasr/molokai'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'gmist/vim-palette'
NeoBundle "vim-scripts/mayansmoke"
NeoBundle "chriskempson/tomorrow-theme"
NeoBundle "morhetz/gruvbox"
NeoBundle 'pasela/edark.vim'
NeoBundle 'ujihisa/unite-colorscheme'

" カラースキーム一覧表示に Unite.vim を使う
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'

"-----HTML-----"
NeoBundle 'mattn/emmet-vim'
NeoBundle 'othree/html5.vim'

"-----MarkDown-----"
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

"-----シンタックスチェック-----"
NeoBundle 'scrooloose/syntastic'

"-----テキスト-----"
NeoBundle 'HybridText'

"-----入力補完機能-----"
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

NeoBundle 'jpalardy/vim-slime'

NeoBundle 'Lokaltog/vim-powerline'

"-----コメント-----"
NeoBundle 'scrooloose/nerdcommenter.git'

"-----タグ補完-----"
NeoBundle 'Townk/vim-autoclose'

"-----テキストオブジェクトの拡張-----"
NeoBundle 'tpope/vim-surround'

"-----ソースコードの整形-----"
NeoBundle 'junegunn/vim-easy-align'

"-----javascript補助-----"
NeoBundle 'pangloss/vim-javascript'

"-----ログの内容を色づけ-----"
NeoBundle 'vim-scripts/AnsiEsc.vim'

"-----slimのカラー-----"
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'slim-template/vim-slim'

"-----rails用-----"
NeoBundle 'tpope/vim-rails'

"-----ruby用-----"
NeoBundle 'tpope/vim-endwise'

"----文法チェック-----"
NeoBundle 'ngmy/vim-rubocop'

"----nginx.confを色付け-----"
NeoBundle 'vim-scripts/nginx.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"--------------------------------------------------------------------------------------------------------------------------------------------"

"-----行番号を記述-----"
set number

"-----backspaceを使用可能にする-----"
set backspace=start,eol,indent

"-----文字エンコーディングの設定-----"
"set encoding=utf8

"-----インデントやタブの設定-----"
set expandtab               "TABキーを押した際にタブ文字の代わりにスペースをいれる
set tabstop=2               "画面上でタブ文字が占める幅
set softtabstop=2           "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set smarttab                "行頭の余白内で Tabを打ち込むと、'shiftwidth' の数だけインデントする
set list                    "TABの可視化
set listchars=tab:>-        "TABの表示文字を変える
set autoindent              "改行時に半角スペース８文字を自動挿入する
set shiftwidth=2            "オートインデント時にインデントする文字数
set smartindent             "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

"-----表示画面の設定-----"
" let g:htbrid_use_iTerm_colors = 1
" let g:hybrid_use_Xresources = 1
set background=dark
let g:seoul256_background = 236
" let g:badwolf_darkgutter = 1
colorscheme seoul256          "カラースキーマの変更
" colorscheme hybrid          "カラースキーマの変更
"set t_ut= to disable Background Color Erase
syntax on
set hlsearch                "検索結果をハイライト表示
set wildmenu                "ファイルリスト上で上キーを押すと、上のディレクトリに移動できる。
set title                   "画面の枠に編集中のファイル名の表示
set showmatch               "対応する括弧やブレースを表示
set matchtime=1	            "対応する括弧を表示する時間
setf html                   "htmlを色分けする
set ruler                   "カーソルが何行目の何列目に置かれているかを表示する"
"set cursorline              "行のステータスラインの表示
"set cursorcolumn            "列のステータスラインの表示
set showcmd
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"-----検索-----"
set incsearch               " 検索ワードの最初の文字を入力した時点で検索を開始する "
set noignorecase            " 大文字と小文字を区別しない
set smartcase               " 小文字のみで検索したときに大文字小文字を無視する "
set wrapscan                " 最後尾まで検索を終えたら次の検索で先頭に移る
set hidden                  " 保存されていないファイルがあるときでも別のファイルを開けるようにする "
set infercase               " 補完の際の大文字小文字の区別しない

"-----文字コードの判別-----"
set encoding=utf-8
set fileencodings=utf-8

"-----スワップファイル無効-----"
set noswapfile

"-----コピペで階段状にしない-----"
set pastetoggle=<C-E>

"-----nginx.confにデフォルトで色を付ける
set ft=nginx

"-----矢印キー封印-----"
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

"-----括弧-----"
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
" inoremap / //<LEFT>

"-----MarkDownの設定-----"
"au BufRead,BufNewFile *.md set filetype=markdown
"let g:previm_open_cmd = 'open -a Firefox'
" -------------------- QuickRun ----------------------------- "
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
    \   'outputter': 'browser'
    \ }
" カレントウィンドウにのみ罫線を引く
"augroup cch
"    autocmd! cch
"    autocmd WinLeave * set nocursorline
"    autocmd WinEnter,BufRead * set cursorline
"augroup END

":hi clear CursorLine
":hi CursorLine gui=underline
"highlight CursorLine ctermbg=black guibg=black

"-----エイリアスの設定-----"
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <S-h> <C-w><
nnoremap <S-j> <C-w>+
nnoremap <S-k> <C-w>-
nnoremap <S-l> <C-w>>
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap sn gt
nnoremap sp gT

"-----カラースキーマの切り替え-----
nnoremap <silent><F9>   :<C-u>call ColorRoller.roll()<CR>
nnoremap <silent><F8> :<C-u>call ColorRoller.unroll()<CR>
nnoremap <silent> [unite]c :<C-u>Unite colorscheme<CR>

"-----入力モード時、ステータスラインのカラーを変更-----"
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

"-----全角スペースを視覚化-----"
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse
    "guifg=red
endfunction

"-----行末の空白削除-----"
autocmd BufWritePre * :%s/\s\+$//ge

"行末のスペースの可視化
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

 "-----マウスが使える-----"
"set mouse=a
"set ttymouse=xterm2

"-----neocomplcache-----"
"Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

"------vimの色を変更する-----
let ColorRoller = {}
let ColorRoller.colors = [
      \ 'darkdot',
      \ 'molokai',
      \ '256-jungle',
      \ 'Tomorrow-Night',
      \ 'tomorrow-night-eighties',
      \ 'burnttoast256',
      \ 'hybrid',
      \ 'seoul256',
      \ 'zenburn',
      \ 'ambient',
      \ 'termpot',
      \ 'swamplight',
      \ 'shobogenzo',
      \ 'nightsky',
      \ 'herokudoc',
      \ 'baobaozhu',
      \ 'badwolf',
      \ ]

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

 " SuperTab like snippets behavior.
 imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)"
 \: pumvisible() ? "\<C-n>" : "\<TAB>"
 smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)"
 \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

function! ColorRoller.change()
  let color = get(self.colors, 0)
  " tabpagecolorscheme を使用している場合は↓の "colorscheme" を "Tcolorscheme" に変える。
  silent exe "colorscheme " . color
  redraw
  echo self.colors
endfunction

function! ColorRoller.roll()
  let item = remove(self.colors, 0)
  call insert(self.colors, item, len(self.colors))
  call self.change()
endfunction

function! ColorRoller.unroll()
  let item = remove(self.colors, -1)
  call insert(self.colors, item, 0)
  call self.change()
endfunction

if !exists('loaded_matchit')
  " matchitを有効化
  runtime macros/matchit.vim
endif

"-------------------------------------------------------------------------------
"" HybridText（textハイライト用）
"-------------------------------------------------------------------------------
"autocm BufEnter * if &filetype == "" || &filetype == "text" | setlocal
"ft=hybrid | endif

filetype plugin indent on
