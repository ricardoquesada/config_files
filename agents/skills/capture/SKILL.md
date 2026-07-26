---
name: capture
description: Invoked manually with /capture to digest and export conversational concepts, designs, and architectural discussions into a detailed artifact for future agents.
---

When the user invokes `/capture` (or `/capture <topic_name>`), your objective is
to meticulously distill the preceding conversational history—specifically
focusing on conceptual exploration, design decisions, and architectural
discussions—into a comprehensive and highly detailed markdown artifact.

### Execution Steps:

1.  **Analyze Conversational Context**:
    -   Scan back through the recent conversation.
    -   Identify all core concepts, design decisions, trade-offs discussed, and
        raw ideas explored.
2.  **Draft the Artifact**:
    -   Organize the information logically (e.g., Target Goals, Proposed
        Architectures, Trade-offs, Core Concepts, and Open Questions).
    -   Ensure the level of detail is extremely high; another agent reading this
        file in the future must be able to seamlessly pick up the exploration
        without missing any nuance.
3.  **Comply with AGENTS.md**:
    -   Save the artifact directly into the appropriate workspace directory
        (`~/progs/config_files/agents/dd/<YYYY-MM-DD_HH-MM>_<task_name>/`). If
        `<task_name>` is not obvious, ask the user or create a descriptive
        folder name.
    -   Ensure the strict `AGENTS.md` header is placed at the top (exact
        workspace path, UTC generation timestamp, and the summary of the
        original overarching goal/prompt).
4.  **Report back**:
    -   Provide the link to the generated artifact and explicitly ask the user
        if there are any specific nuances or missing details they would like
        appended before moving on.
