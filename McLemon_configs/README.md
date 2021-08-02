Daily update:
```
brew update; brew upgrade; npm update -g; ls ~/code | where type == Dir | each { cd $it.name; git remote -v; git branch; git pull --all; cd ~/code }; echo y | bit complete;
```