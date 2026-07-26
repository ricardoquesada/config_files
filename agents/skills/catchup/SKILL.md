---
name: catchup
description: Invoked manually with /catchup <task_name> to read prior artifacts and seamlessly resume a task context.
---

When the user invokes `/catchup <task_name>`, your objective is to quickly
digest the paper trail left by previous agents (like architectural plans and
`/feedback` retrospectives) and pick up the work seamlessly.

### Execution Steps:

1.  **Locate Artifacts**: Look inside the experimental workspace directory:
    `~/progs/config_files/agents/dd/<YYYY-MM-DD_HH-MM>_<task_name>/`. If the
    user didn't specify `<task_name>`, ask for it or look for recently modified
    folders in `~/progs/config_files/agents/dd/`.
2.  **Ingest History**: Identify and read all markdown artifacts in that folder.
    **CRITICAL: Deliberately ignore and skip any artifacts located in the
    `_archive/` subfolder.**
3.  **Respect Chronology**:
    -   Parse the UTC timestamps at the top of each file to establish the true
        order of events.
    -   Scan for explicit overrides like `"This artifact supersedes [Old
        Artifact Name]"`.
    -   If two artifacts present conflicting ideas, ALWAYS defer to the
        chronologically newer artifact.
4.  **VCS Inspection (The Ground Truth)**:
    -   Use `run_command` to execute `hg log -l 3` to identify the last 2-3
        commits.
    -   Execute `hg diff -c <commit_hash>` for those recent commits to deeply
        understand the structural changes and exact edits made.
    -   Run `hg status` and `hg diff` to ingest current uncommitted changes.
    -   **CRITICAL:** Let these code-level adjustments drive your understanding
        of the current technical trajectory and use it to augment the roadmap.
5.  **Identify Next Actions**: Read the handoff instructions or unresolved
    roadmap items from the most recent retrospective.
6.  **Report**: Summarize to the user what you understand the current state to
    be and clearly state the immediate next step you are prepared to take. Wait
    for their confirmation before making actual code changes.
