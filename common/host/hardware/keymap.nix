{ ... }: {
  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings = {
        main = {
          capslock = "overload(control, esc)";
          # capslock = "esc";
          muhenkan = "leftalt";
          # space = "overload(shift, space)";
        };
      };
    };
  };
}
