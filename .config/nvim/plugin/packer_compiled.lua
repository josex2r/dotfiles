-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/joseluis.represa/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/joseluis.represa/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/joseluis.represa/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/joseluis.represa/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/joseluis.represa/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["barbar.nvim"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["coc-neco"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/coc-neco"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/coc.nvim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/impatient.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["sad.vim"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/sad.vim"
  },
  ["telescope-coc.nvim"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/telescope-coc.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["traces.vim"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/traces.vim"
  },
  ["vim-altscreen"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/vim-altscreen"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-ember-hbs"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/vim-ember-hbs"
  },
  ["vim-ember-imports"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/opt/vim-ember-imports"
  },
  ["vim-enmasse"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/vim-enmasse"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-javascript-imports"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/vim-javascript-imports"
  },
  ["vim-js-pretty-template"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/vim-js-pretty-template"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/vim-sleuth"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/Users/joseluis.represa/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
