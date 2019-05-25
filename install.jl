import Pkg

if Base.VERSION >= VersionNumber("1.1")
    Pkg.Registry.add(
        Pkg.RegistrySpec(
            name="BCBIRegistry",
            url="https://github.com/bcbi/BCBIRegistry.git",
            uuid="26a550a3-39fe-4af4-af6d-e8814c2b6dd9",)
        )
    Pkg.Registry.add("General")
    Pkg.Registry.update()
end

root = joinpath(dirname(@__FILE__))
@info("Updating required environment at $(root)")
Pkg.activate(root)
Pkg.instantiate()
Pkg.update()
if Base.VERSION >= VersionNumber("1.3")
    Pkg.precompile()
else
    Pkg.API.precompile()
end

required_environment_list = [
    ["environments", "datasets",],
    ["environments", "interop",],
    ["environments", "interop-seaborn",],
    ["environments", "plotting",],
    ["environments", "predictmd",],
    ]

optional_environment_list = [
    ["environments", "vegalite",],
    ]

for environment in required_environment_list
    location = joinpath(dirname(@__FILE__), environment...)
    @info("Updating required environment at $(location)")
    Pkg.activate(location)
    Pkg.instantiate()
    Pkg.update()
    if Base.VERSION >= VersionNumber("1.3")
        Pkg.precompile()
    else
        Pkg.API.precompile()
    end
end

for environment in optional_environment_list
    location = joinpath(dirname(@__FILE__), environment...)
    @info("Updating optional environment at $(location)")
    Pkg.activate(location)
    try
        Pkg.instantiate()
    catch ex
        @error("Encountered a non-fatal error", exception=ex, environment)
    end
    try
        Pkg.update()
    catch ex
        @error("Encountered a non-fatal error", exception=ex, environment)
    end
    if Base.VERSION >= VersionNumber("1.3")
        try
            Pkg.precompile()
        catch ex
            @error("Encountered a non-fatal error", exception=ex, environment)
        end
    else
        try
            Pkg.API.precompile()
        catch ex
            @error("Encountered a non-fatal error", exception=ex, environment)
        end
    end
end
