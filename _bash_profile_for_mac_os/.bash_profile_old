parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Useful shortcut to push to all remotes:
gpa() {
    git remote | xargs -L1 git push --all
}

# Master update function:
allup() {
    npm install -g npm
    npm update -g
    # Check for pip, as I may not use it:
    if [ "`which pip`" ]; then
        pip install --upgrade pip
        # pip-review is dead! (https://github.com/nvie/pip-tools/issues/185)
        #pip-review --auto
        # This command kind of replaces pip-review:
        pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
    fi
    if [ "`which pip3`" ]; then
        # This command kind of replaces pip-review:
        pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U
    fi
    brew update
    brew upgrade
    # I don't use brew cask anymore:
    #brew cask update
    # Ruby is broken on el capitan,
    # come on apple!
    #sudo gem update --system
    #sudo gem update
    # Easy lftp script for sftp'ing:
    wget -N https://gist.githubusercontent.com/ryanpcmcquen/f9c3eb6e0a7272a31a74/raw/lf -P /usr/local/bin/
    chmod 755 /usr/local/bin/lf
    # Shortcut to use httrack:
    wget -N https://gist.githubusercontent.com/ryanpcmcquen/271d889c1a5a21029c9e/raw/htget -P /usr/local/bin/
    chmod 755 /usr/local/bin/htget
    # Script for running dig across several variations of a domain and its subdomains:
    wget -N https://gist.githubusercontent.com/ryanpcmcquen/c86608c35bd4bd014f29/raw/bigdig -P /usr/local/bin/
    chmod 755 /usr/local/bin/bigdig
    # Keep imgult up to date:
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/image-ultimator/master/imgult
    sudo install -m755 imgult /usr/local/bin/
    rm imgult
    # Right-click imgult:
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/imgult.workflow/master/imgult-all.workflow/Contents/QuickLook/Thumbnail.png -P ~/Library/Services/imgult.workflow/Contents/QuickLook/
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/imgult.workflow/master/imgult-all.workflow/Contents/Info.plist -P ~/Library/Services/imgult.workflow/Contents/
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/imgult.workflow/master/imgult-all.workflow/Contents/document.wflow -P ~/Library/Services/imgult.workflow/Contents/
    # Autogult on Desktop folder:
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/autogult.workflow/master/autogult.workflow/Contents/QuickLook/Thumbnail.png -P ~/Library/Workflows/Applications/Folder\ Actions/autogult.workflow/Contents/QuickLook/
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/autogult.workflow/master/autogult.workflow/Contents/Info.plist -P ~/Library/Workflows/Applications/Folder\ Actions/autogult.workflow/Contents/
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/autogult.workflow/master/autogult.workflow/Contents/document.wflow -P ~/Library/Workflows/Applications/Folder\ Actions/autogult.workflow/Contents/
    # Launch terminal with Ctrl + Alt + Cmd + T:
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/macHotkeys/master/launch_iTerm.workflow/Contents/QuickLook/Thumbnail.png -P ~/Library/Services/launch_iTerm.workflow/Contents/QuickLook/
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/macHotkeys/master/launch_iTerm.workflow/Contents/Info.plist -P ~/Library/Services/launch_iTerm.workflow/Contents/
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/macHotkeys/master/launch_iTerm.workflow/Contents/document.wflow -P ~/Library/Services/launch_iTerm.workflow/Contents/
    # Launch digital color meter with Ctrl + Alt + Cmd + C:
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/macHotkeys/master/launchColorMeter.workflow/Contents/QuickLook/Thumbnail.png -P ~/Library/Services/launchColorMeter.workflow/Contents/QuickLook/
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/macHotkeys/master/launchColorMeter.workflow/Contents/Info.plist -P ~/Library/Services/launchColorMeter.workflow/Contents/
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/macHotkeys/master/launchColorMeter.workflow/Contents/document.wflow -P ~/Library/Services/launchColorMeter.workflow/Contents/
    # Vim!
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.vimrc -P ~/
    # Emacs!
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.emacs -P ~/
    # Textmate config:
    wget -N https://gist.githubusercontent.com/ryanpcmcquen/b4bbf08abdd5726d7dd0/raw/.tm_properties -P ~/
    # A great html5 linter:
    wget -N https://raw.githubusercontent.com/mozilla/html5-lint/master/html5check.py -P /usr/local/bin/
    chmod 755 /usr/local/bin/html5check.py
    # atom-beautify settings:
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.jsbeautifyrc -P ~/
    # My provisioning script:
    wget -N https://gist.githubusercontent.com/ryanpcmcquen/b2e608311f286a4ab3e1/raw/.osx -P ~/
    # Increase tmux's scrollback limit:
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/tmux.conf -P ~/
    mv ~/tmux.conf ~/.tmux.conf
    # Haskell!
    curl -sSL https://get.haskellstack.org/ | sh
    # Reset to haskell-vim-now's settings:
    #ln -sf ~/.config/haskell-vim-now/.vimrc ~/
    #ln -sf ~/.config/haskell-vim-now/.vim ~/
    #curl -L https://git.io/haskell-vim-now > /tmp/haskell-vim-now.sh
    #bash /tmp/haskell-vim-now.sh
    # Maybe the most important file of all.  ;-)
    wget -N https://gist.githubusercontent.com/ryanpcmcquen/9518163/raw/.bash_profile -P ~/
}

# https://clbin.com/3JCmJ9.png
# Usage: clbin IMAGENAME(s)
clbin() {
    curl -F "clbin=@$@" https://clbin.com
}

# http://ix.io/iiQ
# Usage: ix FILENAME(s)
ix() {
    cat "$@" | curl -F 'f:1=<-' ix.io
}

# http://sprunge.us/cJOa
# Usage: spru FILENAME(s)
spru() {
    cat "$@" | curl -F 'sprunge=<-' http://sprunge.us
}

# Change to the directory with said file.
# Usage:
#   $ fcd foo.png
# Changes to directory with foo.png. :tada:
fcd() {
    cd $(dirname `find . -iname "$@"`)
}

# Extend path with any /opt/ programs:
for DIR in /opt/*/bin
    do PATH="$DIR:$PATH"
done

# Extend path with any /usr/local/ stuff, like heroku:
for DIR in /usr/local/*/bin
    do PATH="$DIR:$PATH"
done

# Add ~/bin/ to PATH only if it exists, and is not already in $PATH.
[ -d $HOME/bin/ ] && [ -z "$(echo $PATH | grep $HOME)" ] && PATH=$HOME/bin:"$PATH"

# Shouldn't this already be there?
PATH=$HOME/.local/bin:"$PATH"

export PATH="/usr/local/sbin:$PATH"

shopt -s histappend
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
export PS1='\u@\w:$(parse_git_branch)\$ '

# Make imgult re-process files:
export ENGAGE_IMGATCH_SERVICE=false

# Vim!
export EDITOR=vim

# Use a 256 color terminal,
# if in a GUI.
if [ "$DISPLAY" ]; then
    export TERM=xterm-256color
fi

# Make `imgult` always process all files:
export ENGAGE_IMGATCH_SERVICE=false

if [ -z "$TMUX" ]; then
    exec tmux -2 -u
fi
