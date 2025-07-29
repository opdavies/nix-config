{
  flake.modules.nixvim.custom.extraConfigLua = ''
    vim.fn["edit_alternate#rule#add"]("go", function(filename)
      return filename:find "_test%.go$"
        and filename:gsub("_test%.go$", ".go")
        or filename:gsub("%.go$", "_test.go")
    end)

    vim.fn["edit_alternate#rule#add"]("php", function(filename)
      if filename:find "Test.php$" then
        filename = filename:gsub("Test.php$", ".php")

        return filename:find "tests/src/"
          and filename:gsub("tests/src/(.-)/", "src/")
          or filename:gsub("tests/", "src/")
      else
        test_filename = filename:gsub(".php$", "Test.php")

        if test_filename:find "modules/custom" then
          local test_types = { "Functional", "FunctionalJavaScript", "Kernel", "Unit" }

          for _, test_type in ipairs(test_types) do
            local candidate = test_filename:gsub("src/", string.format("tests/src/%s/", test_type))

            if vim.fn.filereadable(candidate) == 1 then
              return candidate
            end
          end
        end

        return test_filename
      end
    end)

    if vim.fn.filereadable "composer.json" == 1 then
      vim.fn["edit_alternate#rule#add"]("json", function(filename)
        if filename:find "composer.json" and filename:gsub("%.json$", ".lock") or nil
        end
      end)

      vim.fn["edit_alternate#rule#add"]("lock", function(filename)
        if filename:find "composer.lock" then
          return filename:gsub("%.lock$", ".json")
        end
      end)
    end

    if vim.fn.filereadable "fractal.config.js" == 1 then
      vim.fn["edit_alternate#rule#add"]("twig", function(filename)
        return filename:gsub("%.twig$", ".config.yml")
      end)

      vim.fn["edit_alternate#rule#add"]("yml", function(filename)
        return filename:gsub("%.config.yml$", ".twig")
      end)
    end
  '';
}
