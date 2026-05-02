# Data Desk Homebrew tap

Homebrew casks and formulae for [Data Desk](https://datadesk.eco) tools.

## Casks

- [`sift`](Casks/sift.rb) — investigative research agent for [Aleph](https://aleph.occrp.org) or [OpenAleph](https://openaleph.org/), with a pluggable LLM backend (local llama.cpp + Qwen 3.6 by default, or any hosted OpenAI-compatible endpoint). See [data-desk-eco/sift](https://github.com/data-desk-eco/sift).

## Install

```bash
brew install --cask data-desk-eco/tap/sift
```

The qualified name is necessary because `homebrew-core` already ships an unrelated `sift` formula (a `grep` alternative).

## Updating

Casks here are bumped automatically by the [release workflow](https://github.com/data-desk-eco/sift/blob/main/.github/workflows/release.yml) in each tool's repo when a `v*` tag is pushed.
