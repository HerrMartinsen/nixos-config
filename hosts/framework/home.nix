{ ... }:
{
  imports = [ ../../modules/home-manager ];
  my.homeManager.profile = "desktop";

  # Use kitty's diff kitten for `git difftool` (kitty only — doesn't work over plain ssh/tty)
  programs.git = {
    enable = true;
    settings = {
      diff.tool = "kitty";
      diff.guitool = "kitty.gui";
      difftool = {
        prompt = false;
        trustExitCode = true;
        kitty.cmd = "kitten diff $LOCAL $REMOTE";
        "kitty.gui".cmd = "kitty kitten diff $LOCAL $REMOTE";
      };
      alias.kd = "difftool --no-symlinks --dir-diff";
    };
  };
}
