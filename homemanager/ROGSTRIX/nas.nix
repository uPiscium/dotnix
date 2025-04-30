{ ... }:
{
  fileSystems."~/share" = {
    device = "//192.168.11.120/share";
    fsType = "cifs";
    options =
      let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in
      [ "${automount_opts},credentials=~/samba/credencial" ];
  };
}
