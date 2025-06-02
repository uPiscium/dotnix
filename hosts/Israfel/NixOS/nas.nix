{ pkgs, ... }: {
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.enableUnstable = false; # Unstable ZFS features are not enabled
  services.zfs.autoScrub.enable = true; # Enable automatic scrubbing of ZFS pools

  environment.systemPackages = with pkgs; [
    zfs
  ];

  fileSystems."/mnt/NAS/" = {
    device = "tank/data";
    fsType = "zfs";
  };

  services.samba = {
    enable = true;
    workgroup = "WORKGROUP";
    shares = {
      data = {
        path = "/mnt/NAS/";
        readOnly = false;
        browseable = true;
        "guest ok" = false;
      };
    };
  };

  services.nfs.server = {
    enable = true;
    exports = [
      {
        path = "/mnt/NAS/";
        clients = [ "*" ];
        options = [ "rw" "no_root_squash" ];
      }
    ];
  };
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

