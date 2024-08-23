{ lib, config, ... }:

with lib; {
  options.kanata = {
    enable = mkEnableOption "kanata";
  };

  config = mkIf config.kanata.enable {
    services.kanata = {
      enable = true;

      keyboards.board = {
        config = ''
          (defsrc
            esc
            grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab  q    w    e    r    t    y    u    i    o    p    [    ]    
            caps a    s    d    f    g    h    j    k    l    ;    '    \    ret
            lsft <    z    x    c    v    b    n    m    ,    .    /    rsft
            lctl lmet lalt           spc            ralt rctl
          )

          (deflayer querty 
            •
            grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab  q    w    e    r    t    y    u    i    o    p    [    ]    
            @l1  a    s    d    f    g    h    j    k    l    ;    '    \    ret
            lsft @tl  z    x    c    v    b    n    m    ,    .    /    rsft
            lctl lmet lalt           spc            ralt rctl
          )
          
          (deflayer layer1 
            •
            •    f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  •    •    • 
            •    •    •    •    •    •    •    •    •    •    •    •    •
            •    •    •    •    •    •    lft  down up   rght •    •    •    • 
            lsft •    •    •    •    •    •    •    •    •    •    •    rsft 
            lctl lmet lalt           •              ralt rctl
          )

          (defalias
            tl S-grv 

            l1 (tap-hold 200 200 esc (layer-toggle layer1))
          )
        '';
      };
    };
  };
}
