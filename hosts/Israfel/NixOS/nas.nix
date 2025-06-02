{ pkgs, ... }: {
  boot.supportedFilesystems = [ "zfs" ];
  services.zfs.autoScrub.enable = true; # Enable automatic scrubbing of ZFS pools

  environment.systemPackages = with pkgs; [
    zfs
  ];

  # fileSystems."/mnt/NAS/" = {
  #   device = "tank/data";
  #   fsType = "zfs";
  # };

  # services.samba = {
  #   enable = true;
  #   workgroup = "WORKGROUP";
  #   shares = {
  #     data = {
  #       path = "/mnt/NAS/";
  #       readOnly = false;
  #       browseable = true;
  #       "guest ok" = false;
  #     };
  #   };
  # };

  # services.nfs.server = {
  #   enable = true;
  #   exports = [
  #     {
  #       path = "/mnt/NAS/";
  #       clients = [ "*" ];
  #       options = [ "rw" "no_root_squash" ];
  #     }
  #   ];
  # };
}

