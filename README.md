# BCBI-base: Julia packages commonly used by the Brown Center for Biomedical Informatics (BCBI)

[![Bors enabled](https://bors.tech/images/badge_small.svg)](https://app.bors.tech/repositories/12341)
[![Build Status](https://travis-ci.org/bcbi/BCBI-base.svg?branch=master)](https://travis-ci.org/bcbi/BCBI-base/branches)

## Usage

```bash
cd /path/to/desired/location
git clone https://github.com/bcbi/BCBI-base
cd BCBI-base
julia --project install.jl
```

## Creating custom environments

It is easy to create custom environments that contain any combination of packages.
```bash
mkdir my_environment_name
cd my_environmnent_name
touch Project.toml
julia —-project
```
Now that you are in Julia, you can add the specific combination of packages that you want. For example, the following commands will add `DecisionTree`, `GLM`, and `PredictMD` to your environment:
```julia
import Pkg
Pkg.add([“DecisionTree”, “GLM”, “PredictMD”,])
```

## Troubleshooting

If you encounter an error, try running the following two lines:
```bash
julia --project clean.jl
julia --project install.jl
```

If this does not resolve the error, try running the following three lines:
```bash
rm -rf $HOME/.julia
julia --project clean.jl
julia --project install.jl
```

If you are still encountering an error, please [open a new issue](https://github.com/bcbi/BCBI-base/issues/new).
