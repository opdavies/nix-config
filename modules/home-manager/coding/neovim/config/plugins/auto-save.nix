{
  plugins.auto-save.enable = true;

  plugins.auto-save.settings.condition = ''
    function(buf)
      local excluded_filetypes = {
        "harpoon",
        "oil",
      }

      local excluded_filenames = {}

      if vim.tbl_contains(excluded_filetypes, vim.fn.getbufvar(buf, "&filetype"))
        or vim.tbl_contains(excluded_filenames, vim.fn.expand("%:t"))
      then
        return false
      end

      return true
    end
  '';
}
