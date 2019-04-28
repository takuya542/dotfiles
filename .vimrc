"Basic"

set shell=/bin/bash\ -l\ -O\ expand_aliases   "エイリアス読み込み"
set backspace=indent,eol,start
set ruler
set laststatus=2
set cmdheight=2
set mouse=a
set encoding=utf8
set modifiable
set write
syntax on
set number
set title
set showcmd
set showmatch
set matchtime=3
set laststatus=2
set clipboard+=unnamed
set clipboard+=autoselect
set guioptions+=a

"色関連"
colorscheme desert
set background=dark

"エンコード"
set encoding=UTF8
set fileencodings=utf-8,euc-jp,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,

set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set laststatus=2


"行末の空白文字を可視化
highlight WhitespaceEOL cterm=underline ctermbg=red guibg=#FF0000

set cursorline   "カレント行のハイライト"
set cursorcolumn

"タブ設定"
set expandtab      "ハードタブ指定"
set tabstop=4      "タブ入力を複数の空白文字に置き換える"
set shiftwidth=4   "画面上でタブ文字が占める幅
set softtabstop=4  "自動インデントでずれる幅
set autoindent     "連続した空白に対してタブやバックスペiースースキーでカーソルが動く幅
set smartindent    "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

set list           "タブ、空白文字を可視化
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%

"バックアップ、スワップファイルなし設定
set nobackup
set noswapfile

"vim上にブランチ名表示"
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

set nocompatible
filetype off

"vundle-プラグインの場所指定
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
let $GIT_SSL_NO_VERIFY = 'true'

" :BundleInstall  : インストール
" :BundleInstall! : アップデート

" プラグイン自体はgit管理していない。Vundle.vimのみsubmoduleとして管理
" 手順：https://github.com/takuya542/dotfiles/blob/master/README.md

" vimproc(silver search使うのに必要)は別途makeする必要あり
" 手順：https://github.com/takuya542/dotfiles/blob/master/README.md

Bundle 'hotchpotch/perldoc-vim'
Bundle 'Shougo/neocomplcache.git'
Bundle 'Shougo/neosnippet.git'
Bundle 'Shougo/neosnippet-snippets'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neomru.vim'
Bundle 'thinca/vim-quickrun'
Bundle 'sudo.vim'
Bundle 'Source-Explorer-srcexpl.vim'
Bundle 'trinity.vim'
Bundle 'Shougo/vimfiler'
Bundle 'vim-scripts/JSON.vim'
Bundle 'rking/ag.vim'

"自動syntaxチェック"
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'

"perl用syntax"
Bundle 'petdance/vim-perl'

"html,css,jsのsyntax"
Bundle 'hail2u/vim-css3-syntax'
Bundle 'taichouchou2/html5.vim'
Bundle 'jelera/vim-javascript-syntax'

"terraformのsyntax check
Bundle 'hashivim/vim-terraform'

filetyp plugin indent on


au BufWinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')
au WinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')

"行頭のTAB文字を可視化"
highlight TabString ctermbg=red guibg=red
au BufWinEnter * let w:m2 = matchadd("TabString", '^\t+')
au WinEnter * let w:m2 = matchadd("TabString", '^\t+')

"全角スペースの表示"
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=#666666
au BufWinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
au WinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')


highlight CursorLine ctermbg=Black
highlight CursorLine ctermfg=Blue

highlight CursorColumn ctermbg=Blue
highlight CursorColumn ctermfg=Green



"全角スペースを視覚化"
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/


"キーマッピング"
"nnoremap:ノーマルモード時のキーマッピング設定
"inoremap:挿入モード時のキーマッピング設定
"vnoremap:ビジュアルモード時のキーマッピング設定
"
"nnoremapとnmapの違い
"   noreあり:vimの既存キーバインドに新たに別のキーを割り当てる事.ex:)  inoremap jj <Esc>                Esc(エスケープ)をjjと押しても同じにする意味
"   noreなし:ユーザが新たにキーバインドを割り当てる事.           ex:)  nmap <Leader>r <plug>(quickrun)  \+rでプラグイン起動

"検索結果を画面中央に固定"
map n nzz
map N Nzz
map * *zz
map # #zz

"括弧、カンマ等補完"
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

"設定ファイル呼び出しキーマッピング"
noremap gv :tabnew ~/.vimrc<CR>
noremap gs :tabnew ~/.vim/snippets/perl.snip<CR>
noremap al :tabnew ~/.bash_alias<CR>
noremap af :tabnew ~/.bash_function<CR>

"デフォルトのsnippetsファイルディレクトリ"
noremap gq :tabnew ~/.vim/bundle/neosnippet-snippets/neosnippets<CR>

"設定ファイルのリロード"
nnoremap gr  :source ~/.vimrc<CR>
nnoremap bpp :source ~/.bash_profile<CR>
nnoremap brr :source ~/.bashrc<CR>

"Unite関連"
noremap <C-N> :Unite file/new<CR>
noremap <C-E> :Unite -buffer-name=file file<CR>
noremap <C-Z> :Unite file_mru<CR>
noremap <C-G> :Unite file_rec<CR>
nnoremap <C-Y> :<C-u>Unite history/yank<CR>


"挿入モード時に,Ctr+(ノーマルモード時の移動コマンド)で移動する為のキーマッピング
inoremap <C-e> <END>
inoremap <C-a> <HOME>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"挿入モードからノーマルモードへ戻る(Escの再割当)
inoremap jj <Esc>

"quickrun ( perlスクリプトをその場で実行可能。キーバインド＝\+r )
nmap <Leader>r <plug>(quickrun)

"perltidy"
map ,pt :%! perltidy
map ,pp :s/	/    /g
map ,pv <Esc>:'<,'>! perltidy -se<CR>


" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 4
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

"syntaxエラーチェック用"
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

"perlのsyntaxチェックはdefalutではないので、明示する必要あり"
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker']

"syntax check for terraform(保存時に自動でterraform fmtしてくれる)
let g:terraform_fmt_on_save = 1

 " Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Select with <TAB>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"


" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'






"uniteファイル分割
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('split')    "ファイル上で、ウインドウを上下に分割して開く"
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('vsplit')   "ファイル上で、ウインドウを左右に分割して開く"

"unite.vim操作用"
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200


"vim保存時のアクション"
""autocmd BufWritePre * :!sudo apachectl restart;
""autocmd BufWritePre * :%s/\s\+$//ge


".tや.psgi拡張子でシンタックスハイライトを有効にする"
augroup filetypedetect
autocmd! BufNewFile,BufRead *.t setf perl
autocmd! BufNewFile,BufRead *.psgi setf perl
autocmd! BufNewFile,BufRead *.tt setf tt2html *.html.ep
augroup END


"perl拡張子でファイル作成時にデフォルトで指定したテンプレ内容を入れる"
autocmd BufNewFile *.pl 0r $HOME/.vim/template/perl-script.txt
autocmd BufNewFile *.t  0r $HOME/.vim/template/perl-test.t


"filetype
filetype plugin indent on
au BufNewFile,BufRead *.js   set filetype=javascript
au BufNewFile,BufRead *.t    set filetype=perl
au BufNewFile,BufRead *.mt   set filetype=html
au BufNewFile,BufRead *.tx   set filetype=html
au BufNewFile,BufRead *.txt  set filetype=html
au BufNewFile,BufRead *.sub  set filetype=html
au BufNewFile,BufRead *.html.ep  set filetype=html
au BufNewFile,BufRead *.ctp  set filetype=html
au BufRead,BufNewFile *.psgi set filetype=perl
au BufRead,BufNewFile *.json set filetype=json"


"autocmd FileType perl set tags=$HOME/tags
set tags=$HOME/perl.tags


" jshint
let g:syntastic_json_checkers       = ['jsonlint']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes':  ['json', 'javascript', 'perl', 'php', 'ruby', 'html'],
            \ 'passive_filetypes': [] }
""let g:syntastic_auto_loc_list = 1


syntax enable
let g:quickrun_config={}

"JS
autocmd BufNewFile,BufRead *.js  set tabstop=2 shiftwidth=2 expandtab

"JSON
autocmd BufNewFile,BufRead *.json  set filetype=json
autocmd BufNewFile,BufRead *.json  set tabstop=2 shiftwidth=2 expandtab

"Jade
autocmd BufNewFile,BufRead *.jade  setf jade
autocmd BufNewFile,BufRead *.jade  set tabstop=2 shiftwidth=2 expandtab
let g:quickrun_config['jade']={'command': 'jade', 'cmdopt': '-P', 'exec': ['%c &o < %s']}

"stylus
autocmd BufNewFile,BufRead *.styl  setf stylus
autocmd BufNewFile,BufRead *.styl  set tabstop=2 shiftwidth=2 expandtab
let g:quickrun_config['stylus']={'command': 'stylus', 'exec': ['%c < %s']}



"the silver sercher"
"normalモード時に,fで起動。単語入力
"単語上でカーソル合わせ,ffで、Pattern: 単語 の状態で起動
"ag使っているので、外したい対象は~/.agignoreに追加する
"カレントディレクトリを起点に検索

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,f  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,ff :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif



" for snippets

" 独自snippetファイルのロード
" *デフォルトのsnippetsは dotfiles/.vim/bundle/neosnippet-snippets/neosnippets/以下にそれぞれの言語毎に入っている
"
let g:neocomplcache_snippets_dir = "~/.vim/snippets"
let g:neosnippet#snippets_directory = "~/.vim/snippets"

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default'    : '',
    \ 'perl'       : $HOME . '/.vim/dict/perl.dict'
    \ }

" <TAB>: completion
noremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>	pumvisible() ? "\<C-p>" : "\<S-TAB>"

    " スニペットで補完対象が出た際のキーバインド.(Ctr + k). 連続して押す事で
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

"SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#jumpable() ?"\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ?"\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

