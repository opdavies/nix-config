{
  services = {
    ollama = {
      enable = false;
      acceleration = "rocm";
    };

    open-webui.enable = false;
  };
}
