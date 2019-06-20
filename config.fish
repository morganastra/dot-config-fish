set PATH $HOME/.cargo/bin $HOME/.local/bin $PATH

set -x N_PREFIX $HOME/.local

if status --is-interactive

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

	abbr --add --global g git
	abbr --add --global da 'direnv allow'
	abbr --add --global qr 'cat | qrencode -tANSIUTF8 -o-'
  abbr --add --global cljr 'clj -A"dev" -e "(dev)(go)" -r'
end

