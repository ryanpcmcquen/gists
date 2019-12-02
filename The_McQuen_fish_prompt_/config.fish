
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

export PATH="/usr/local/opt/ruby/bin:/usr/local/opt/gnu-tar/libexec/gnubin:/usr/local/sbin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

export NODE_EXTRA_CA_CERTS='/usr/local/etc/openssl/cert.pem'

export PATH="/usr/local/opt/node.js/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/node.js/lib"
export CPPFLAGS="-I/usr/local/opt/node.js/include"

set -U EDITOR subl -w
set -U VISUAL subl -w