local function yaml_ft(path, _)
  -- check if file is in roles, tasks, or handlers folder
  local path_regex = vim.regex "(handlers\\|host_vars\\|group_vars\\|plays\\|roles\\|tasks)/"
  if path_regex and path_regex:match_str(path) then return "yaml.ansible" end
  -- return yaml if nothing else
  return "yaml"
end

vim.filetype.add {
  extension = {
    yml = yaml_ft,
    yaml = yaml_ft,
  },
}
