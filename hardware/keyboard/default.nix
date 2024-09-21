{ pkgs, ... }: {
  hardware.uinput.enable = true;
  hardware.keyboard.qmk.enable = true;
  environment.systemPackages = with pkgs; [ via ];
  services.udev.packages = with pkgs; [ via ];
}
