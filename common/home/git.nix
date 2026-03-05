{ pkgs, ... }: {
  home.packages = with pkgs; [
    tig
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "uPiscium";
        email = "upiscium@gmail.com";
      };

      push.autoSetupRemote = true;
      pull.rebase = false;
      credential.helper = "store";
      fetch.prune = true;
      init.defaultBranch = "main";
      ghq = {
        root = "~/src";
      };
      alias = {
        a = "add";
        aa = "!~/dotnix/scripts/addAll.sh";
        b = "branch";
        ba = "branch -a";
        c = "commit -m";
        cc = "rm -r --cached";
        l = "!git fetch -p && git pull";
        m = "merge";
        p = "push";
        r = "reset";
        s = "status";
        t = "tag";
        w = "switch";
        wc = "switch -c";
      };
      # signing = {
      #   signByDefault = true;
      #   format = "openpgp";
      #   key = "1B42AFA71A8CB553923473DF504D64B90F5356C1";
      # };
      # commit.gpgSign = true;
      # tag.gpgSign = true;
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
        rpc = "repo clone";
        rpcr = "repo create";
        pc = "pr create -B";
        pm = "pr merge";
        rc = "release create";
        rl = "release list";
      };
    };
  };
}
