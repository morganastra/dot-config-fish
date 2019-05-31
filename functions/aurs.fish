# Defined in - @ line 2
function aurs
	curl -Ls "https://aur.archlinux.org/rpc/?v=5&type=search&arg="$argv[1] | jq -r '.results[] | (.Name + "|" + .Description)' | column -t -s '|'
end