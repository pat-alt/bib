# bib 📚

This repo is used to centrally manage my references. It also builds a simple [website](http://www.paltmeyer.com/bib/) that provides an overview of the literature included here. For some of the literature, the website also includes my own notes.

## Papis

References are managed with [papis](https://github.com/papis/papis) as a single library stored under `papis/bib/`. The papis config lives at `~/.config/papis/config` and points here.

Categorisation is done with **tags**, not folders. Current tags in use: `peerreviewed`, `preprint`, `software`, `economics`, `thesis`, `sup-bachelors`, `sup-masters`, `other`.

### Common commands

```sh
papis list                              # list all entries
papis list tags:peerreviewed            # filter by tag
papis add --from doi 10...              # add a new reference by DOI
papis edit                              # pick + edit an entry's info.yaml
papis open                              # open the attached PDF (if any)
papis serve                             # browse the library in a web UI
```

### Regenerating `bib.bib` for Quarto

`papis/bib/` is the source of truth; `bib.bib` is a build artefact used by Quarto:

```sh
papis export --all --batch --format bibtex --out bib.bib
```

Export a tag-filtered subset for a project:

```sh
papis export --query tags:economics --batch --format bibtex --out economics.bib
```
