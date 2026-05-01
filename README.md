# CS336 Study Repository

Personal workspace for studying Stanford CS336, "Language Modeling from Scratch".

Official references:

- Course site: <https://cs336.stanford.edu/>
- Course GitHub organization: <https://github.com/stanford-cs336>

## Repository Layout

```text
assignments/        # Workspaces and notes for each CS336 assignment
notes/              # Lecture, paper, and concept notes
experiments/        # Small local experiments that are not tied to one assignment
resources/          # Reading lists, links, setup notes, and command snippets
scripts/            # Local helper scripts
```

## Assignments

Each assignment has its own folder under `assignments/`. Keep implementation files,
debug notes, experiment logs, and final writeups close to the assignment they belong to.

| Folder | Topic | Official starter |
| --- | --- | --- |
| `assignments/assignment1-basics/` | Transformer LM basics | <https://github.com/stanford-cs336/assignment1-basics> |
| `assignments/assignment2-systems/` | Systems and training performance | <https://github.com/stanford-cs336/assignment2-systems> |
| `assignments/assignment3-scaling/` | Scaling laws and experiments | <https://github.com/stanford-cs336/assignment3-scaling> |
| `assignments/assignment4-data/` | Data processing and filtering | <https://github.com/stanford-cs336/assignment4-data> |
| `assignments/assignment5-alignment/` | Alignment and RL | <https://github.com/stanford-cs336/assignment5-alignment> |

To import official starter code into an empty assignment folder:

```powershell
.\scripts\import-assignment.ps1 assignment1-basics
```

## Notes

Use `notes/lectures/` for lecture-by-lecture notes, `notes/papers/` for paper notes,
and `notes/concepts/` for reusable explanations such as tokenization, attention,
optimization, distributed training, scaling laws, and RLHF.

## Local Artifacts

Large generated files should stay out of Git. Put datasets, checkpoints, logs, and
temporary outputs in ignored folders such as `local_data/`, `checkpoints/`, `runs/`,
or `outputs/`.

## Academic Use

This repository is for personal learning and independent practice. When using official
course material, follow the course collaboration and honor-code rules.
