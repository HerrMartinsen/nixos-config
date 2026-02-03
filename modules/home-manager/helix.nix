{ pkgs, lib, ... }:

{
  programs.helix = {
    extraPackages = with pkgs; [
      pyright
      ruff
      nixfmt-rfc-style
    ];
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
        word-completion.trigger-length = 3;
      };
    };

    languages = {
      language = [
        {
          name = "nix";
          language-servers = [ "nil" ];
          auto-format = true;
          formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
        }
        {
          name = "cpp";
          auto-format = true;
        }
        {
          name = "python";
          auto-format = true;
          language-servers = [
            "pyright"
            "ruff"
          ];
          formatter = {
            command = "ruff";
            args = [
              "format"
              "-"
            ];
          };
        }
      ];
      language-server = {
        nil = {
          command = "nil";
          config.nil.nix.flake.autoArchive = true;
        };
        pyright = {
          command = "pyright-langserver";
          args = [ "--stdio" ];
        };

        ruff = {
          command = "ruff";
          args = [ "server" ];
        };
      };
    };
  };
}
