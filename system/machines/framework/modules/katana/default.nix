{
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
 
        (deflayer english
          •
          grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
          tab  q    w    e    r    t    y    u    i    o    p    [    ]    
          @l1  a    s    d    f    g    h    j    k    l    ;    '    \    ret
          lsft @tld z    x    c    v    b    n    m    ,    .    /    rsft
          lctl lmet lalt           spc            ralt rctl
        )
        
        (deflayer english-hrm
          •
          grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
          tab  q    w    e    r    t    y    u    i    o    p    [    ]    
          @l1  @a   @s   @d   @f   g    h    @j   @k   @l   @;    '    \    ret
          lsft @tld z    x    c    v    b    n    m    ,    .    /    rsft
          lctl lmet lalt           spc            ralt rctl
        )

        (deflayer layer1 
          •
          •    f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  •    •    • 
          @HR  @EN  •    •    •    •    •    •    •    •    •    •    •
          •    •    •    •    •    •    lft  down up   rght •    •    •    • 
          lsft •    •    •    •    •    •    •    •    •    •    •    rsft 
          lctl lmet lalt           •              ralt rctl
        )

        (defalias
          tld S-grv

          l1 (tap-hold 200 200 esc (layer-toggle layer1))

          a (tap-hold 200 200 a lalt)
          s (tap-hold 200 200 s lctl)
          d (tap-hold 200 200 d lmet)
          f (tap-hold 200 200 f lsft)
          
          j (tap-hold 200 200 j lsft)
          k (tap-hold 200 200 k lmet)
          l (tap-hold 200 200 l lctl)
          ; (tap-hold 200 200 ; lalt)

          EN (layer-switch english)
          HR (layer-switch english-hrm)
        )
      '';
    };
  };
}
