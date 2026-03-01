typeset -U path cdpath fpath manpath
for profile in ${(z)NIX_PROFILES}; do
  fpath+=($profile/share/zsh/site-functions $profile/share/zsh/$ZSH_VERSION/functions $profile/share/zsh/vendor-completions)
done

HELPDIR="/nix/store/vwz55s841vn43976ydjbayflpl8srfqz-zsh-5.9/share/zsh/$ZSH_VERSION/help"

autoload -U compinit && compinit
source /nix/store/ky48blb8hq8nhgvm3zhzmzpfbdm71f1l-zsh-autosuggestions-0.7.1/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history)


# History options should be set in .zshrc and after oh-my-zsh sourcing.
# See https://github.com/nix-community/home-manager/issues/177.
HISTSIZE="10000"
SAVEHIST="10000"

HISTFILE="/home/upiscium/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

# Set shell options
set_opts=(
  HIST_FCNTL_LOCK HIST_IGNORE_DUPS HIST_IGNORE_SPACE SHARE_HISTORY autocd
  NO_APPEND_HISTORY NO_EXTENDED_HISTORY NO_HIST_EXPIRE_DUPS_FIRST
  NO_HIST_FIND_NO_DUPS NO_HIST_IGNORE_ALL_DUPS NO_HIST_SAVE_NO_DUPS
)
for opt in "${set_opts[@]}"; do
  setopt "$opt"
done
unset opt set_opts

zstyle ':completion:*' completer _complete _correct
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
autoload -U compinit && compinit
eval "$(direnv hook zsh)"

function WOL() {
  echo -ne "\033[1;32mWake up '$1'? (Y/n)\033[0m";
  read answer;
  if [ "$answer" = "n" ]; then
    echo "Skipped wake up.";
  else
    local mac=$(arp -a | grep "$1" | awk '{print $4}');
    if [ -z "$mac" ]; then
      echo "Failed to get mac of '$1'.";
    else
      wol -i $1 $mac;
    fi
  fi
}

# function WithNVIDIA() {
#   echo -ne "\033[1;32mRun '$1' with NVIDIA? (Y/n)\033[0m";
#   read answer;
#   if [ "$answer" = "n" ]; then
#     echo "Skipped running with NVIDIA.";
#   else
#     export __NV_PRIME_RENDER_OFFLOAD=1;
#     export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0;
#     export __GLX_VENDOR_LIBRARY_NAME=nvidia;
#     export __VK_LAYER_NV_optimus=NVIDIA_only;
#     exec $1;
#   fi
# }

if [ -n "$\{commands[fzf-share]\}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

export ZSH_CUSTOM="$HOME/.config/.zsh";
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export LD_LIBRARY_PATH="/run/opengl-driver/lib:/run/opengl-driver-32/lib:$LD_LIBRARY_PATH";

if [ -d ~/secrets/private-key ]; then
  ssh-add ~/secrets/private-key/* > /dev/null;
fi
# if ~/secrets exists, source its directory files
# if [ -d ~/secrets ]; then
#     for f in ~/secrets/*; do
#         if [ -r "$f" ]; then
#             source "$f"
#         fi
#     done
# fi

# Set the default directory for grim screenshots
export GRIM_DEFAULT_DIR="$HOME/Pictures/screenshots";

if [[ $TERM != "dumb" ]]; then
  eval "$(/nix/store/s3fniw0gqhh5vl9w3v8yj5bd0hqi5nj2-starship-1.24.2/bin/starship init zsh)"
fi

if test -n "$KITTY_INSTALLATION_DIR"; then
  export KITTY_SHELL_INTEGRATION="no-rc"
  autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
  kitty-integration
  unfunction kitty-integration
fi

alias -- g=git
alias -- grep=rg
alias -- ip='ip -a'
alias -- la='ls -a'
alias -- ll='ls -l'
alias -- ls='ls --color=auto'
source /nix/store/np7zh0z60bl9r01v1rzaqbj02q967bgg-zsh-syntax-highlighting-0.8.0/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)



source /nix/store/hcv31iz7jcl3rma5swdml9y1zx83p9sd-zsh-history-substring-search-1.1.0/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
