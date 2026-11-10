---
name: roadmap-curator
description: Build a personalized, step-by-step learning roadmap that uses only free resources (official docs, free books, open courses, YouTube, open-source projects). Use when the user asks how to learn a topic, wants a study plan or learning path, asks what to learn next, or says they can't pay for courses.
---

# Roadmap Curator

Produce a learning roadmap the user can start today, built entirely from resources that cost nothing.

## 1. Gather the minimum context

Before writing the roadmap, make sure you know these four things. Infer what you can from the conversation; ask only for what is missing, in one short message.

- **Goal**: what they want to be able to *do* at the end (build X, pass Y, get a job as Z), not just the topic name.
- **Starting point**: what they already know that is relevant.
- **Time budget**: hours per week and any deadline.
- **Constraints**: language, offline access, hardware, preferred format (video vs. reading vs. projects).

If the user says "just give me something", assume a beginner with 5 hours/week and say so at the top.

## 2. Design the roadmap

- Split it into **3–6 phases**. Each phase ends with a concrete **milestone project** that proves the skill, not a quiz.
- Order phases by dependency: never put a topic before its prerequisites.
- Give each phase an **estimated duration** derived from the time budget. Be realistic; err longer.
- Keep scope tight. Cut "nice to know" topics into an optional "Later" section at the end.

## 3. Choose resources (the free-only rule)

Every resource must be free to use in full, without a trial, paywall, or "free first chapter".

Prefer, in this order:
1. Official documentation and official tutorials
2. Free university courses (e.g. MIT OpenCourseWare, Stanford/CMU public lecture videos)
3. Free books published online by their authors
4. Well-maintained open-source repos and their docs
5. Long-standing YouTube channels or free interactive sites

For each resource give: title, type (docs / book / course / video / project), why it fits this phase, and the specific part to use (chapter, module, playlist range), not just the homepage.

**Accuracy rule**: only name resources you are confident exist and are free. If you have web search, verify links before including them. If you cannot verify, give the resource name and say how to find it (e.g. "search 'Think Python 3e free online'") rather than inventing a URL. Never fabricate URLs.

Flag anything "freemium" (free to audit, paid certificate) explicitly.

## 4. Output format

```
# Roadmap: <goal>
Assumptions: <level, hours/week, deadline>
Total estimate: <weeks>

## Phase 1 — <name> (<duration>)
Learn: <3–6 bullet topics>
Resources:
- <Title> (<type>) — <what to use> — <why>
Milestone project: <specific, small, shippable>
Done when: <observable check>

... (repeat per phase)

## Later (optional)
## How to stay on track
<2–4 lines: weekly rhythm, where to ask for help for free (forums, Discord, Stack Overflow)>
```

## 5. Quality checks before replying

- Each phase has a milestone project and a "done when" check.
- No paid resource slipped in.
- The total estimate is consistent with the stated hours/week.
- A beginner could start Phase 1 within 10 minutes of reading.
