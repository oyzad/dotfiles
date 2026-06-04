vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.c",
  callback = function()
    local lines = {
      "#include <stdio.h>",
      "",
      "int main(void) {",
      "    ",
      "    return 0;",
      "}",
    }
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.api.nvim_win_set_cursor(0, {5, 4})
  end,
})
