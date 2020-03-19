Add this to `user_profile.cmd`:

```
pushd "%UserProfile%\code"
alias git="C:\Program Files\Sublime Merge\Git\cmd\git.exe" $*
```

See below for `%CMDER_ROOT%\config\profile.d\user_startup.cmd`.
