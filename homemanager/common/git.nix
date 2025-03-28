{ pkgs, ... }: {
  home.packages = with pkgs; [
    tig
  ];

  programs.git = {
    enable = true;
    userName = "uPiscium";
    userEmail = "upiscium@gmail.com";

    aliases = {
      a = "add";
      aa = "!sh ~/dotnix/scripts/addAll.sh";
      b = "branch";
      bd = "push origin -d";
      c = "commit -m";
      cc = "rm -r --cached .";
      l = "!git fetch -p && git pull";
      m = "merge";
      nb = "!sh ~/dotnix/scripts/newBranch.sh";
      p = "push";
      r = "reset";
      s = "status";
      w = "switch";
    };

    ignores = [ ];

    extraConfig = {
      push = { autoSetupRemote = true; };
      init = { defaultBranch = "main"; };
    };
  };

  programs.gh = {
    enable = true;

    extensions = with pkgs; [
      gh-markdown-preview
      gh-dash
    ];

    settings = {
      editor = "nvim";
      aliases = {
        rpcr = "repo create";
        rpc = "repo clone";
        prc = "pr create -B";
        prm = "pr merge";
        rlc = "release create";
        rll = "release list";
      };
    };
  };
}
