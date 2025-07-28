return {
  s("home_packages", fmta("home.packages = with pkgs; [ <> ];", i(0))),

  s(
    "homepage_options",
    fmta(
      [[
      homepage.name = mkOption {
        default = "<name>";
        type = types.str;
      };

      homepage.description = mkOption {
        default = "<description>";
        type = types.str;
      };

      homepage.icon = mkOption {
        default = "<icon>";
        type = types.str;
      };

      homepage.category = mkOption {
        default = "<finish>";
        type = types.str;
      };
      ]],
      {
        description = i(2),
        finish = i(0),
        icon = i(3),
        name = i(1),
      }
    )
  ),

  s(
    "imports",
    fmta(
      [[
      {
        imports = [
          <>
        ];
      }
      ]],
      { i(0) }
    )
  ),

  s(
    "new_flake",
    fmta(
      [[
      {
      inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";<inputs>
      };

      outputs =
        { nixpkgs, ... }:
        let
          system = "x86_64-linux";
          pkgs = import nixpkgs { inherit system; };

          inherit (pkgs) mkShell;
        in
        {
          devShells.${system}.default = mkShell {
            packages = with pkgs; [ <pkgs> ];
          };<finish>

          formatter.${system} = pkgs.nixfmt-classic;
        };
      }
      ]],
      { inputs = i(1), pkgs = i(2), finish = i(0) }
    )
  ),
  s(
    "new_module",
    fmta(
      [[
      { config, lib, ... }:

      let
        name = "<name>";
        cfg = config.<namespace>.${name};
      in
      {
        options.<namespace>.${name} = {
          enable = lib.mkEnableOption "Enable ${name}";<more_options>
        };

        config = lib.mkIf cfg.enable {
          <finish>
        };
      }
      ]],
      {
        finish = i(0),
        more_options = i(3),
        name = i(1),
        namespace = i(2),
      },
      { repeat_duplicates = true }
    )
  ),

  s("system_packages", fmta("environment.systemPackages = with pkgs; [<>];", i(0))),
}
