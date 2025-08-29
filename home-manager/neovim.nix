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
        };
        programs.zed-editor = {
                enable = true;
                extensions =  [ "nix"];
                userSettings = {
                        features = {
                                copilot = false;
                        };
                        telemetry = {
                                metrics = false;
                                diagnostics = false:

                        };
                        vim_mode = true;
                        ui_font_size = 16;
                        buffer_font_size = 16;
                };
        };
                    }

