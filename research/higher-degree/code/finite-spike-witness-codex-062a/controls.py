"""Numerical controls for the finite-spike trial. Agent-ID: codex-062a."""
import json
from pathlib import Path
from runpy import run_path

import numpy as np

# run_path also works with Python isolated mode (-I).
HERE = Path(__file__).resolve().parent
trial = run_path(str(HERE / "trial.py"))
previous = run_path(str(HERE.parent / "finite-spike-codex-a7c4/explore.py"))


def main():
    row = json.loads((trial["ROWS"] / "g84/rows_all.lines").read_text().splitlines()[6])
    sig = row["sig"]
    grid = (26, 24, 20, 28)
    point = np.array([.001, 0., -.0008, 0., 0., 0., 0.])
    other = previous["Trial"](row, .1, grid)
    old0, _ = other.evaluate(np.array([row["nu5"], 0., 0.]))
    old1, oldgrad = other.evaluate(np.array([row["nu5"], point[0], point[2]]))
    _, gain, grad = trial["evaluate"](row, sig, .1, point, grid)
    if abs(gain - (old1 - old0)) > 1e-12 or max(abs(grad[[0,2]] - oldgrad[1:])) > 1e-12:
        raise ValueError("existing three-coefficient implementation disagrees")

    x = np.array(trial["TRIAL"]["g84"]) / 1e8
    _, _, grad = trial["evaluate"](row, sig, .1, x, grid)
    for i in range(7):
        step = np.eye(7)[i] * 1e-6
        plus = trial["evaluate"](row, sig, .1, x + step, grid)[1]
        minus = trial["evaluate"](row, sig, .1, x - step, grid)[1]
        if abs((plus-minus)/2e-6 - grad[i]) > 2e-9:
            raise ValueError(f"gradient mismatch at coordinate {i}")
    f0, _, _ = trial["evaluate"](row, sig, 0., np.zeros(7), grid)
    if abs(f0-trial["diffuse"](row, sig, grid)) > 1e-12:
        raise ValueError("zero-spike control disagrees with the diffuse integral")
    print("Three-coefficient overlap, seven derivatives and the zero-spike control agree.")


if __name__ == "__main__":
    main()
