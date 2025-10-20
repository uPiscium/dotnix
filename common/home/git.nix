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
      aa = "!sh ~/dotnix/resources/scripts/addAll.sh";
      b = "branch";
      bd = "!sh ~/dotnix/resources/scripts/deleteBranch.sh";
      c = "commit -m";
      cc = "rm -r --cached .";
      ch = "checkout";
      cb = "checkout -b";
      l = "!git fetch -p && git pull";
      m = "merge";
      p = "push";
      r = "reset";
      s = "status";
      w = "switch";
      wc = "switch -c";
      wd = "switch -d";
    };

    ignores = [ ];

    extraConfig = {
      push = { autoSetupRemote = true; };
      pull = { rebase = false; };
      init = { defaultBranch = "main"; };
      credential = { helper = "store"; };
      fetch = { prune = true; };
      user = { email = "upiscium@gmail.com"; name = "uPiscium"; };
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
