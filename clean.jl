for (root, dirs, files,) in walkdir(dirname(@__FILE__); onerror=(x)->())
    for file in files
        if lowercase(strip(file)) == "manifest.toml"
            path = joinpath(root, file,)
            @info("Removing $(path)")
            try
                rm(path; force = true, recursive = true,)
            catch ex
                @warn("Ignoring error", exception=ex,)
            end
        end
    end
end
