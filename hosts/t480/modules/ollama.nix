{
  services = {
    ollama = {
      enable = true;
      acceleration = "rocm";
    };

    open-webui.enable = true;
  };
}
