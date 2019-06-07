set PATH $HOME/.cargo/bin $HOME/.local/bin $PATH

set -x N_PREFIX $HOME/.local

fish_vi_key_bindings

eval (direnv hook fish)

if status --is-interactive
	abbr --add --global g git
	abbr --add --global da 'direnv add'
	abbr --add --global qr 'cat | qrencode -tANSIUTF8 -o-'
end

thefuck --alias | source
