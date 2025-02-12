{ pkgs, ... }:

{
  home.packages = with pkgs; [ grc ];

  programs.fish = {
    enable = true;    

    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';

    plugins = [
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
      {
        name = "plugin-git";
        src = pkgs.fishPlugins.plugin-git.src;
      }
      { 
        name = "grc"; 
        src = pkgs.fishPlugins.grc.src; 
      }
    ];
  };

  programs.bash = {
    enable = true;

    initExtra = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };
}
