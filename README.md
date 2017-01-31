# cfg

## vim

### instructions
- useful instructions
  - cursor
    - `0`  : go to the first column
    - `$`  : go to the end of line
    - `^`  : go to the first non-blank char of line
    - `g_` : go to the last non-blank char of line
  - delete
    - `x`  : delete the char under cursor
  - files
    - `:saveas <path/to/file>` : save to `<path/to/file>`
    - `:x` : save and quit
    - `ZZ` : save and quit
  - INSERT mode
    - `i`  : insert before cursor
    - `a`  : insert after cursor
    - `cw` : replace from cursor to the end of the word
- advanced instructions
  - character
    - `gU` : uppercase
    - `gu` : lowercase
  - command
    - `.`  : repeat the last command
    - `<Number><command>` : repeat the command N times
    - `<start position><command><end position>`
  - cursor
    - `b`  : go to the start of the previous word
    - `gE` : go to tht end of the previous word
    - `w`  : go to the start of the following word
    - `e`  : go to the end of this word
    - `%`  : go to the corresponding \(, \{, \[
    - `*`  : go to next occurrence of the word under cursor
    - `#`  : go to previous occurrence of the word under cursor
    - `<Number>G` : go to nth line
- killer instructions
  - command
    - `qa<commands>q` : record actions in the register a
    - `@a` : replay the saved actions once (same as `@@`)
    - `<number>@@` : replay the saved actions N times
  - cursor
    - `f<letter>` : go to next occurrence of the letter
    - `t<letter>` : go to just before the occurrence of the letter
    - `<number><f/t><letter>` : go the nth occurrence of letter on this line
  - lines (selected block)
    - `J`  : join all lines together
    - `<`  : indent to the left
    - `>`  : indent to the right
    - `=`  : auto indent
- ref
  - [Learn Vim Progressively](http://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/)

### vimdiff
- launch
  - bash
    - `vimdiff [file_left] [file_right]`
    - `vim -d [file_left] [file_right]`
  - vim visual mode
    - `:vertical diffsplit [file_left]`
- cursor
  - `]c` : move to the next difference block
  - `[c` : move to the last difference block
- merge
  - `do` : (diff get) get difference from compared file
  - `dp` : (diff put) put difference to compared file
- window
  - `Ctrl-w w` : switch to the other file
  - `Ctrl-w K` : move the current window to top
  - `Ctrl-w H` : move the current window to left
  - `Ctrl-w J` : move the current window to bottom
  - `Ctrl-w L` : move the current window to right
- misc.
  - vim visual mode
    - `:diffupdate` : update difference between files
    - `:set diffopt=context:<number>` : change the number of lines of context in each difference block
- ref
  - [using vimdiff](https://www.ibm.com/developerworks/cn/linux/l-vimdiff/)

### Issue
- [vim is not remembering last position](http://askubuntu.com/questions/223018/vim-is-not-remembering-last-position/224908#224908)

## git
- CONFIG
  - [Git - git-config Documentation](https://git-scm.com/docs/git-config)
- push
  - `git push -u <remote name> <branch name>` : upload and track remote branch
- semantic commits
  - chore    : Changes to the build process or auxiliary tools and libraries such as documentation generation
  - docs     : Documentation only changes
  - feat     : A new feature (CHANGE LOG)
  - fix      : A bug fix (CHANGE LOG)
  - refactor : A code change that neither fixes a bug or adds a feature
  - style    : Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
  - test     : Adding missing testing
- ref
  - [semantic git commit message](https://read01.com/Ay7dM.html)
