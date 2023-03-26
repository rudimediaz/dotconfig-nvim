--vim.g.adwaita_darker = true -- for darker version
--vim.g.adwaita_disable_cursorline = true -- to disable cursorline
vim.cmd([[colorscheme nord]])
-- vim.cmd("colorscheme dawnfox")


require'nvim-treesitter.configs'.setup{
    ensure_installed = {"typescript","javascript","json","css","scss","svelte","html","nix","vue","tsx","dockerfile","bash"},
    --auto_install = true, 
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
}

require('mason').setup({
  ui = {
    icons  = {
      package_installed = "v",
      package_pending = "->",
      package_uninstalled = "x"
    }
  }
})
require('mason-lspconfig').setup{
  ensure_installed = { "cssls", "html", "tsserver", "eslint", "volar", "svelte", "tailwindcss", "jsonls" }
}
require('lualine').setup({
    options = {
        theme = "nord"
    }
})
require("nvim-tree").setup()
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')

--nightfox setup
require('nightfox').setup({
    options = {
        transparent = true
    }
})



-- telescope
local tb = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', tb.find_files, {})
vim.keymap.set('n', '<leader>fg', tb.live_grep, {})
vim.keymap.set('n', '<leader>fb', tb.buffers, {})
vim.keymap.set('n', '<leader>fh', tb.help_tags, {})


-- neoformat autosave
vim.g.neoformat_try_node_exe = 1

-- Completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- cmp
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- autocompletion manual

-- LSP setup
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

-- html server
require'lspconfig'.html.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

require'lspconfig'.jsonls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

require'lspconfig'.cssls.setup {
  capabilities = capabilities,
  on_attach = on_attach 
}

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end


--require'lspconfig'.denols.setup{
--    on_attach = on_attach,
--  capabilities = capabilities,
--}

require'lspconfig'.tsserver.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    commands = {
        OrganizeImports = {
          organize_imports,
          description = "Organize Imports"
        }
    },
}

require'lspconfig'.eslint.setup{}

require'lspconfig'.tailwindcss.setup{
    capabilities = capabilities,
    on_attach = on_attach
}

require'lspconfig'.svelte.setup{
    capabilities = capabilities,
    on_attach = on_attach
}

require'lspconfig'.volar.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}

require'lspconfig'.rnix.setup{
  capabilities = capabilities,
  on_attach = on_attach
}

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
