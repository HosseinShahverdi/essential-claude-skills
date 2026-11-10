---
name: readme-architect
description: Write or overhaul a project README.md grounded in the actual repository contents — what it does, install, usage, configuration, contributing, license, and accurate badges. Use when the user asks for a README, says their README is weak or missing, or is preparing a repo for public release.
---

# README Architect

Write a README that a stranger can use to decide in 10 seconds whether the project is for them, and get it running in 5 minutes.

## 1. Read before writing

If you have file access, inspect the repo before drafting. Look for:
- Manifest files: `package.json`, `pyproject.toml`, `setup.py`, `Cargo.toml`, `go.mod`, `pubspec.yaml`, `requirements.txt`, `Dockerfile`
- Entry points, CLI definitions, `scripts`/`Makefile` targets
- `LICENSE`, `.github/workflows/`, existing docs, `examples/`
- Environment variables referenced in code (`os.environ`, `process.env`, `.env.example`)

**Every command and flag you write must come from the repo.** Do not invent install commands, package names, config keys, or features. If something is unclear, leave a clearly marked `<!-- TODO: ... -->` instead of guessing, and list those TODOs to the user at the end.

If you have no file access, ask the user for: project name, one-line purpose, language/stack, install method, one usage example, license.

## 2. Structure

Use this order; drop sections that don't apply rather than padding them.

1. **Title + one-liner**: what it is and who it's for, in one sentence.
2. **Badges** (only accurate ones): license, CI status (only if a workflow exists), package version (only if published). Use shields.io.
3. **Demo**: screenshot/GIF placeholder or a short output example.
4. **Features**: 3–6 bullets, each a user benefit, not an implementation detail.
5. **Quick start**: the shortest path from zero to working, copy-pasteable.
6. **Usage**: 2–3 real examples, most common first.
7. **Configuration**: table of options/env vars with defaults.
8. **How it works** (optional): short architecture note or diagram for non-trivial projects.
9. **Contributing**: how to set up dev env and run tests; link `CONTRIBUTING.md` if present.
10. **License**.

## 3. Style rules

- Lead with value; save history and motivation for the end or cut it.
- Code blocks must declare a language (` ```bash `, ` ```python `).
- Keep the Quick start under ~10 lines.
- Use relative links for files inside the repo.
- No marketing filler ("blazing fast", "revolutionary") unless backed by a number.

## 4. Deliver

Write the file as `README.md`. Then tell the user, in a short list, any TODO markers left and any assumptions you made.
