test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# export PATH="/usr/local/opt/ruby/bin:/usr/local/opt/gnu-tar/libexec/gnubin:/usr/local/sbin:$PATH"

export NODE_EXTRA_CA_CERTS='/usr/local/etc/openssl/cert.pem'

set -gx LDFLAGS "-L/usr/local/opt/node@12/lib"
set -gx CPPFLAGS "-I/usr/local/opt/node@12/include"

set -U EDITOR subl -w
set -U VISUAL subl -w

source "$HOME/.config/fish/secrets.fish"
set -g fish_user_paths "/usr/local/opt/node@12/bin" $fish_user_paths
