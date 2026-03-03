{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nil
    nixfmt
    clang-tools
  ];
}
