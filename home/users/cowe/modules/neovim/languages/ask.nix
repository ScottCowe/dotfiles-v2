{ pkgs, ... }:

let
  ask =
    let
      env = pkgs.haskellPackages.ghcWithPackages (self: [
        self.cabal-install
      ]);
    in
    pkgs.stdenv.mkDerivation {
      name = "ask";

      src = pkgs.fetchFromGitHub {
        owner = "msp-strath";
        repo = "ask";
        rev = "03a73b4";
        sha256 = "sha256-bNUNXWtn6gl828MlJnAY8c8iEa4Xd9tZApZZZg3QYcw=";
      };

      # buildInputs = with pkgs; [
      #   ghc
      #   haskellPackages.cabal-install
      #
      #   # # ask deps
      #   # haskellPackages.base_4_21_0_0
      #   # haskellPackages.mtl_2_3_1
      #   # haskellPackages.containers_0_7
      # ];
      #
      # buildPhase = ''
      #   export HOME=$TMP
      # '';
      #
      # installPhase = ''
      #   ls >> $out
      # '';

      installPhase = ''
        mkdir -p $out/bin
        ${env}/bin/cabal build

      '';

      # installPhase = ''
      #   mkdir -p $out
      #   ${pkgs.haskellPackages.cabal-install}/bin/cabal build
      #   mv ./dist-newstyle/build/x86_64-linux/ghc-9.6.6/ask-0.1.0.0/x/ask/build/ask/* $out/bin
      # ''; # TODO: Make above path more declarative
    };
in
{
  programs.nixvim.userCommands."AskCompile" = {
    command.__raw = # lua
      ''
        function()
          local buf = vim.fn.expand('%:p') 
          -- local handle = io.popen(string.format("${ask}/bin/ask %s", buf))
          local handle = io.popen("cat ${ask}")
          local result = handle:read("*a")
          handle:close()

          lines = {}
          for s in result:gmatch("[^\r\n]+") do
              table.insert(lines, s)
          end

          vim.api.nvim_buf_set_lines(0, -1, -1, true, lines)
        end
      '';
  };
}
