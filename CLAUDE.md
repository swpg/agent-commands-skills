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

- `claude/CLAUDE.md` - Global memory/instructions symlinked to `~/.claude/CLAUDE.md`
- `claude/commands/` - Custom slash commands symlinked individually to `~/.claude/commands/`
- `codex/instructions.md` - Global Codex instructions symlinked to `~/.codex/instructions.md`
- `codex/skills/` - Custom skills symlinked individually to `~/.codex/skills/`

## Adding New Commands/Skills

Place new Claude commands in `claude/commands/` and new Codex skills in `codex/skills/`. Re-run `setup.sh` to create symlinks for new additions.
