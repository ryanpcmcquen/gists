Add this to `user_profile.cmd`:

```
pushd "%UserProfile%\code"
alias git="C:\Program Files\Sublime Merge\Git\cmd\git.exe" $*
```

Or add to start menu, don't forget to rename pc first!

See below for `%CMDER_ROOT%\config\profile.d\user_startup.cmd`.
