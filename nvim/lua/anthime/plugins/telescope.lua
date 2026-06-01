return {
  {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
	config = function()
		require('telescope').setup({
			defaults = {
				file_ignore_patterns = {
				  "node_modules",
				  ".git/"
				}
			}
		})
		vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)
		vim.keymap.set("n", "<space>ff", function()
			require('telescope.builtin').find_files { hidden = true }
		end)
		vim.keymap.set("n", "<space>fg", function()
			require('telescope.builtin').live_grep { hidden = true }
		end)
		vim.keymap.set("n", "<space>en", function()
			require('telescope.builtin').find_files {
				hidden = true;
				cwd = vim.fn.stdpath("config");
			}
		end)
	  end
  },
}
