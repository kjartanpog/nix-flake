{ pkgs, ... }: {
  environment.systemPackages = [
    (
      pkgs.alpaca.override {
        ollama = pkgs.ollama-rocm;
      }
    )
  ];
}
