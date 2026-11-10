# Essential Claude Skills

Five practical [Claude Skills](https://docs.claude.com/en/docs/agents-and-tools/agent-skills/overview) for people who learn and build on their own: free learning roadmaps, Socratic mentoring, READMEs, security review, and context compression.

![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)
![Skills: 5](https://img.shields.io/badge/skills-5-8A2BE2)

## The skills

| Skill | What it does | Try saying |
|---|---|---|
| [`roadmap-curator`](skills/roadmap-curator/SKILL.md) | Phased learning plan using only free resources, with a milestone project per phase | "Make me a roadmap to learn Rust, 6 hrs/week" |
| [`code-mentor`](skills/code-mentor/SKILL.md) | Socratic tutor: hint ladder instead of handing over the answer | "Mentor mode â€” why does this loop skip the last item?" |
| [`readme-architect`](skills/readme-architect/SKILL.md) | README grounded in the actual repo, no invented commands | "Write a README for this repo" |
| [`security-review`](skills/security-review/SKILL.md) | Source-to-sink review with severity, impact and a concrete fix per finding | "Security review this Flask app" |
| [`context-optimizer`](skills/context-optimizer/SKILL.md) | Compresses a codebase/log/chat into a task-focused context pack | "Make a handoff pack so I can continue in a new chat" |

Each skill is a single `SKILL.md`. Claude loads it automatically when your request matches its description.

## Install

### Claude Code (plugin, recommended)

```bash
/plugin marketplace add HosseinShahverdi/essential-claude-skills
/plugin install essential-skills@essential-claude-skills
```

### Claude Code (manual)

```bash
git clone https://github.com/HosseinShahverdi/essential-claude-skills.git
cp -r essential-claude-skills/skills/* ~/.claude/skills/
```

Use `.claude/skills/` inside a project instead of `~/.claude/skills/` to scope them to that project.

### Claude.ai

1. Download a skill zip from [Releases](../../releases) (or zip a folder under `skills/` yourself).
2. Go to **Settings â†’ Capabilities â†’ Skills** and upload it.

Code execution must be enabled for skills on Claude.ai.

## Examples

See [`examples/`](examples/) for sample prompts and what each skill produces.

## Design principles

- **Honest over impressive.** Skills tell Claude not to fabricate URLs, commands, or findings, and to mark uncertainty.
- **Small and focused.** One job per skill, short enough to read in two minutes.
- **Free by default.** `roadmap-curator` never recommends paywalled resources.

## Contributing

New skills and improvements are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

[MIT](LICENSE)
