test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

set -gx NODE_EXTRA_CA_CERTS '/usr/local/etc/openssl/cert.pem'

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

set -gx ANDROID_SDK_ROOT "$HOME/Library/Android/sdk"

set -g fish_user_paths "$HOME/Library/Android/sdk/platform-tools" $fish_user_paths
set -g fish_user_paths "$HOME/Library/Android/sdk/cmdline-tools/latest/bin" $fish_user_paths

set -gx ANDROID_HOME "$HOME/Library/Android/sdk"
set -gx PATH "$PATH:$ANDROID_HOME/emulator"
set -gx PATH "$PATH:$ANDROID_HOME/tools"
set -gx PATH "$PATH:$ANDROID_HOME/tools/bin"
set -gx PATH "$PATH:$ANDROID_HOME/platform-tools"
