if status is-interactive
    # Commands to run in interactive sessions can go here
end

# alias 
# alias cls="clear"
alias ff="fastfetch"
alias python="python3"

set -x PATH $PATH /home/linuxbrew/.linuxbrew/bin/

# functions
function cdfish
    cd ~/.config/fish/
end

function cdkitty
    cd ~/.config/kitty/
end
