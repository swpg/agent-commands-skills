# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Purpose

This repository stores portable AI assistant configurations (commands, skills, global memory files) for Claude Code and Codex. A setup script symlinks these configs to their global locations (`~/.claude/` and `~/.codex/`) for easy setup on new machines.

## Setup

```bash
./setup.sh
```

This creates symlinks from repo files to system locations, backing up any existing files to `~/.ai-config-backups/[timestamp]/`.

## Repository Structure

- `instructions/global-instructions.md` - Shared instructions symlinked to both `~/.claude/CLAUDE.md` and `~/.codex/AGENTS.md`
- `commands/` - Custom slash commands symlinked to both `~/.claude/commands/` and `~/.codex/commands/`
- `skills/` - Custom skills symlinked to both `~/.claude/skills/` and `~/.codex/skills/`

## Adding New Commands/Skills

Place new commands in `commands/` and new skills in `skills/`. Re-run `setup.sh` to create symlinks for new additions.
