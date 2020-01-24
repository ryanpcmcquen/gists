test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

export NODE_EXTRA_CA_CERTS='/usr/local/etc/openssl/cert.pem'

set -U EDITOR subl -w
set -U VISUAL subl -w

source "$HOME/.config/fish/secrets.fish"

set -gx ENGAGE_IMGATCH_SERVICE false

set -gx LDFLAGS "-L/usr/local/opt/node@12/lib"
set -gx CPPFLAGS "-I/usr/local/opt/node@12/include"

set -g fish_user_paths "/usr/local/opt/node@12/bin" $fish_user_paths
