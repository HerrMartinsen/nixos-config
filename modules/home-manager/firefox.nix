{...}:

{
  programs.firefox = {
    enable = true;
    profiles = {
      martin = {
        extensions.force = true;
      };
    };
  };
}

