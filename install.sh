#git submodule add git://github.com/tpope/vim-pathogen.git bundle/Pathogen
git submodule add https://github.com/tpope/vim-pathogen.git bundle/Pathogen
git submodule add https://github.com/derekwyatt/vim-scala.git bundle/Scala
git submodule add https://github.com/vim-scripts/taglist.vim.git bundle/Taglist
git submodule add https://github.com/vim-scripts/minibufexpl.vim.git bundle/Minibufexpl
git submodule add https://github.com/vim-scripts/winmanager.git bundle/WinManager
git submodule add https://github.com/vim-scripts/OmniCppComplete.git bundle/OmniCppComplete
git submodule add https://github.com/scrooloose/nerdtree bundle/NerdTree
git submodule add https://github.com/Shougo/neocomplcache.vim.git bundle/NeoComplCache
git submodule add https://github.com/vim-scripts/a.vim.git bundle/A
git submodule add https://github.com/terryma/vim-multiple-cursors.git bundle/MultipleCursors
git submodule add https://github.com/vim-scripts/DoxygenToolkit.vim.git bundle/DoxygenToolkit
git submodule add https://github.com/scrooloose/nerdcommenter.git bundle/NerdCommenter
git submodule add https://github.com/vim-scripts/Visual-Mark.git bundle/VisualMark
git submodule add https://github.com/vim-scripts/Mark.git bundle/Mark

git submodule foreach git pull origin master
git submodule init
git submodule update
#git rm bundle/vim-xxx
#git push origin master
#git remote set-url origin https://marsishandsome@github.com/marsishandsome/vim.git

