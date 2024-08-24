{ inputs, ... }: {
  home.packages =
    let
      system = "x86_64-linux";
    in
  [
    inputs.zen-browser.packages."${system}".specific
  ];
}
