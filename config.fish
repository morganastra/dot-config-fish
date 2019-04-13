set PATH $HOME/.cargo/bin $HOME/.local/bin $PATH

set -x N_PREFIX $HOME/.local

abbr -a g git
abbr qr 'cat | qrencode -tANSIUTF8 -o-'

thefuck --alias | source
