{
  config,
  lib,
  ...
}:
let
  sshp = config.my.modules.ssh.profile;
in
{
  options.my.modules.ssh.profile = lib.mkOption {
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
    users.users.martin = lib.mkIf (sshp == "server") {
      openssh.authorizedKeys.keyFiles = [
        ../../keys/id_ed25519_yoga_nixos.pub
      ];
    };

    programs.ssh = lib.mkIf (sshp == "desktop") {
      startAgent = true;
    };
  };
}
