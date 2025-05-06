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
        name = "<>";
        cfg = config.<>.<>;
      in
      {
        options.<>.<> = {
          enable = mkEnableOption "Enable ${name}";<>
        };

        config = mkIf cfg.enable {
          <>
        };
      }
      ]],
      {
        i(1),
        i(2),
        rep(1),
        rep(2),
        rep(1),
        i(3),
        i(0),
      }
    )
  ),

  s("systempackages", fmta("environment.systemPackages = with pkgs; [<>];", i(0))),
})
