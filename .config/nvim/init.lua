for filename in vim.fn.globpath(vim.fn.stdpath('config'), '*.lua'):gmatch("([^/.]+).lua") do
  if(filename ~= 'init')
  then
    require(filename)
  end
end
