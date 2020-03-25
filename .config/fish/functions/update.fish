function update -d "Update packages"
    if test -z "$argv"
        printf "update/up [targets]\n"
        return
    end

    for arg in $argv
        switch $arg
        case dotfiles
            if test -d $HOME/.dotfiles
                echo "not implemented"
            end

        case pacman
            if command -sq pacman;
                sudo pacman -Syyu
            end

        case nix
            if command -sq nix;
                nix-channel --update
            end

        case macos
            if command -sq softwareupdate; and test (uname) = "Darwin";
                sudo softwareupdate -ia
            end

        case brew
            if command -sq brew;
                brew update
                brew upgrade
                brew cleanup
            end

        case cask
            if command -sq brew;
                brew upgrade --cask
            end

        case mas
            if command -sq mas;
                mas upgrade
            end

        case fish
            if command -sq fish;
                if  type -q fisher;
                    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
                    fisher update
                end
            end

        case vimplug
            if command -sq vim
                vim +PlugUpdate +qall
            end

        case rustup
            if command -sq rustup
                rustup update
            end

        case pip3
            if command -sq pip3;
                pip3 -V
                pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U
            end

        case gem
            if command -sq gem;
                gem update
            end

        case npm
            if command -sq npm;
                npm update -g
            end

        case yarn
            if command -sq yarn;
                # yarn global upgrade-interactive --latest
                yarn global upgrade --latest
            end

        case \*
            printf "'%s' is not a valid target\n" $tgt >/dev/stderr
        end
    end
end
