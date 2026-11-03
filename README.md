Claude


Readme · MD
# LeoRuntime
 
Independent research on **low Earth orbit (LEO) satellite survivability**: using machine learning on satellite telemetry to detect anomalies early enough to act on them.
 
> **Status: ongoing research, early stage.** Data gathering is in progress. There are no models or results yet, and the structure and methods below will change as the work develops.
 
## Why
 
Satellites in low Earth orbit operate with limited power, limited compute and intermittent contact with the ground. Faults that are caught late can end a mission. This project asks how well compact, onboard-friendly models can detect anomalies in telemetry, and what is lost or kept when a model is made small enough to run in orbit.
 
## Research questions
 
1. **Anomaly detection.** How accurately can models flag anomalous behaviour in satellite telemetry, and how early?
2. **Model comparison.** How does a compact CNN compare with calibrated open-weight decision models on the same task, in accuracy, calibration and compute cost?
3. **Specialisation by pruning.** If a larger model is specialised by removing weights, what does the pruned model still know, and what does it discard?
## Approach
 
The work runs in three stages:
 
| Stage | What it covers | Status |
| --- | --- | --- |
| 1. Data gathering | Collecting and preparing telemetry data | In progress |
| 2. Model creation | Compact CNN baseline, open-weight comparison arm, pruning experiments | Not started |
| 3. Deployment | Serving the models and measuring them under realistic constraints | Not started |
 
All experiments are tracked with MLflow so runs can be compared and reproduced.
 
## Background
 
The study began as a postgraduate capstone proposal (Data Science Institute, AI/ML). It was judged too large for the module's credit limit, so it is continuing as an independent project.
 
## Long-term goal
 
The name points at where this is heading: a runtime for running ML models onboard low-orbit satellites. That is a future goal of the research. The current work is the anomaly-detection study above.
 
## Repository layout
 
| Path | Contents |
| --- | --- |
| `data/` | Telemetry data and preparation outputs |
| `notebooks/` | Exploration and experiments |
| `src/leoruntime/` | Library code |
| `service/` | Model serving |
| `tests/` | Tests |
| `report/` | Written report and references |
 
## Setup
 
Requires [uv](https://docs.astral.sh/uv/). Python 3.12 is pinned in `.python-version`.
 
```
make install   # uv sync + enable git hooks in .githooks/
make lint      # ruff check + format check
make format    # auto-fix lint and format
make test      # pytest
```
 
> The repo lives on an exFAT drive, where macOS `._*` files break venv installs. Locally `.venv` is a symlink to `~/.venvs/leoruntime`: `uv venv --python 3.12 ~/.venvs/leoruntime && ln -s ~/.venvs/leoruntime .venv`
 
## Experiment tracking
 
```
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
 
Zotero with the Better BibTeX plugin auto-exports the project collection to `report/references.bib`.
 
## Author
 
Lucas Guimarães Rocha de Oliveira ([@lgrodev](https://x.com/lgrodev))
 
Claude finished the response
