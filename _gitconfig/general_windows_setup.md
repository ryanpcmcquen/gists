## Remember to rename your PC before doing anything!

Also, configure `git` to use LF line endings:

```
git config --global core.autocrlf false
git config --global core.eol lf
```

### General stuff:

- Remove anything you don't use under 'Background Apps'.
- Turn off extraneous items in 'Startup Apps'.
- Adjust the Windows Search Settings to only be local/classic with no tracking.
- Disable the 'Game Bar' in all the places.
- Disable 'Skype' in the task bar.
- Disable the 'Sticky Keys' and other such nonsense.
- Turn off the default 'Print Screen' handling and install Greenshot.
- Install LLVM/Clang.
- Reduce visual effects:

![Visual settings](https://gist.githubusercontent.com/ryanpcmcquen/1ccef39e0bb4c75be0d7d834b25bd6bb/raw/2021-05-30-12-55-23-Window.png)

- Set the keyboard repeat delay/rate to be short/fast:

![Keyboard settings](https://gist.githubusercontent.com/ryanpcmcquen/1ccef39e0bb4c75be0d7d834b25bd6bb/raw/Annotation%25202020-05-10%2520230623.jpg)

### SSH/GIT setup:

- Head to: _Services_ > _OpenSSH Authentication Agent_
- Set Startup type to 'Automatic' and start the service.
- Set the _system_ enviro variable `GIT_SSH` equal to
the result of `where ssh`.
- Run `ssh-add -l` to see keys.
- Run `ssh-add PATH_TO_KEY` to add your key to the agent.

### Enviro:

`PATH`:

```
%UserProfile%\bin
C:\Program Files\Sublime Text
C:\Program Files\Sublime Merge
%VCInstallDir%\Auxiliary\Build
```

`HOME`:

```
%UserProfile%
```

`CC`:

```
clang
```

`CXX`:

```
clang++
```
