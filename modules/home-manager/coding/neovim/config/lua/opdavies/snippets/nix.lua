require("luasnip.session.snippet_collection").clear_snippets "nix"

local ls = require "luasnip"

local i = ls.insert_node
local s = ls.snippet

local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

ls.add_snippets("nix", {
  s("homepackages", fmta("home.packages = with pkgs; [ <> ];", i(0))),

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

      with lib;

      let
        name = "<name>";
        cfg = config.<namespace>.<name>;
      in
      {
        options.<namespace>.<name> = {
          enable = mkEnableOption "Enable ${name}";<more_options>
        };

        config = mkIf cfg.enable {
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
