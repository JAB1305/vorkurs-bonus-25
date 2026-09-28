# Vorkurs 2026 — Bonus Material

Java teaching notebooks. Kernel: [IJava](https://github.com/SpencerPark/IJava).

## Setup (Linux)

Prereqs: JDK 11+, Python 3.10+, [uv](https://docs.astral.sh/uv/).

```bash
# 1. jupyterlab in project-local venv
uv sync

# 2. IJava kernel (one-time, per machine). Run from project root.
curl -L -o /tmp/ijava.zip https://github.com/SpencerPark/IJava/releases/download/v1.3.0/ijava-1.3.0.zip
unzip /tmp/ijava.zip -d /tmp/ijava
uv run python /tmp/ijava/install.py --user
```

Verify: `uv run jupyter kernelspec list` shows `java`.

## Run

Edit notebooks in place:
```bash
uv run jupyter lab notebooks/
```

Or play on throwaway copies (originals untouched, scratch wiped on exit):
```bash
./run-scratch.sh
```

Cells: **Shift+Enter**.

## PyCharm Pro

Notebooks work natively. Point interpreter at `.venv/` (`uv sync` created it). Jupyter server auto-starts.

- Settings → Project → Python Interpreter → Add → Existing → `.venv/bin/python`
- Open `.ipynb` → PyCharm handles the rest. Java cells run via IJava kernel.

`.idea/` in repo has shared config; per-user state gitignored.

## Structure

```
notebooks/
  game_of_life.ipynb   # Conway's Game of Life (arrays, loops)
  fibonacci.ipynb      # Fibonacci: recursion vs iteration
pyproject.toml         # jupyterlab dep for uv
run-scratch.sh         # launch lab on throwaway copies
```
