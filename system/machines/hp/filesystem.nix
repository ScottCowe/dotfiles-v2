{
  fileSystems."/" = { 
    device = "/dev/disk/by-label/ROOT";
    fsType = "ext4";
  };

  fileSystems."/boot" = { 
    device = "/dev/disk/by-label/BOOT";
    fsType = "vfat";
  };

  swapDevices = [ 
    { 
      device = "/dev/disk/by-label/SWAP";
    }
  ];
}
