{ pkgs, ... }: {
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs = {
    enabled = true; # Enable ZFS support
    forceImportRoot = false; # Set to true if you want to force import the root pool
    forceImportAll = true; # Set to true if you want to force import all ZFS pools
  };

  environment.systemPackages = with pkgs; [
    zfs
  ];

  services.zfs = {
    enable = true; # Enable ZFS services
    autoScrub.enable = true; # Enable automatic scrubbing of ZFS pools
    autoSnapshot = {
      enable = true; # Enable automatic snapshots
      frequent = 4; # Number of frequent snapshots to keep /15 minutes
      hourly = 24; # Number of hourly snapshots to keep /1 hour
      daily = 7; # Number of daily snapshots to keep /1 day
      weekly = 4; # Number of weekly snapshots to keep /1 week
      monthly = 3; # Number of monthly snapshots to keep /1 month
    };
    pools = {
      tank = {
        devices = []; # Replace with your actual disk ID
        autoScrub.enable = true; # Enable automatic scrubbing for this pool
      };
    };
  };

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

