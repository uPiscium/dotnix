{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    zfs
  ];
  # services.nas = {
  #   enable = true;
  #   packages = with pkgs; [
  #     samba
  #     nfs-utils
  #     rsync
  #     lvm2
  #   ];
  #   samba = {
  #     enable = true;
  #     workgroup = "WORKGROUP";
  #     shares = {
  #       home = {
  #         path = "/home";
  #         readOnly = false;
  #         browseable = true;
  #       };
  #       public = {
  #         path = "/srv/nas/public";
  #         readOnly = false;
  #         browseable = true;
  #       };
  #     };
  #   };
  #   nfs = {
  #     enable = true;
  #     exports = [
  #       { path = "/srv/nas/public"; clients = [ "*" ]; options = [ "rw" "no_root_squash" ]; }
  #     ];
  #   };
  # };
}

