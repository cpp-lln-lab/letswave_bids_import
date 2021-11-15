# Template repository for matlab analysis project

## Requirements

- Matlab - version >2017? (Possibly compatible with older versions ; Not tested
  on Octave)
- LetsWave - version 5 - 7

- There is a bids-matlab "dependency" as a git sub-module that it will be
  installed automatically if you use the `--recursive` flag when you clone the
  repository (see the `install with git` section below).

## Install with Git

1. Open a terminal and type this:

```bash
git clone --recurse-submodules https://github.com/cpp-lln-lab/letswave_bids_import.git
```

## Usage

### Add it to the Matlab path.

You can do this by running the `init_env` that is in the root folder of the
repository.

```
this_dir = fileparts(mfilename('fullpath'));

% input and output directory
cfg.bidsroot = pwd;
cfg.out_path = fullfile(cfg.bidsroot, 'derivatives');

initialize_letswave();

import_bids(cfg);
```