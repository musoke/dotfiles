if isinteractive()
    using OhMyREPL
    using VimBindings
end

using Revise

function template()
    @eval begin
        using PkgTemplates
        Template(
            user = "musoke",
            plugins = [
                Tests(project=true),
                GitHubActions(extra_versions=["1.8", "nightly"]),
                GitHubPages(),
                Codecov(),
                Documenter{GitHubActions}(),
                Git(ssh = true),
                TravisCI(),
                Dependabot(),
                Develop(),
                Citation(readme=true),
                RegisterAction(),
            ],
        )
    end
end
