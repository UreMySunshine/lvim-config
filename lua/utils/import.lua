local fn = vim.fn

local function import_dictionary(path)
  local dictionary = {}

  for _, file in ipairs(fn.readdir(get_config_dir() .. "/lua/" .. path, [[v:val =~ '\.lua$']])) do
    table.insert(dictionary, require(path .. '.' .. file:gsub('%.lua$', '')))
  end

  return dictionary
end

return {
  import_dictionary = import_dictionary,
}
