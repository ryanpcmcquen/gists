Need to add an inbound rule for port 6000 (TCP) on the Windows firewall. I use X410 to
get X applications to integrate with WSL2, and it seems to work well.

Some stuff for `.bashrc`:

```
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval `ssh-agent`
    ssh-add
fi

source "/home/ry/code/emsdk/emsdk_env.sh"

export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2> /dev/null):0
```

Some more deets here:
https://stackoverflow.com/a/61110604/2662028

And here:
https://github.com/cascadium/wsl-windows-toolbar-launcher#firewall-rules
