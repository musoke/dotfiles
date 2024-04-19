try
    if isinteractive()
        using OhMyREPL
        using VimBindings
    end

    using Revise
catch err
    @warn "Error loading startup packages" err
end


if isinteractive()
    function template()
        @eval begin
            using PkgTemplates
            Template(
                user = "musoke",
                julia = v"1.10.0",
                plugins = [
                    Tests(project = true),
                    GitHubActions(extra_versions = ["1", "nightly"]),
                    GitHubPages(),
                    Codecov(),
                    Documenter{GitHubActions}(),
                    Git(ssh = true),
                    TravisCI(),
                    Dependabot(),
                    Develop(),
                    Citation(readme = true),
                    RegisterAction(),
                ],
            )
        end
    end
end
