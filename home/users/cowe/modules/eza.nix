{
  home.shellAliases."ls" = "eza -la --icons=always";
  programs.fish.shellAliases."ls" = "eza -la --icons=always";

  programs.eza = {
    enable = true;
  };
}
