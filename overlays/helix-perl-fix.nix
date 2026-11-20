# tree-sitter-perl vendors its own bsearch(), which glibc >= 2.42
# turns into a _Generic macro under gcc 16's default -std=gnu23.
# Helix's grammars are built with nixpkgs' tree-sitter.buildGrammar,
# which sets CFLAGS via `env`, so inject the flag through NIX_CFLAGS_COMPILE.
# Remove once the pinned Perl grammar includes:
# https://github.com/tree-sitter-perl/tree-sitter-perl/pull/220
final: prev: {
  helix = prev.helix.override {
    grammarOverlays = [
      (gFinal: gPrev: {
        perl = gPrev.perl.overrideAttrs (old: {
          env = (old.env or { }) // {
            NIX_CFLAGS_COMPILE = toString [
              (old.env.NIX_CFLAGS_COMPILE or "")
              "-std=gnu17"
            ];
          };
        });
      })
    ];
  };
}
