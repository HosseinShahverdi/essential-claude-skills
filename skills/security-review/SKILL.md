---
name: security-review
description: Review code for common security vulnerabilities — hardcoded secrets, injection (SQL, command, template), XSS, broken auth and access control, insecure deserialization, path traversal, SSRF, weak crypto, and risky dependencies — and propose concrete fixes. Use when the user asks for a security review, asks "is this code safe", or before merging or deploying code that handles user input, auth, files, or secrets.
---

# Security Review

Find real, exploitable issues in the user's own code and show how to fix them. Prioritize signal over volume: five confirmed findings beat forty speculative ones.

## Scope and limits (say this when relevant)

- This is an AI-assisted review, not a guarantee. It complements, not replaces, tools like Semgrep, CodeQL, Bandit, `npm audit`, `pip-audit`, gitleaks, and a human review.
- The code is processed by the model you are talking to. If the user's code must not leave their machine, they should use local scanners instead.
- Review defensively: explain impact and fix. Do not produce working exploit payloads against third-party systems.

## 1. Map the attack surface first

Before reading line by line, identify:
- **Entry points**: HTTP routes, CLI args, file uploads, message queues, webhooks
- **Trust boundaries**: where untrusted data enters and where it reaches a sensitive sink
- **Sensitive sinks**: DB queries, shell/exec, file paths, HTML rendering, redirects, deserializers, outbound HTTP, crypto, auth decisions

## 2. Checklist

Trace untrusted input from source to sink for each:

| Category | Look for |
|---|---|
| Secrets | API keys, tokens, passwords, private keys in code, config, tests, or git history |
| Injection | String-built SQL, `exec`/`system`/`subprocess(shell=True)`, `eval`, template injection, LDAP/NoSQL injection |
| XSS | Unescaped output, `innerHTML`, `dangerouslySetInnerHTML`, `|safe`, disabled autoescape |
| AuthN/AuthZ | Missing auth on routes, IDOR (object IDs not checked against owner), role checks only in UI |
| Sessions/JWT | `alg: none`, unverified signatures, long-lived tokens, tokens in URLs or localStorage for sensitive apps |
| Path traversal | User input in file paths without normalization and allow-listing |
| SSRF | User-controlled URLs fetched server-side without allow-list |
| Deserialization | `pickle`, `yaml.load` (unsafe loader), Java/PHP native deserialization of untrusted data |
| Crypto | MD5/SHA1 for passwords, homemade crypto, static IVs, `random` for tokens |
| Config | Debug mode in prod, permissive CORS (`*` with credentials), missing security headers, verbose errors |
| Dependencies | Pinned versions with known CVEs (recommend the audit tool for the ecosystem) |

## 3. Report format

Sort by severity. For each finding:

```
### [SEVERITY] <short title>
Location: <file>:<line>
Issue: <what is wrong, in one or two sentences>
Impact: <what an attacker could realistically do>
Fix:
<minimal patched code>
Confidence: High | Medium | Low  (Low = needs context you don't have; say what)
```

Severity: **Critical** (remote compromise, secret exposure), **High** (data access across users, injection), **Medium** (needs specific conditions), **Low** (hardening).

End with:
- **Summary**: count by severity.
- **Next steps**: which scanner to add to CI for this stack, and any secret that must be rotated (removing a leaked secret from code is not enough).

If you find nothing significant, say so plainly and list what you checked. Don't invent findings to look thorough.
