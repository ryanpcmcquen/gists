test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

export NODE_EXTRA_CA_CERTS='/usr/local/etc/openssl/cert.pem'

set -U EDITOR subl -w
set -U VISUAL subl -w

source "$HOME/.config/fish/secrets.fish"

set -gx ENGAGE_IMGATCH_SERVICE false

set -gx LDFLAGS "-L/usr/local/opt/node@12/lib"
set -gx CPPFLAGS "-I/usr/local/opt/node@12/include"

set -g fish_user_paths "$HOME/.sdkman/candidates/gradle/current/bin" $fish_user_paths

set -g fish_user_paths "/usr/local/opt/node@12/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/php@7.3/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/php@7.3/sbin" $fish_user_paths

set -g fish_user_paths "/usr/local/opt/tomcat@8/bin" $fish_user_paths

set -g fish_user_paths "/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/bin" $fish_user_paths

set -gx JAVA_HOME "/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"

export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"

set -g fish_user_paths "$HOME/Library/Android/sdk/platform-tools" $fish_user_paths
set -g fish_user_paths "$HOME/Library/Android/sdk/cmdline-tools/latest/bin" $fish_user_paths

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
