Add this to the Cmder enviro settings:

```
set CC=clang
set CXX=clang++
alias git="C:\Program Files\Sublime Merge\Git\cmd\git.exe" $*
```

Here's what all the settings should be for enviro when you are done:

```
set PATH=%ConEmuBaseDir%\Scripts;%PATH%

# set ConEmuPromptNames=NO
# set ConEmuPromptNL=NO
# set ConEmuSudoSplit=NO
# set ConEmuSudoConfirm=NO

# set LANG=ru_RU.utf8
# set LANG=ru_RU.CP1251

# alias cdc=cd /d "%ConEmuDir%"
# alias cd~=cd /d "%UserProfile%"
# alias gl=git-log
# alias glb=git-log --branches --date-order

set CC=clang
set CXX=clang++
alias git="C:\Program Files\Sublime Merge\Git\cmd\git.exe" $*
```
