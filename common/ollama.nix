{ ... }: {
  services.ollama = {
    enable = true;
    acceleration = "rocm";
    rocmOverrideGfx = "11.0.2";
    loadModels = [
      "llama3.1:8b"
    ];
    environmentVariables = {
      OLLAMA_KEEP_ALIVE = "3m";
    };
  };
  # services.nextjs-ollama-llm-ui.enable = true;
}
