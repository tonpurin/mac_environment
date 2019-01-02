" vi互換モードで動作させない
set nocompatible
" シンタックスハイライトを有効
syntax enable
" 行番号を表示
set number
" カーソルの位置表示を行う
set ruler
" 使用するエンコーディング
set encoding=utf-8
" タブをスペースに変換
set expandtab
" ファイル上のタブ文字の幅
set tabstop=4
" 自動で挿入されるインデントのスペース幅
set shiftwidth=4
" tab キーを押した時に挿入されるスペース量
set softtabstop=4
" tabとスペースを可視化(tab : >-, space : ...)
set list
set listchars=tab:>-,trail:.
" 検索結果をハイライト
set hlsearch
" インクリメンタルサーチ. １文字入力毎に検索を行う
set incsearch
" 検索パターンに大文字小文字を区別しない
set ignorecase
" 検索パターンに大文字を含んでいたら大文字小文字を区別する
set smartcase
" カーソルラインを表示する
set cursorline
" コマンドモードの補完
set wildmenu
" 保存するコマンド履歴の数
set history=5000
" カッコの対応関係を一瞬表示する
set showmatch
" マウスの有効可
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

" --------------------------------------------------------------
" ---------------------------------------------------------------

" NeoBundle (Vimプラグインの管理)
if has('vim_starting')
    " 初回起動時のみruntimepathにNeoBundleのパスを指定する
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    " NeoBundleが未インストールであればgit cloneする・・・・・・①
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install NeoBundle..."
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" インストールするVimプラグインを以下に記述
" NeoBundle自身を管理
NeoBundleFetch 'Shougo/neobundle.vim'
"----------------------------------------------------------
" ここに追加したいVimプラグインを記述する・・・・・・②

" 色んなカラースキーム
NeoBundle 'tomasr/molokai'
NeoBundle 'jnurmine/Zenburn'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'sjl/badwolf'
NeoBundle 'jacoborus/tender.vim'
" ステータスラインの表示内容強化
NeoBundle 'itchyny/lightline.vim'
" 末尾の全角と半角の空白文字を赤くハイライト
NeoBundle 'bronson/vim-trailing-whitespace'
" インデントの可視化
NeoBundle 'Yggdroot/indentLine'
" ディレクトリ可視化
NeoBundle 'scrooloose/nerdtree'

"----------------------------------------------------------
call neobundle#end()

" ファイルタイプ別のVimプラグイン/インデントを有効にする
filetype plugin indent on

" 未インストールのVimプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定・・・・・・③
NeoBundleCheck

" -----------------------------------------------------------------
" -----------------------------------------------------------------

" カラースキームの設定
colorscheme tender
set t_Co=256

" ステータスラインの設定
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示

" indentlineの設定...効かない?
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '' "use ¦, ┆ or │

" Ctrl-eでディレクトリ可視化
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
