# CS336 学习仓库 / CS336 Study Repository

这是我学习 Stanford CS336, "Language Modeling from Scratch" 的个人仓库，用来保存作业代码、课程笔记、论文笔记、实验记录和本地配置说明。

This is my personal workspace for studying Stanford CS336, "Language Modeling from Scratch". It stores assignment code, lecture notes, paper notes, experiment logs, and local setup notes.

官方资料 / Official References:

- 课程主页 / Course site: <https://cs336.stanford.edu/>
- 官方 GitHub 组织 / Official GitHub organization: <https://github.com/stanford-cs336>

## 怎么用 / How To Use

### 1. 从 Assignment 1 开始 / Start With Assignment 1

5 个官方作业 starter code 已经下载到 `assignments/` 里了，不需要再手动建文件夹或下载仓库。

The official starter code for all 5 assignments has already been imported into `assignments/`. You do not need to create folders or download the repos again.

```powershell
cd E:\pycharm\CS336\assignments\assignment1-basics
```

进入作业目录后，先看：

After entering an assignment folder, read:

- `README.md`: 官方作业说明 / official assignment instructions
- `*.pdf`: 作业 handout / assignment handout
- `tests/`: 官方测试 / official tests
- `README.study.md`: 本仓库保留的学习说明 / local study note for this repo

### 2. 写代码 / Write Code

每个作业目录是独立工作区。作业代码、测试、调试记录和最终答案都放在对应作业目录里。

Each assignment folder is its own workspace. Keep implementation, tests, debug notes, and final writeups inside the matching assignment directory.

推荐用法 / Suggested usage:

```text
assignments/assignment1-basics/
  README.md              # 官方说明 / official instructions
  README.study.md        # 本仓库说明 / local study notes
  cs336_basics/          # 你要实现的代码 / code to implement
  tests/                 # 官方测试 / official tests
  notes.md               # 你的解题笔记 / your solution notes
  commands.md            # 常用命令 / useful commands
  experiments.md         # 实验记录 / experiment logs
  writeup.md             # 最终答案或总结 / final writeup or summary
```

如果这些 `.md` 文件还不存在，可以自己在对应作业目录里新建。

If these `.md` files do not exist yet, create them inside the assignment folder when needed.

### 3. 记笔记 / Take Notes

课程笔记不要散放在作业代码里，建议按类型放到 `notes/`：

Keep course notes organized under `notes/` instead of scattering them across assignment code:

```text
notes/lectures/          # 每节课笔记 / lecture notes
notes/papers/            # 论文笔记 / paper notes
notes/concepts/          # 概念总结 / concept notes
```

例子 / Examples:

```text
notes/lectures/lecture-01.md
notes/papers/attention-is-all-you-need.md
notes/concepts/tokenization.md
notes/concepts/transformer.md
notes/concepts/scaling-laws.md
```

### 4. 跑测试 / Run Tests

每个 assignment 都有自己的 `pyproject.toml` 和测试目录。先进入对应作业目录，再按官方 README 配环境和跑测试。

Each assignment has its own `pyproject.toml` and tests. Enter the assignment folder first, then follow its official README for environment setup and testing.

常见流程 / Common workflow:

```powershell
cd E:\pycharm\CS336\assignments\assignment1-basics
pytest
```

如果作业 README 要求使用 `uv`，就在对应目录运行 `uv sync` 或 README 里指定的命令。

If the assignment README asks for `uv`, run `uv sync` or the exact command specified by that README inside the assignment folder.

### 5. 保存进度 / Save Progress

在根目录提交所有学习进度：

Commit all study progress from the repository root:

```powershell
cd E:\pycharm\CS336
git status
git add .
git commit -m "Work on assignment 1"
git push
```

拉取远端最新版本：

Pull the latest remote version:

```powershell
cd E:\pycharm\CS336
git pull
```

## 仓库结构 / Repository Layout

```text
assignments/        # 每次作业的代码和说明 / assignment workspaces
notes/              # 课程、论文、概念笔记 / lecture, paper, and concept notes
experiments/        # 不属于单个作业的小实验 / small standalone experiments
resources/          # 链接、配置、资料、命令片段 / links, setup notes, and snippets
scripts/            # 本地辅助脚本 / local helper scripts
```

## 作业目录 / Assignments

| Folder | 中文说明 | English Topic | Official Starter |
| --- | --- | --- | --- |
| `assignments/assignment1-basics/` | Transformer 语言模型基础 | Transformer LM basics | <https://github.com/stanford-cs336/assignment1-basics> |
| `assignments/assignment2-systems/` | 训练系统和性能优化 | Systems and training performance | <https://github.com/stanford-cs336/assignment2-systems> |
| `assignments/assignment3-scaling/` | Scaling laws 和实验 | Scaling laws and experiments | <https://github.com/stanford-cs336/assignment3-scaling> |
| `assignments/assignment4-data/` | 数据处理、清洗和过滤 | Data processing and filtering | <https://github.com/stanford-cs336/assignment4-data> |
| `assignments/assignment5-alignment/` | Alignment、SFT、RL | Alignment, SFT, and RL | <https://github.com/stanford-cs336/assignment5-alignment> |

## 导入脚本 / Import Script

所有作业已经导入好了，正常情况下不需要再运行导入脚本。

All assignments have already been imported, so normally you do not need to run the import script again.

如果以后新建了空作业目录，或者要重新导入某个官方 starter，可以使用：

If you later create an empty assignment folder or want to import a starter again, use:

```powershell
.\scripts\import-assignment.ps1 assignment1-basics
```

注意：脚本只会导入到空目录。如果目标目录已经有代码，它会停止，避免覆盖你的作业。

Note: the script only imports into an empty folder. If the target folder already contains code, it stops to avoid overwriting your work.

## 不要提交的东西 / What Not To Commit

大文件和本地训练产物不要提交到 Git：

Do not commit large generated files or local training artifacts:

```text
local_data/
datasets/
checkpoints/
runs/
outputs/
wandb/
tensorboard/
*.ckpt
*.pt
*.pth
*.safetensors
```

官方 starter code 自带的小测试模型和 fixture 已经作为课程文件提交了。以后你自己训练出来的 checkpoint、日志、数据集请放到上面这些被忽略的目录里。

Small official test models and fixtures from the starter code are already tracked as course files. Put your own trained checkpoints, logs, and datasets into the ignored folders above.

## 学习建议 / Study Workflow

建议顺序：

Suggested order:

1. 看课程视频或讲义 / Watch the lecture or read the notes.
2. 在 `notes/lectures/` 写课程笔记 / Write lecture notes in `notes/lectures/`.
3. 阅读当前 assignment 的 `README.md` 和 PDF / Read the assignment `README.md` and PDF.
4. 先跑一次测试，看失败点 / Run tests once and inspect failures.
5. 小步实现、小步提交 / Implement and commit in small steps.
6. 把踩坑、命令、实验结果记到作业目录的 `.md` 文件里 / Record pitfalls, commands, and results in assignment-level `.md` files.

## 学术使用 / Academic Use

这个仓库用于个人学习和独立练习。使用官方课程材料时，请遵守课程协作规则和 honor code。

This repository is for personal learning and independent practice. When using official course material, follow the course collaboration rules and honor code.
