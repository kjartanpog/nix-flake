{ pkgs, lib, ... }: {

  # load amdgpu kernelModule in stage 1. Can fix lower resolution in boot screen during initramfs phase .
  hardware.amdgpu.initrd.enable = true;

  # modesetting - video driver for framebuffer device
  services.xserver.videoDrivers = lib.mkDefault [ "modesetting" ];

  # Enable hardware accelerated graphics drivers
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      # amdvlk # AMD Open Source Driver for Vulkan®
      # libvdpau-va-gl # VDPAU driver with OpenGL/VAAPI backend. H.264 only.
    ];
    extraPackages32 = with pkgs; [
      # driversi686Linux.amdvlk
      # driversi686Linux.libvdpau-va-gl # VDPAU driver with OpenGL/VAAPI backend. H.264 only.
    ];
  };

  # OpenCL parallel computing API
  hardware.amdgpu.opencl.enable = true;
  environment.systemPackages = with pkgs; [
    clinfo
  ];

  environment.sessionVariables = {
    # QT_WAYLAND_DECORATION = "gnome";
    # QT_QPA_PLATFORM = "wayland";
    # VAAPI and VDPAU config for accelerated video.
    # See https://wiki.archlinux.org/index.php/Hardware_video_acceleration
    VDPAU_DRIVER = "radeonsi";
    # LIBVA_DRIVER_NAME = "radeonsi";
  };
}
