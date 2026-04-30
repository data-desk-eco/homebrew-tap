# Data Desk Homebrew tap

Homebrew formulae for Data Desk tools.

For sift, the recommended install path is now [its `install.sh`](https://github.com/data-desk-eco/sift#install) (which uses `uv tool install` under the hood and is faster, with fewer moving parts). The brew formula is kept as an alternative for people already wedded to `brew`:

```bash
brew install --HEAD data-desk-eco/tap/sift
```

(The qualified name is necessary — `homebrew-core` already ships an unrelated `sift` formula, a `grep` alternative.)

## Formulae

- [`sift`](Formula/sift.rb) — investigative research agent for OCCRP Aleph or OpenAleph, with a pluggable LLM backend (local llama.cpp + Qwen 3.6 by default, or any hosted OpenAI-compatible endpoint). See [data-desk-eco/sift](https://github.com/data-desk-eco/sift).
