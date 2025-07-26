{
  flake.modules.nixvim.custom.plugins.mini = {
    enable = true;

    modules = {
      ai = { };
      align = { };
      bracketed = { };
      move = { };
      operators = { };
      splitjoin = { };
      surround = { };
    };
  };
}
