function gpl
    argparse 'a/agpl' -- $argv
    or return

    if set -ql _flag_a
	      curl https://www.gnu.org/licenses/agpl-3.0.txt > COPYING
    else
	      curl https://www.gnu.org/licenses/gpl-3.0.txt > COPYING
    end
end
