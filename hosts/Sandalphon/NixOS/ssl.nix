{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    openssl
  ];

  # This module generates a local CA and server certificates for use with a proxy.
  systemd.services.generate-certs = {
    description = "Generate local CA and server certificates";
    wantedBy = [ "multi-user.target" ];
    path = with pkgs; [ openssl coreutils ];
    script = ''
      mkdir -p /var/ca/{certs,private}
      cd /var/ca

      if [ ! -f private/ca.key ]; then
        echo "[*] Generating CA..."
        openssl genrsa -out private/ca.key 4096
        openssl req -x509 -new -nodes -key private/ca.key \
          -sha256 -days 3650 -out certs/ca.crt \
          -subj "/C=JP/ST=Tokyo/O=ExampleOrg/CN=LocalCA"
      fi

      if [ ! -f certs/proxy.crt ]; then
        echo "[*] Generating server cert..."
        openssl genrsa -out certs/proxy.key 2048
        openssl req -new -key certs/proxy.key -out certs/proxy.csr \
          -subj "/CN=localhost"
        openssl x509 -req -in certs/proxy.csr -CA certs/ca.crt \
          -CAkey private/ca.key -CAcreateserial \
          -out certs/proxy.crt -days 365 -sha256
      fi

      # Install the generated certificates
      install -m 600 certs/proxy.key /etc/ssl/proxy.key
      install -m 644 certs/proxy.crt /etc/ssl/proxy.crt
    '';
    serviceConfig.Type = "oneshot";
  };
}

