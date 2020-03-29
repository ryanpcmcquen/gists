## Remember to rename your PC before doing anything!

## Shortcut setup:
1. Make a shortcut in `"%AppData%\Microsoft\Windows\Start Menu\Programs"` to Cmder that opens in your preferred directory, for example:

```
%UserProfile%\code
```

2. Add this to your environment:

```
alias git="C:\Program Files\Sublime Merge\Git\cmd\git.exe" $*
```

## No shortcut setup:

Add this to `user_profile.cmd`:

```
pushd "%UserProfile%\code"
alias git="C:\Program Files\Sublime Merge\Git\cmd\git.exe" $*
```

See below for `%CMDER_ROOT%\config\profile.d\user_startup.cmd`.
