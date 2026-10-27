# Global CLAUDE.md

Applies to every project. A project's own CLAUDE.md or memory wins where they conflict.

## Me

- TypeScript, Jest, Neovim. Tests live in a sibling `__test__/` dir (not `__tests__`).
- I drive the same checkout from other windows while you work. A vanished edit or clean `git status` usually means I stashed or committed it. Check `git stash list`, `git reflog`, `git log -1` before assuming anything is lost, and never checkout/reset/stash pop to recover without asking.

## How to work

- Before a non-trivial change, weigh at least two approaches and pick the one that fits the codebase's existing patterns. If I might reasonably prefer the other one, say so in a line.
- Never take a shortcut silently. If you'd bypass an existing generator, pipeline, or check with a manual workaround, stop and flag it so I can decide.
- Keep code comments to one short line, or none. No multi-paragraph WHY essays.
- Git push rules differ per project (some always push, some never). Follow the project's instructions; if there are none, ask.

## When teaching me (languages, interview prep, new tech)

- Start concrete: worked examples with real values before the general rule, and the simplest form of a topic first.
- When I'm stuck, scaffold one question at a time. Don't hand me the finished answer.

## Agentic-dev playbook

For practices on harnesses, context/memory, workflows, and evals, read `~/dev/agent-playbook/INDEX.md`, then the relevant `principles/` notes. Treat it as read-only from other projects.
