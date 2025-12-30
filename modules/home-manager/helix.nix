{ pkgs, lib, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      editor = {
        default-yank-register = "+";
        cursor-shape.insert = "bar";
        auto-save = {
          after-delay.timeout = 3000;
          enable = true;
        };
        gutters = [
          "diff"
          "diagnostics"
          "line-numbers"
          "spacer"
        ];
        bufferline = "multiple";
      };
    };

    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
      }
      {
        name = "cpp";
        auto-format = true;
      }
    ];
  };
}
