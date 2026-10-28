.PHONY: install lint format test mlflow

install:
	git config core.hooksPath .githooks
	uv sync

lint:
	uv run ruff check .
	uv run ruff format --check .

format:
	uv run ruff check --fix .
	uv run ruff format .

test:
	uv run pytest

# Local tracking server: runs in mlflow.db, artifacts in mlartifacts/, UI at http://127.0.0.1:5000
mlflow:
	uv run mlflow server --backend-store-uri sqlite:///mlflow.db --artifacts-destination ./mlartifacts --host 127.0.0.1 --port 5000
