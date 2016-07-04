This is my personal vim configuration, with plugins for all technologies
over which I work or play.

The `vimrc` file should be easy to understand and contains almost everything.

# Install

        git clone https://github.com/singamsetty/vimrc.git .vim
        ln -s .vim/vimrc .vimrc
        vim +PlugInstall +qall
        cd ~/.vim/plugged/vimproc.vim && make

for Haskell install the ghc-mod package
```haskell
        cabal install ghc-mod
```

Fire up vim and check the Plugins as below
:PlugStatus
This should show the status of each plugin
![alt text](screenshots/vimshot.png "A plugin status screenshot")
