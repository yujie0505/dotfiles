
# cfg

## vim

### instructions

#### motion:
##### ------------newbies-------------
* ← → ↑ ↓ 
##### ----------intermediate----------
* `b`/`B`: go to the start of the previous word/Word
* `w`/`W`: go to the start of the following word/Word
* `0`/`g0`: go to the first column of the line/current window
* `$`/`g$`: go to the end of the line/current window
* `^`  : go to the first non-blank char of line
* `gg`/`G`: **jump** to the begin/end of the file
* `<Number>G`/`<Number>gg` : **jump** to nth line
##### ------------advanced------------
* `h`/`j`/`k`/`l`: ←/↓/↑/→
* `e`/`E`: go to the end of this word/Word
* `gE` : go to the end of the previous word
* `%`  : go to the corresponding \(, \{, \[
* `*`/`#`: go to next/previous occurrence of the word under cursor
* `f<letter>` : find(go to next occurrence of the) letter
* `t<letter>` : find till(go to just before the occurrence of the) letter
* `F<letter>` : go to previous occurrence of the letter
* `T<letter>` : go to just before the occurrence of the letter before
* `;`		  : repeat the last f/t/F/T motion forward
* `,`		  : repeat the last f/t/F/T motion backward
* `H`  : **jump** to High position(place the cursor on the top of screen)
* `M`  : **jump** to Middle position(place the cursor at the middle of screen)
* `L`  : **jump** to Low position(place the cursor at the bottom of screen)
* `''` : **jump** back(to the cursor position before jumping)
* combine `<num><motion>`: Repeat [motion](#motion) num of times.
##### -------------nerds--------------
* `'<mark>`: **jump** to mark(See below)
* `g_` : go to the last non-blank char of line

#### change:
**normal** mode options
##### ------------newbies-------------
* `i`: **insert** mode under cursor
* `<ECS>`/`Ctrl+[`: back to **normal** mode
* *`yy`/`Y`: yank(copy) a line with/without last \r
* *`dd`/`D`: delete(cut) a line with/without last \r
* *`cc`/`C`: change(cut and enter **insert mode**) a line
* `p`/`P`: paste yanked or cut things under/before cursor
##### ----------intermediate----------
* `x`/`X`: cut the char under/after cursor
* `s`/`S`: cut the char under/after cursor and enter **insert** mode
* `r`  : replace the char under cursor
* `R` : enter **replace** mode
* `a`  : append(**insert**) after cursor
* `I`/`A`: insert/append(**insert before/after) the line
* `o`/`O` : open a new line below/above and enter **insert** mode
* *`<<`  : add a indent to current line
* *`>>`  : remove a indent from current line
* `v`: enter **visual**(select) mode to select part of code, then use `y` to yank(copy) the selected code
##### ------------advanced------------
* `J`  : join lines together
* *`gUU`: make the line uppercase
* *`guu`: make the line lowercase
* **Dark Magic**:
	* combine `<num><change>`: Repeat [change](#change) num of times.
	* combine `<change><adjective><position>`: For reduplicated [change](#change) marked with \*(i.g. `y`, `>`, `gU`, etc.), apply [change](#change) from cursor to position.
		* \<adjective>(optional): `i`: in, `a`: all, <num>: repeat
		* \<position>: [motion](#motion) or \<num>\<motion> or {, [, (, ), ], }
	* examples:
		- `y$` : yank from the cursor to the end of line
		- `diw`: delete in word(the word touched by cursor)
		- `ca)`: change(delete and enter insert mode) things within \( and \)(included)
		- `2d3w`: delete 3 word twice
#### command:
press \<enter> after typing
##### ------------newbies-------------
* `:w`: write(save) the file
* `:q`: quit
* `:x`: save and quit(=`:wq`)
##### ----------intermediate----------
* `:w <fileName>`: write(save) the file to fileName
* `ZZ` : save and quit
* `ZQ` : quit without saving
##### ------------advanced------------
* `.`  : repeat the last modification to the file
* `/<pattern>` : search pattern
* `//` : repeat last `/<pattern>`
* `:Ctrl+n`/`:Ctrl+p`: to select next/previous command
* `/Ctrl+n`/`/Ctrl+p`: to select next/previous search
* `:%s/<pattern A>/<pattern B>/g` : substitude all the pattern A in file by pattern B
##### -------------nerds--------------
* `:!<command>` : execute command in shell
* `:!!` : repeat last `!<command>`
* `/<pattern>/<offset>` : search pattern and place cursor on offset
* `:&<flag>` : repeat last `s/<pattern A>/<pattern B>/` with flag
* `:~<flag>` : use last `/<pattern>` as pattern A and last `:s` pattern B with flag
* `:g/<pattern>/<command>/` : execute command at lines that match pattern
* `:sh` : go to shell. come back by `$exit`
* notes:
	* `<offset>`:
		* +-n: move n lines
		* b+-n: n char from begin of word
		* e+-n: n char from end of word
	* `<flag>`:
		* `g` : apply to all matches
		* `&` : use previous flag
		* `c` : comfirm needed
		* `i` : ignore case
		* `I` : don't ignore case
	* replace string(`<pattern B>`):
		* `&` : `<pattern A>`
		* `~` : previos `<pattern B>`
		* `\<num>` : pattern within ()
##### ------------backups-------------
* `:saveas <path/to/file>` : save to `<path/to/file>`
* `<start position><command><end position>`
#### Insert:
**insert** mode options
##### ----------intermediate----------
* `Ctrl+n`/`Ctrl+p` : select next/previous option in autocomplete or trigger default autocomplete behavior
##### ------------advanced------------
* `Ctrl+x Ctrl+f`	: autocomplete for file path
* `Ctrl+x Ctrl+]`	: autocomplete for tags(REQUIRE A TAG FILE)
* `Ctrl+x Ctrl+i`	: autocomplete from this and included files
* `Ctrl+t`			: add a indent to current line
* `Ctrl+d`			: remove a indent of current line
* `Ctrl+w`			: delete word before cursor
* `Ctrl+u`			: delete line before cursor
##### -------------nerds--------------
* `Ctrl+g j`		: equivalent to `<ESC>ji`
* `Ctrl+g k`		: equivalent to `<ESC>ki`
* `Ctrl+o <command(**normal mode**)>`: equivalent to `<ESC><command>i`
* `Ctrl-r <register>`: insert from \<register>
* `Ctrl-a`: insert last text(equivalent to `^r.`)
* `Ctrl-@`: insert last text and leave insert mode(equivalent to `^a<esc>`)
#### Others:
Advanced or above
##### scroll
* `zz`/`z.`: scroll the screen so that the cursor is in the middle of the screen
* `Ctrl+d` : scroll half the screen down
* `Ctrl+u` : scroll half the screen up
* `zt`/`zb`: scroll the screen so that the cursor is in the top/bottom of the screen
##### mark
* `'"` : jump to the cursor position last exiting
* `m<letter>`: mark the line with letter
##### jump
* `Ctrl+o`: undo jumppings
* `Ctrl+i`: redo jumppings
* `Ctrl+]`: jump to definition(REQUIRE A TAG FILE)
* `Ctrl+t`: reverse previous jump-to-definition behavior(REQUIRE A TAG FILE)
##### register
* macro
	* `qa<commands>q` : record actions in the register a
	* `@a` : replay the saved actions once (same as `@@`)
	* `<number>@@` : replay the saved actions N times
* `@:` : replay last command
* `@/` : replay last search
* default
	* `"0`: last yank
	* `"<1~9>`: delete history
	* `"%`:fileName `"/`: lastest search, `":`: latest command, `".`: latest insert
	* `"*`: system clipboard
* others:
	* `"ayy`(yank(copy) the current line and store it to register a)
	* `"ap`(paste register a)
##### window
* `:new`/`:vnew`: new empty window
* `:sp <fileName>`/`:vsp <fileName>`: new window for fileName
* `Ctrl-w w` : switch to the other buffer
* `Ctrl-w k` : move the current window to top
* `Ctrl-w h` : move the current window to left
* `Ctrl-w j` : move the current window to bottom
* `Ctrl-w l` : move the current window to right
* `Ctrl-w |` : maximize window in splitted vertically
* `Ctrl-w _` : maximize window in splitted horizontally
* `Ctrl-w =` : distribute space equally for opened windows
##### fold:
* `zf`: create a fold
* `zo`: fold open
* `zc`: fold close
* `zd`: fold delete
* `zR`: open all
* `zM`: close all
##### Visual block: Edit multiple lines at the same time
* step1: press `Ctrl+v`
* step2: select multiple lines as if in visual mode
* step3: edit ONLY the first line
* step4: press `<ecs>`
* step5: be amazed
#### ref
* vim :help motion, insert, scroll, change, fold, reg, mark, ctrl-v, windows, i\_ctrl-n, etc.
* [vim tips](https://vim.fandom.com/wiki/Vim_Tips_Wiki)

### vimdiff

- launch
  - bash
	- `vimdiff [file_left] [file_right]`
	- `vim -d [file_left] [file_right]`
  - vim visual mode
	- `:vertical diffsplit [file_left]`
  - compare existing windows
	- `:windo diffthis`
- cursor
  - `]c` : move to the next difference block
  - `[c` : move to the last difference block
- merge
  - `do` : (diff get) get difference from compared file
  - `dp` : (diff put) put difference to compared file
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
  - chore	 : Changes to the build process or auxiliary tools and libraries such as documentation generation
  - docs	 : Documentation only changes
  - feat	 : A new feature (CHANGE LOG)
  - fix		 : A bug fix (CHANGE LOG)
  - refactor : A code change that neither fixes a bug or adds a feature
  - style	 : Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
  - test	 : Adding missing testing
- ref
  - [semantic git commit message](https://read01.com/Ay7dM.html)


