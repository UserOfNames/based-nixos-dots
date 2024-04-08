require('lspconfig').nil_ls.setup({
	on_init = function(client)
		client.server_capabilities.semanticTokensProvider = nil
	end,
})
