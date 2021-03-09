set PATH $HOME/.cargo/bin $HOME/.local/bin $PATH

set -x N_PREFIX $HOME/.local

if status --is-interactive

    fish_vi_key_bindings

	abbr --add --global g git
	abbr --add --global da 'direnv allow'
	abbr --add --global qr 'cat | qrencode -tANSIUTF8 -o-'
  abbr --add --global cljr 'env DATOMIC_ENDPOINT=localhost:8998 clj -A"dev" -e "(dev)(go)" -r'
end

