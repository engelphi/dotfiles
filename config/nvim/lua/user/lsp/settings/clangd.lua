return {
    cmd = { "clangd", "--header-insertion=never", "--suggest-missing-includes","-all-scopes-completion", "-completion-style=detailed", "-function-arg-placeholders", "-j=2", "-log=verbose", "-background-index",  "-cross-file-rename" }
}
