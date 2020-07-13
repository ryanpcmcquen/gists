#!/usr/bin/env bash
wget -N https://gist.githubusercontent.com/ryanpcmcquen/d0f0a265dde5cfdbd8b49d126083da6a/raw/hey_dude.sh -P /usr/local/bin/ && chmod +x /usr/local/bin/hey_dude.sh
for dir in $(find ~/code -maxdepth 1 -type d); do
    cd $dir
    echo $dir
    git pull --all
    cd
done
brew update && brew upgrade

npm update -g
npm i -g npm

pip freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U
pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U

sudo gem update -- --with-openssl-dir="$(brew --prefix openssl)"

curl -o ~/.osx https://gist.githubusercontent.com/ryanpcmcquen/d0f0a265dde5cfdbd8b49d126083da6a/raw/.osx && bash ~/.osx
