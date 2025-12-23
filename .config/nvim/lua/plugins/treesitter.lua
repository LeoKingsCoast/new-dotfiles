return {
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate',
		config = function ()
			local ts = require('nvim-treesitter')

			-- Wait at most 30 seconds to finish installation.
			ts.install(
				{
          "lua",
          "vim",
          "vimdoc",
          "c",
          "cpp",
          "make",
          "cmake",
          "query",
          "markdown",
          "markdown_inline",
          "python",
          "javascript",
          "html",
          "json",
          "yaml",
          "regex",
          "bash",
          "nasm",
				},
				-- Do not print summary, as this will run at startup always, all the time.
				{ summary = false }
			):wait(30000)

			local install_parser_and_enable_features = function(event)
				local lang = event.match

				-- Try to start the parser install for the language.
				local ok, task = pcall(ts.install, { lang }, { summary = true })
				if not ok then return end

				-- Wait for the installation to finish (up to 10 seconds).
				task:wait(10000)

				-- Enable syntax highlighting for the buffer
				ok, _ = pcall(vim.treesitter.start, event.buf, lang)
				if not ok then return end

				-- Enable other features as needed.

				-- Enable indentation based on treesitter for the buffer.
				-- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

				-- Enable folding based on treesitter for the buffer.
				-- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
			end

			-- Install missing parsers on file open.
			vim.api.nvim_create_autocmd('FileType', {
				group = vim.api.nvim_create_augroup('ui.treesitter', { clear = true }),
				pattern = { '*' },
				callback = install_parser_and_enable_features
			})

		end
	},
}
