set PATH $HOME/.cargo/bin $HOME/.local/bin $PATH

set -x N_PREFIX $HOME/.local

fish_vi_key_bindings

if which direnv > /dev/null 2>&1
	eval (direnv hook fish)
	echo "Setting direnv hook"
else
	echo "direnv not installed"
end

if which thefuck > /dev/null 2>&1
	thefuck --alias | source
else
	echo "thefuck not installed"
end

if status --is-interactive
	abbr --add --global g git
	abbr --add --global da 'direnv allow'
	abbr --add --global qr 'cat | qrencode -tANSIUTF8 -o-'
end

