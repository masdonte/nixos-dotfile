{config, pkgs, ...}:{

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = false;
        vimAlias = true;
        lsp.enable = true;

        telescope.enable = true;
        statusline.lualine.enable = true;

        languages = {
          nix.enable = true;
        };
      };


    };
  }
  ;
}

