{pkgs, config, ... }:

{
  programs.librewolf = {
    enable = true;
    settings = {
      "webgl.disabled" = true; # use Canvas Blocker if "true"
    };

  };

  programs.qutebrowser = {
    enable = true;
    extraConfig = (builtins.readFile ./gruvbox.py);

  };


}

