{ ... }: 

{
  imports = [
    # ./boot
    ./pipewire
    ./timezone
    ./kanata
    ./nvidia
    ./wooting
    ./podman
    ./bluetooth
    ./tailscale
  ];
}
