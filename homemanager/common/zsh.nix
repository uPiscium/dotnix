{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;

    shellAliases = {
      grep = "rg";
      ip = "ip -a";
      ls = "ls --color=auto";
      ll = "ls -l";
      la = "ls -a";
      g = "git";
    };

    history = {
      size = 10000;
    };

    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];

    initContent = ''
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

      function WithNVIDIA() {
        echo -ne "\033[1;32mRun '$1' with NVIDIA? (Y/n)\033[0m";
        read answer;
        if [ "$answer" = "n" ]; then
          echo "Skipped running with NVIDIA.";
        else
          export __NV_PRIME_RENDER_OFFLOAD=1;
          export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0;
          export __GLX_VENDOR_LIBRARY_NAME=nvidia;
          export __VK_LAYER_NV_optimus=NVIDIA_only;
          exec $1;
        fi
      }

      if [ -n "$\{commands[fzf-share]\}" ]; then
        source "$(fzf-share)/key-bindings.zsh"
        source "$(fzf-share)/completion.zsh"
      fi

      export ZSH_CUSTOM="$HOME/.config/.zsh";
      export LD_LIBRARY_PATH="/run/opengl-driver/lib:/run/opengl-driver-32/lib:$LD_LIBRARY_PATH";

      if [ -d ~/.ssh/private_key ]; then
        ssh-add ~/.ssh/private_key/* > /dev/null;
      fi
      # if ~/secrets exists, source its directory files
      if [ -d ~/secrets ]; then
          for f in ~/secrets/*; do
              if [ -r "$f" ]; then
                  source "$f"
              fi
          done
      fi
    '';
  };

  programs.starship.enable = true;

  home.file.".config/starship.toml" = {
    source = ../../config.d/starship.toml;
  };
}
