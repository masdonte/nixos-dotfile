{ config, pkgs, ...}:
{

  programs.foot = { 
    enable = true;
    settings = {
      main = 
      {
        font = "monospace:size=10";
      };
      cursor = {
        style = "beam";
        beam-thickness = 1;

      };
      mouse = {
        hide-when-typing = "yes";
      };
      colors = {
        alpha = "0.9";
        flash = "7f7f00";
        flash-alpha = "0.5";
      };
    };
  };
}
