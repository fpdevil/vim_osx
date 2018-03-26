                                VIM CONFIGURATION
                                -----------------

This is my personal `vim` and `macvim` configuration, with plugins for all technologies
over which I work or play.

The `vimrc` file should be easy to understand and contains almost everything with explanatory comments.
The configuration is split across 4 files

- The main vim configuration file `vimrc`
- `core_settings.vim` containing all the editor specific settings
- `bundled_plugins.vim` containing the list of plugins
- `plugin_settings.vim` containing the custom settings for installed plugins.

# Installation
----------------
```sh
        git clone https://github.com/fpdevil/vimrc.git .vim
        ln -s .vim/vimrc .vimrc
        vim +PlugInstall +qall
        cd ~/.vim/plugged/vimproc.vim && make # this step is not needed now
```

for `Haskell` install the ghc-mod package
```haskell
        cabal -v install ghc-mod
```

### YouCompleteMe for `cpp` and `python3` completion using `macvim`

>YouCompleteMe was installed using the homebrew set `python3` with `macvim`. Configuration in the `.vimrc` was updated to pick the `ycm` configuration only for `macvim`. The following steps were taken to install and configure `ycm`.

>*Update the `.vimrc` configuration file with the below entry in the plugins sections*

```vim
if has("gui_running")
    Plug 'valloric/youcompleteme', { 'for': ['cpp','python']  }
endif
```

Open `macvim` or `gvim` and run `:PlugInstall`

>for installing the ycm plugin, once the plugin is downloaded via `vim-plug`  to the
>appropriate location switch to `.vim/plugged/youcompleteme` and set the environment
>variable as follows this variable is needed for building the ycm

```bash
export EXTRA_CMAKE_ARGS="-DEXTERNAL_LIBCLANG_PATH=/Library/Developer/CommandLineTools/usr/lib/libclang.dylib"
```

> In case if pre-built llvm libraries for Mac OSX are downloaded from the official sources
> available as archive at <http://releases.llvm.org/4.0.1/clang+llvm-4.0.1-x86_64-apple-darwin.tar.xz>
> and extracted to some convenient location like `/opt/software`, we may use the below exporting

```bash
export EXTRA_CMAKE_ARGS="-DEXTERNAL_LIBCLANG_PATH=/opt/software/clang+llvm-3.9.0-x86_64-apple-darwin/lib/libclang.dylib"
```

> Now the following can be used for the actual build process

```bash

# execute the python installation script using the python3 binary as below
# any additional language options can be provided here as flags

python3 ./install.py --clang-completer --system-libclang

or

python3 ./install.py --clang-completer --system-libclang --gocode-completer --tern-complete

```

- Wait for the build to complete and ensure that its a success as shown below, else check the error message

```bash
Searching Python 3.6 libraries...
Found Python library: /usr/local/opt/python3/Frameworks/Python.framework/Versions/3.6/lib/python3.6/config-3.6m-darwin/libpython3.6.dylib
Found Python headers folder: /usr/local/Cellar/python3/3.6.1/Frameworks/Python.framework/Versions/3.6/include/python3.6m
-- The C compiler identification is AppleClang 8.1.0.8020042
-- The CXX compiler identification is AppleClang 8.1.0.8020042
-- Check for working C compiler: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc
-- Check for working C compiler: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++
-- Check for working CXX compiler: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Detecting CXX compile features - done
...
.....
.......

Scanning dependencies of target ycm_core
[ 83%] Building CXX object ycm/CMakeFiles/ycm_core.dir/Candidate.cpp.o
[ 84%] Building CXX object ycm/CMakeFiles/ycm_core.dir/CandidateRepository.cpp.o
[ 85%] Building CXX object ycm/CMakeFiles/ycm_core.dir/ClangCompleter/ClangCompleter.cpp.o
[ 85%] Building CXX object ycm/CMakeFiles/ycm_core.dir/ClangCompleter/ClangHelpers.cpp.o
[ 86%] Building CXX object ycm/CMakeFiles/ycm_core.dir/ClangCompleter/ClangUtils.cpp.o
[ 88%] Building CXX object ycm/CMakeFiles/ycm_core.dir/ClangCompleter/CompilationDatabase.cpp.o
[ 88%] Building CXX object ycm/CMakeFiles/ycm_core.dir/ClangCompleter/CompletionData.cpp.o
[ 89%] Building CXX object ycm/CMakeFiles/ycm_core.dir/ClangCompleter/Documentation.cpp.o
[ 89%] Building CXX object ycm/CMakeFiles/ycm_core.dir/ClangCompleter/Range.cpp.o
[ 90%] Building CXX object ycm/CMakeFiles/ycm_core.dir/ClangCompleter/TranslationUnit.cpp.o
[ 91%] Building CXX object ycm/CMakeFiles/ycm_core.dir/ClangCompleter/TranslationUnitStore.cpp.o
[ 91%] Building CXX object ycm/CMakeFiles/ycm_core.dir/CustomAssert.cpp.o
[ 92%] Building CXX object ycm/CMakeFiles/ycm_core.dir/IdentifierCompleter.cpp.o
[ 94%] Building CXX object ycm/CMakeFiles/ycm_core.dir/IdentifierDatabase.cpp.o
[ 94%] Building CXX object ycm/CMakeFiles/ycm_core.dir/IdentifierUtils.cpp.o
[ 95%] Building CXX object ycm/CMakeFiles/ycm_core.dir/LetterNode.cpp.o
[ 95%] Building CXX object ycm/CMakeFiles/ycm_core.dir/LetterNodeListMap.cpp.o
[ 96%] Building CXX object ycm/CMakeFiles/ycm_core.dir/PythonSupport.cpp.o
[ 97%] Building CXX object ycm/CMakeFiles/ycm_core.dir/Result.cpp.o
[ 97%] Building CXX object ycm/CMakeFiles/ycm_core.dir/Utils.cpp.o
[ 98%] Building CXX object ycm/CMakeFiles/ycm_core.dir/versioning.cpp.o
[100%] Building CXX object ycm/CMakeFiles/ycm_core.dir/ycm_core.cpp.o
[100%] Linking CXX shared library /Users/username/.vim/plugged/youcompleteme/third_party/ycmd/ycm_core.so
[100%] Built target ycm_core
```

- Fire up `vim` and check the Plugins status as below

`:PlugStatus`

This should show the status of each plugin.

![alt text](screenshots/vimshot.png "A plugin status screenshot")

- Haskell syntax highlighting and real-time checking will be shown as below

![alt text](screenshots/haskell.png "A haskell syntax highlighting screenshot")

- MacVim JavaScript Auto-Completion and real-time checking with Tern Completion and YouCompleteMe

![alt text](screenshots/javascript.png "A JavaScript auto-completion and syntax highlight screenshot")

- Erlang Auto-Completion and real-time syntax checking with VimErl plugin

![alt text](screenshots/erlang.png "An erlang auto-completion and syntax highlighting screenshot")

- Jedi provides auto-completion and real-time syntax checking in association with neocomplete. A simple suggestion pop-up using Ctrl-Space of jedi in a python buffer will look as under

![alt text](screenshots/python.png "Python auto-completion and syntax highlighting in action")


