---
name: context-optimizer
description: Compress a large codebase, log, document, or long conversation into a compact "context pack" that preserves what matters for a specific task — key files, signatures, decisions, errors, and open questions — so it can be pasted into a new chat or handed to another agent. Use when the user says the context is too long, wants to start a fresh chat without losing progress, asks for a handoff summary, or wants to shrink a prompt.
---

# Context Optimizer

Turn a lot of material into the smallest text that still lets a fresh model do the task well.

## 1. Anchor on the task

Ask (or infer) one thing: **what will the next reader need to do with this?** ("fix the auth bug", "continue writing chapter 3", "review the API design"). Compression is only lossless relative to a task. If no task is given, assume "continue the current work".

## 2. Keep / cut rules

**Keep (verbatim where it matters):**
- Exact error messages, stack-trace top frames, failing test names
- Function/class signatures, types, public interfaces, config keys, env var names
- Decisions already made *and why* ("chose Postgres over SQLite because of concurrent writes")
- Constraints and requirements stated by the user
- Things that were tried and failed, with the reason
- File paths and line numbers that are relevant

**Cut:**
- Function bodies unrelated to the task (keep the signature + one-line purpose)
- Boilerplate: imports, license headers, generated code, lockfiles, vendored deps
- Repeated log lines (collapse to "×N")
- Pleasantries, abandoned tangents, superseded drafts
- Anything easily re-derivable from the repo

**Never** silently change meaning: don't paraphrase code, numbers, or error text. If you summarize something, mark it as a summary.

## 3. For codebases

Produce a map, not a dump:
1. Tree of relevant directories only (depth 2–3)
2. Per relevant file: path, one-line purpose, key exported signatures
3. Full source only for the 1–3 files central to the task
4. How data flows between them in 2–4 lines

## 4. Output: the context pack

```
# Context pack — <task>
## Goal
## Current state (what works, what doesn't)
## Key facts & constraints
## Decisions made (and why)
## Tried and failed
## Relevant code / files
## Open questions / next step
```

## 5. Report the savings

After the pack, give one line: approximate size before → after (words or characters), and list anything you deliberately dropped that the user might still want, so they can add it back.
