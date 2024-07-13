{ ... }: {
  # Needed for AirPods
  hardware.bluetooth.settings = {
    General = {
      ControllerMode = "bredr";
    };
  };
}
