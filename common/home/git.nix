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
      signing = {
        signByDefault = true;
        format = "openpgp";
        key = "19428DEB725E9362D9FC18561DDFAB23C3F98531";
      };
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
        pc = "pr create -B";
        pm = "pr merge";
        rc = "release create";
        rl = "release list";
      };
    };
  };
}
