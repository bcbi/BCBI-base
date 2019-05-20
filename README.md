# BCBI-base: Julia packages commonly used by the Brown Center for Biomedical Informatics (BCBI)

[![Build Status](https://travis-ci.org/bcbi/BCBI-base.svg?branch=master)](https://travis-ci.org/bcbi/BCBI-base/branches)

## Usage

```bash
cd /path/to/desired/location
git clone https://github.com/bcbi/BCBI-base
cd BCBI-base
julia --project install.jl
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
