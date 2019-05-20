for (root, dirs, files,) in walkdir(dirname(@__FILE__); onerror=(x)->())
    for file in files
        if lowercase(strip(file)) == "manifest.toml"
            path = joinpath(root, file,)
            @info("Removing $(path)")
            rm(
                path;
                force = true,
                recursive = true,
                )
        end
    end
end
