for filename in vim.fn.globpath(vim.fn.stdpath('config')..'/lua', '*.lua'):gmatch("([^/.]+)%.lua") do
  require(filename)
end
