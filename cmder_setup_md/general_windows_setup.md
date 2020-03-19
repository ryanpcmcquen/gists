### SSH/GIT setup:

Head to: Services > OpenSSH Authentication Agent
Set Startup type to 'Automatic' and start the service.
Set `GIT_SSH` equal to the result of `where ssh`.
Run `ssh-add -l` to see keys.
Run `ssh-add PATH_TO_KEY` to add your key to the agent.

### Enviro:

`PATH`:

```
%UserProfile%\bin
C:\Program Files\Sublime Text 3
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
