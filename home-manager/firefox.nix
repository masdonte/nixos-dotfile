{pkgs, config, ... }:

{
  programs.librewolf = {
    enable = true;
    settings = {
      "webgl.disabled" = true; # use Canvas Blocker if "true"
    };

  };


}

