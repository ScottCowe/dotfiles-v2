{
  programs.nixvim.plugins.blink-cmp = {
    enable = true;

    settings = {
      appearance = {
        nerd_font_variant = "mono";
        use_nvim_cmp_as_default = true;
      };
      completion = {
        accept = {
          auto_brackets = {
            enabled = true;
            semantic_token_resolution = {
              enabled = false;
            };
          };
        };
        documentation = {
          auto_show = true;
        };
        ghost_text.enabled = true;
        menu.auto_show.__raw = ''
          function(ctx) 
            return ctx.mode ~= 'cmdline' 
          end
        '';
      };

      keymap.preset = "enter"; 

      signature = {
        enabled = true;
      };
      sources = {
        cmdline = [ ];
        providers = {
          buffer = {
            score_offset = -7;
          };
          lsp = {
            fallbacks = [ ];
          };
        };
      };
    };
  };
}
