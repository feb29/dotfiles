complete -c update -n "test -d $HOME/.dotfiles"  -f -a "dotfiles" -d '$HOME/.dotfiles'
complete -c update -n "type -q pacman"           -f -a "pacman"   -d "Packages for arch based system"
complete -c update -n "type -q nix"              -f -a "nix"      -d "Packages for nix based system"
complete -c update -n "type -q softwareupdate"   -f -a "macos"    -d "macOS softwares"
complete -c update -n "type -q brew"             -f -a "brew"     -d "Homebrew packages"
complete -c update -n "type -q brew"             -f -a "cask"     -d "Homebrew casks"
complete -c update -n "type -q mas"              -f -a "mas"      -d "Apps from App Store"
complete -c update -n "type -q fisher"           -f -a "fish"     -d "Fish plugins"
complete -c update -n "type -q vim"              -f -a "vimplug"  -d "Vim plugins"
complete -c update -n "type -q rustup"           -f -a "rustup"   -d "Rust toolchains"
complete -c update -n "type -q pip3"             -f -a "pip3"     -d (python3 -V)" packages"
complete -c update -n "type -q gem"              -f -a "gem"      -d "Global gems"
complete -c update -n "type -q npm"              -f -a "npm"      -d "Global npm packages"
complete -c update -n "type -q yarn"             -f -a "yarn"     -d "Global yarn packages"
