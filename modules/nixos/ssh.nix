{
  config,
  lib,
  ...
}:
let
  sshp = config.my.ssh.profile;
in
{
  options.my.ssh.profile = lib.mkOption {
    type = lib.types.enum [
      "server"
      "desktop"
    ];
    default = "desktop";
  };
  config = {
    services.openssh = lib.mkIf (sshp == "server") {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "no";
      };
    };
  };
}
