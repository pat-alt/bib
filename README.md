# bib 📚

This repo is used to centrally manage my references.

## Requirements

Everything here is built around [papis](https://github.com/papis/papis): the `papis/bib/` directory is a papis library (one folder per entry with an `info.yaml`), and `.papis/config` is the papis configuration that makes it discoverable. Without papis installed, this repo is just a pile of YAML files.

Install it first (any of the options at the link above works — `pipx install papis` is a common choice). The setup script below handles the rest.

## Setup

On a fresh machine, clone to `~/code/bib` and run the setup script:

```sh
git clone <repo-url> ~/code/bib
cd ~/code/bib
./setup.sh
```

After that, `papis` works from any directory.

### What the setup script does

It symlinks this repo's `.papis/` directory into `~/.config/papis`, which is papis' XDG default config location. So no `PAPIS_CONFIG_DIR` env var, no per-directory shell hooks — papis just finds the config wherever you run it.

The script is idempotent and refuses to overwrite an existing `~/.config/papis` if it's not already the expected symlink.

### Why `~/code/bib` specifically

The `.papis/config` in this repo uses `dir = ~/code/bib/papis/bib` to locate the library. If you clone elsewhere, edit that path accordingly before running `setup.sh`.

## Papis

References are managed with [papis](https://github.com/papis/papis) as a single library stored under `papis/bib/`. Categorisation is done with **tags**, not folders. Current tags in use: `peerreviewed`, `preprint`, `software`, `economics`, `thesis`, `sup-bachelors`, `sup-masters`, `other`.

### Common commands

```sh
papis list                              # list all entries
papis list tags:peerreviewed            # filter by tag
papis add --from doi 10...              # add a new reference by DOI
papis edit                              # pick + edit an entry's info.yaml
papis open                              # open the attached PDF (if any)
papis serve                             # browse the library in a web UI
```

### Exporting to BibTeX

`papis/bib/` is the source of truth; any `.bib` file is a derived artefact:

```sh
papis export --all --batch --format bibtex --out bib.bib
```

Export a tag-filtered subset for a project:

```sh
papis export --query tags:economics --batch --format bibtex --out economics.bib
```
