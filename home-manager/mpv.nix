{ config, pkgs, ... }:
{
  programs.mpv = {
    enable = true;

    package = (
      pkgs.mpv-unwrapped.wrapper {
        scripts = with pkgs.mpvScripts; [
          uosc
          sponsorblock
        ];

        mpv = pkgs.mpv-unwrapped.override {
          waylandSupport = true;
        };
      }
      );

      config = {
        profile = "fast";
        hwdec = "auto";
        ytdl-format = "bestvideo[heigh<=?1080]+bestaudio";
      };
    };
  }

