require("luasnip.session.snippet_collection").clear_snippets "nix"

local ls = require "luasnip"

local i = ls.insert_node
local s = ls.snippet

local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("nix", {
  s("homepackages", fmta("home.packages = with pkgs; [ <> ];", i(0))),

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
    "newmodule",
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

  s("systempackages", fmta("environment.systemPackages = with pkgs; [<>];", i(0))),
})
