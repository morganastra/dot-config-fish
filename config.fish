set PATH $HOME/.cargo/bin $HOME/.local/bin $PATH

set -x N_PREFIX $HOME/.local

if status --is-interactive
    fish_vi_key_bindings
end

