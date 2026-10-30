# tree-sitter-perl vendors its own bsearch(), which glibc >= 2.42
# turns into a _Generic macro under gcc 16's default -std=gnu23.
final: prev: {
  helix = prev.helix.override {
    grammarOverlays = [
      (gFinal: gPrev: {
        perl = gPrev.perl.overrideAttrs (old: {
          FLAGS = old.FLAGS ++ [ "-std=gnu17" ];
        });
      })
    ];
  };
}
