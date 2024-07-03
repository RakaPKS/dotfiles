return {
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "check",
            },
            cargo = {
                allFeatures = true,
            },
            procMacro = {
                enable = true,
            },
            inlayHints = {
                enable = true,
                showParameterNames = true,
                parameterHintsPrefix = "<- ",
                otherHintsPrefix = "=> ",
                parameterHints = {
                    enabled = true,
                    hideNamedArguments = false,
                },
                typeHints = {
                    enable = true,
                    hideClosureInitialization = false,
                    hideNamedConstructor = false,
                },
                chainingHints = { enable = true },
            },
        },
    },
}
