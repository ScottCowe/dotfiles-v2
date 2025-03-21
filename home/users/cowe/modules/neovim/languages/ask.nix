{
  # TODO: Keybind
  # TODO: Keep newlines in ask file

  programs.nixvim.userCommands."AskCompile" = {
    command.__raw = # lua
      ''
        function()
          local buf = vim.fn.expand('%:p') 
          local handle = io.popen(string.format("/home/cowe/.local/bin/ask %s", buf))
          local result = handle:read("*a")
          handle:close()

          lines = {}
          for s in result:gmatch("[^\r\n]+") do
              table.insert(lines, s)
          end

          vim.api.nvim_buf_set_lines(0, 0, -1, true, lines)
        end
      '';
  };
}
