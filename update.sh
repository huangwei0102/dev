rsync -a ~/.config/tmux/ ./tmux/
rsync -a ~/.config/zellij/ ./zellij/
rsync -a ~/.config/nvim/ ./nvim/
rsync -a ~/.config/alacritty/ ./alacritty/
rsync -a ~/.config/kitty/ ./kitty/
rsync -a ~/.config/zsh/ ./zsh/
rsync -a ~/.zshrc ./zshrc

git submodule add ssh://git@github.com/romkatv/powerlevel10k.git zsh/plugins/powerlevel10k
git submodule add ssh://git@github.com/zsh-users/zsh-autosuggestions.git zsh/plugins/zsh-autosuggestions
git submodule add ssh://git@github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git zsh/plugins/zsh-autoswitch-virtualenv
git submodule add ssh://git@github.com/le0me55i/zsh-extract.git zsh/plugins/zsh-extract
git submodule add ssh://git@github.com/zsh-users/zsh-history-substring-search.git zsh/plugins/zsh-history-substring-search
git submodule add ssh://git@github.com/zsh-users/zsh-syntax-highlighting.git zsh/plugins/zsh-syntax-highlighting
git submodule add ssh://git@github.com/tmux-plugins/tpm.git tmux/plugins/tpm
git submodule add ssh://git@github.com/tmux-plugins/tmux-sensible.git tmux/plugins/tmux-sensible
git submodule add ssh://git@github.com/tmux-plugins/tmux-yank.git tmux/plugins/tmux-yank
git submodule add ssh://git@github.com/tmux-plugins/tmux-net-speed.git tmux/plugins/tmux-net-speed
git submodule add ssh://git@github.com/tmux-plugins/tmux-resurrect.git tmux/plugins/tmux-resurrect
git submodule add ssh://git@github.com/tmux-plugins/tmux-continuum.git tmux/plugins/tmux-continuum
#
yes | rm -r tmux/plugins/*
yes | rm -r zsh/plugins/*

