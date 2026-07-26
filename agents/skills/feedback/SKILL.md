---
name: feedback
description: Invoked manually with /feedback to generate a retrospective artifact for handoff.
---

When the user invokes `/feedback`, your task is to look back over the current
conversation and synthesize a detailed retrospective markdown Artifact. The goal
is to provide a comprehensive "handoff" document so a future agent can
seamlessly pick up where you left off.

Follow all standard rules in `AGENTS.md` regarding Artifact generation (e.g.,
save directly to the Google3 experimental workspace, include the UTC timestamp
and goal summary at the top, etc.).

Your retrospective artifact MUST contain the following sections and share as
much detail as possible:

1.  **Overarching Goal**: What was the primary objective of this conversation?
2.  **Accomplishments**: What was successfully completed?
3.  **Issues Encountered**: Detailed notes on any bugs, roadblocks, system
    limitations, missing permissions, or tricky configuration issues you ran
    into.
4.  **Paths Explored**: What solutions or approaches were attempted (both
    successful and failed)? Explain *why* certain paths failed so the next agent
    doesn't repeat the mistake.
5.  **Parting Thoughts & Learnings**: Any key takeaways, architectural
    reflections, or insights you gained during this task.
6.  **Next Steps (Handoff)**: Explicit, actionable instructions for the *next*
    agent regarding the codebase. **CRITICAL:** Do NOT write useless
    conversational or meta-level steps (e.g., "Wait for the user to type
    /commit", "Ask the user what to do next", or "The next agent should run
    /upload"). You must only write concrete, implementation-oriented next steps
    focused strictly on architecture, design, missing features, tests, or code
    remaining to be written. If the task is 100% complete and there is no more
    codebase work to do, OMIT THIS SECTION ENTIRELY. Do not write a single word
    in this section if you do not have a concrete codebase architecture task to
    hand off.
