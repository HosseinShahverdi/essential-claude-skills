# Contributing

## Adding a skill

1. Create `skills/<skill-name>/SKILL.md` (lowercase, hyphens, max 64 chars).
2. Start with YAML frontmatter:
   ```yaml
   ---
   name: <skill-name>          # must match the folder name
   description: <what it does + when to use it, max 1024 chars>
   ---
   ```
   The description decides when Claude loads the skill — include the phrases a user would actually say.
3. Keep the body focused and under ~500 lines. Put long reference material in extra files in the same folder and link to them.
4. Add the skill to the table in `README.md` and an example in `examples/`.
5. Run `./scripts/validate.sh` before opening a PR.

## Improving a skill

Open a PR with a before/after example showing what the change fixes.

## Ground rules

- Skills must not instruct Claude to fabricate links, commands, or results.
- No skills for malware, credential harvesting, or attacking systems you don't own.
