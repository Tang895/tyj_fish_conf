if status is-interactive
    # Commands to run in interactive sessions can go here
end

# alias 
# alias cls="clear"
alias ff="fastfetch"
alias python="python3"
set home_path ""
set os_type ""
# set -x PATH $PATH /home/linuxbrew/.linuxbrew/bin/

# env
switch (uname)
    case "Linux"
        echo "This is Linux"
        set os_type "Linux"
        # home_path = ~/ianhome/
    case "Darwin"
        echo "This is macOS"
        set os_type "darwin"
        # home_path = ~/ianhome/
    case "FreeBSD"
        echo "This is FreeBSD"
    case '*'
        echo "Unknown OS: "(uname)
end


# functions
function cdfish
    cd ~/.config/fish/
end

function cdkitty
    cd ~/.config/kitty/
end

function cdhugo
    cd ~/ianhome/myblog/
end

function set_proxy
    set -x http_proxy http://localhost:11223
    set -x https_proxy https://localhost:11223
end

function add_path
    if test (count $argv) -eq 0
        echo "Usage: add_path <directory>"
        return 1
    end

    set dir (realpath $argv[1])

    if not test -d $dir
        echo "Error: '$dir' is not a directory"
        return 1
    end

    # 检查 PATH 中是否已经包含
    if contains $dir $PATH
        echo "Already in PATH: $dir"
    else
        set -x PATH $PATH $dir
        echo "Added to PATH: $dir"
    end
end

function add_path_forever
    if test (count $argv) -eq 0
        echo "Usage: add_path <directory>"
        return 1
    end

    set dir (realpath $argv[1])
    if not test -d $dir
        echo "Error: '$dir' is not a directory"
        return 1
    end

    if contains $dir $PATH
        echo "Already in PATH: $dir"
    else
        set -x PATH $PATH $dir
        echo "add_path $dir" >> ~/.config/fish/path.fish
        echo "Added to PATH and saved: $dir"
    end
end

source ~/.config/fish/path.fish


# echo $os_type
if test "$os_type" = "Linux"
    echo "add linux homebrew path"
    #add_path /home/linuxbrew/.linuxbrew/bin/
end
