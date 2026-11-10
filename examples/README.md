# Examples

Sample prompts that trigger each skill and what to expect back.

## roadmap-curator
> I know basic Python. I want to train and deploy a small ML model in 8 weeks, 5 hrs/week. Free resources only.

Expect: assumptions line, 4–5 phases with duration, specific free resources per phase, a milestone project and "done when" check for each.

## code-mentor
> Mentor mode, don't give me the answer: why does `for i in range(len(xs) - 1)` miss my last element?

Expect: one targeted question first, then hints that climb toward the concept (off-by-one in `range`), ending with a recap and a practice exercise.

## readme-architect
> Write a README for this repo.

Expect: README built from the real manifest files and scripts, with `<!-- TODO -->` markers for anything it couldn't confirm, and a list of those TODOs.

## security-review
> Security review `app.py` before I deploy.

Expect: findings sorted by severity with location, impact, a patched snippet and confidence; a summary count; which scanner to add to CI.

## context-optimizer
> This chat is getting long. Make a context pack so I can continue fixing the login bug in a new chat.

Expect: a structured pack (goal, state, constraints, decisions, failed attempts, relevant code, next step) and a before → after size line.
