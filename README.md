# bib 📚

This repo is used to centrally manage my references. It also builds a simple [website](http://www.paltmeyer.com/bib/) that provides an overview of the literature included here. For some of the literature, the website also includes my own notes.

## Papis

References are managed with [papis](https://github.com/papis/papis). Each `.bib` file corresponds to a papis library stored under `papis/<name>/`; the `.bib` files are regenerated from those libraries.

### Setup

```sh
export PAPIS_CONFIG_DIR="$PWD/.papis"
# optional shell alias
alias pbib='PAPIS_CONFIG_DIR='"$PWD"'/.papis papis'
```

Available libraries: `bib` (default), `peer`, `pre`, `soft`, `thesis`, `vardsa`, `sup_bachelors`, `sup_masters`, `other`.

### Common commands

```sh
papis -l peer list                  # list entries in the peer library
papis -l peer add --from doi 10...  # add a new reference by DOI
papis -l peer edit                  # pick + edit an entry's info.yaml
papis -l peer open                  # open the attached PDF (if any)
papis explore bibtex -b peer.bib pick   # fuzzy-pick from the .bib directly
```

### Regenerating `.bib` files for Quarto

`papis/` is the source of truth; the `.bib` files are build artefacts:

```sh
make bib              # rebuild every .bib from its papis library
make peer.bib         # rebuild just one
make render           # make bib && quarto render
```
