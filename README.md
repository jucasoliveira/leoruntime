# LeoRuntime

## Setup

Requires [uv](https://docs.astral.sh/uv/). Python 3.12 is pinned in `.python-version`.

```sh
make install   # uv sync + enable git hooks in .githooks/
make lint      # ruff check + format check
make format    # auto-fix lint and format
make test      # pytest
```

> The repo lives on an exFAT drive, where macOS `._*` files break venv installs.
> Locally `.venv` is a symlink to `~/.venvs/leoruntime`:
> `uv venv --python 3.12 ~/.venvs/leoruntime && ln -s ~/.venvs/leoruntime .venv`

## Experiment tracking

```sh
make mlflow    # UI at http://127.0.0.1:5000
```

In code or notebooks:

```python
import mlflow

mlflow.set_tracking_uri("http://127.0.0.1:5000")
mlflow.set_experiment("my-experiment")
with mlflow.start_run():
    mlflow.log_param("lr", 1e-3)
    mlflow.log_metric("loss", 0.42)
```

## References

Zotero with the Better BibTeX plugin auto-exports the project collection to
`report/references.bib`.
