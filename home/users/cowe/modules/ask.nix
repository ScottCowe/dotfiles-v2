{ pkgs, ... }:

let
  ask = pkgs.stdenv.mkDerivation {
    pname = "ask";
    version = "0.1.0.0";

    src = pkgs.fetchFromGitHub {
      owner = "msp-strath";
      repo = "ask";
      rev = "03a73b4";
      sha256 = "sha256-bNUNXWtn6gl828MlJnAY8c8iEa4Xd9tZApZZZg3QYcw=";
    };

    isLibrary = true;
    isExecutable = true;
    libraryHaskellDepends = with pkgs.haskellPackages; [
      base_4_21_0_0
      containers_0_7
      mtl_2_3_1
    ];
    executableHaskellDepends = with pkgs.haskellPackages; [ base_4_21_0_0 ];
    testHaskellDepends = with pkgs.haskellPackages; [ base_4_21_0_0 ];
    license = "unknown";
    mainProgram = "ask";
  };
in
{
  home.packages = [ ask ];
}
