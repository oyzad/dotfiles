-- install themes 
vim.pack.add({ "https://github.com/sainnhe/everforest" })
vim.pack.add({ "https://github.com/folke/tokyonight.nvim" })
vim.pack.add({ "https://github.com/oskarnurm/koda.nvim" })
vim.pack.add({ "https://github.com/ramojus/mellifluous.nvim" })
vim.pack.add({ "https://github.com/kvrohit/substrata.nvim" })


-- config

vim.g.everforest_background = 'hard'

require("koda").setup({ transparent = true })

require('tokyonight').setup({
  options = {
    dim_inactive = true,
  }
})

require("mellifluous").setup({
    colorset = {"mellifluous", "mountain"},
    styles = { -- see :h attr-list for options. set {} for NONE, { option = true } for option
        main_keywords = { bold = true },
    },
})

-- setup theme change config


local colorschemes = {}
colorschemes.items = {
    { repo = "oskarnurm/koda.nvim", schemes = { "koda", "koda-dark", "koda-light", "koda-glade", "koda-moss" } },
    { repo = "folke/tokyonight.nvim", schemes = { "tokyonight", "tokyonight-night", "tokyonight-storm", "tokyonight-day", "tokyonight-moon" } },
    { repo = "sainnhe/everforest", schemes = { "everforest" } },
    { repo = "ramojus/mellifluous.nvim", schemes = {"mellifluous", "mountain"} },
    { repo = "kvrohit/substrata.nvim", schemes = { "substrata" }, },
}
function colorschemes.names()
    local names = {}
    for _, item in ipairs(colorschemes.items) do
        vim.list_extend(names, item.schemes)
    end
    return names
end


local theme_manager = {}

local config = {
    themes = colorschemes.names(),
    default = "koda-dark", -- Set your preferred startup default here
    state_file = vim.fn.stdpath("state") .. "/theme.txt",
}

local function index_of(name)
    for i, theme in ipairs(config.themes) do
        if theme == name then return i end
    end
    return nil
end

local function persist(name)
    local dir = vim.fn.fnamemodify(config.state_file, ":h")
    vim.fn.mkdir(dir, "p")
    vim.fn.writefile({ name }, config.state_file)
end

local function read_persisted()
    if vim.fn.filereadable(config.state_file) == 0 then return nil end
    local lines = vim.fn.readfile(config.state_file)
    return lines[1]
end

local function apply(name, opts)
    opts = opts or {}

    if not index_of(name) then
        vim.notify(("Unknown theme: %s"):format(name), vim.log.levels.ERROR)
        return false
    end

    -- FIXED: Only call koda.setup if the theme actually belongs to koda
    if name:find("koda") == 1 then
        pcall(function() require("koda").setup({ transparent = true }) end)

    elseif name:find("mellifluous") == 1 or name == "mountain" or name == "alduin" or name == "tender" then
        pcall(function()
            local target_colorset = "mellifluous"
            if name == "mountain" then target_colorset = "mountain"
            elseif name == "alduin" then target_colorset = "alduin"
            elseif name == "tender" then target_colorset = "tender"
            end
            
            require("mellifluous").setup({
                colorset = target_colorset,
                mellifluous = { neutral = true }
            })
        end)
        name = "mellifluous"
    end

    local ok, err = pcall(vim.cmd.colorscheme, name)
    if not ok then
        vim.notify(("Failed to load theme %s: %s"):format(name, err), vim.log.levels.ERROR)
        return false
    end

    if opts.persist ~= false then
        persist(name)
    end

    if opts.notify then
        vim.notify(("Theme: %s"):format(name), vim.log.levels.INFO)
    end

    return true
end

function theme_manager.current()
    return vim.g.colors_name
end

function theme_manager.cycle(step)
    step = step or 1
    local current = theme_manager.current()
    local current_index = index_of(current) or index_of(config.default) or 1
    local next_index = ((current_index - 1 + step) % #config.themes) + 1
    return apply(config.themes[next_index], { notify = true })
end

function theme_manager.select()
    vim.ui.select(config.themes, {
        prompt = "Select theme",
        format_item = function(item)
            if item == theme_manager.current() then
                return item .. " (current)"
            end
            return item
        end,
    }, function(choice)
        if choice then
            apply(choice, { notify = true })
        end
    end)
end

function theme_manager.load()
    local name = read_persisted() or config.default
    if apply(name, { persist = false }) then return end
    if name ~= config.default then apply(config.default) end
end


theme_manager.load()

vim.keymap.set('n', '<leader>t', theme_manager.select, { silent = true, desc = 'Theme: Select Dropdown' })
