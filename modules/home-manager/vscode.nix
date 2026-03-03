{ pkgs, ... }:

let
  tensorboardExt = pkgs.vscode-utils.buildVscodeMarketplaceExtension {
    mktplcRef = {
      publisher = "ms-toolsai";
      name = "tensorboard";
      version = "2024.3.1002291100";
      sha256 = "sha256-3Bk64EVrtbOzpokgYEOc61nkZ9cCiSfE6GyeQt5kPEo=";
    };
  };
in
{
  programs.vscode = {
    enable = true;
    # package = pkgs.vscodium;
    profiles.default = {
      userSettings = {
        "files.autoSave" = "onFocusChange";
      };
      extensions =
        (with pkgs.vscode-extensions; [
          # Python
          ms-python.python
          ms-python.vscode-pylance

          # Jupyter notebooks
          ms-toolsai.jupyter
          ms-toolsai.jupyter-keymap
          ms-toolsai.jupyter-renderers
          ms-toolsai.vscode-jupyter-cell-tags
          ms-toolsai.vscode-jupyter-slideshow

          # C / C++
          ms-vscode.cpptools
          ms-vscode.cmake-tools
          ms-vscode.makefile-tools

          # CSV
          mechatroner.rainbow-csv

          # Optional (nice for CSV-like tables)
          ms-toolsai.datawrangler
        ])
        ++ [ tensorboardExt ];
    };
  };
}
