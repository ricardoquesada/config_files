---
name: cleanup
description: Invoked manually with /cleanup to audit, merge, and archive outdated artifacts in a controlled loop.
---

When the user invokes `/cleanup` (or `/cleanup <task_name>`), your objective is
to act as a workspace context gardener. You will scan the history, identify
conflicts and fragmented plans, and propose a reorganization strategy.

### Execution Steps:

**PHASE 1: Read-Only Audit**

1.  **Locate Artifacts**: Navigate to
    `~/progs/config_files/agents/dd/<YYYY-MM-DD_HH-MM>_<task_name>/` (ask the
    user for the task name if not provided or infer from recent folders).
2.  **Scan Phase**: Identify all markdown files in the folder. **Explicitly
    ignore anything in the `_archive/` subfolder.** Read the files, tracking
    their UTC timestamps and parsing any explicit superseded declarations.
3.  **Formulate Proposal**: Create a summary table for the user that categorizes
    artifacts into:
    -   **Active & Valid**: Clean files that stay as-is.
    -   **Fragments for Synthesis**: Overlapping artifacts that should be
        stitched into a unified `master_architecture.md` (or similar digest).
    -   **Outdated/Abandoned**: Artifacts that contain dead-end paths,
        superseded plans, or old retrospectives.
4.  **Halt and Await Approval**: Present this proposal to the user.
    **CRITICAL:** You must operate in a strictly read-only mode here. Do NOT
    make any edits, merges, or moves. Wait for the user to explicitly approve or
    manually adjust the proposal.

**PHASE 2: Execution**

1.  **Execute**: Once the user approves the specific plan, execute the changes.
2.  **Merge**: Extract useful content, synthesize it into a new, clearly-dated
    master artifact, and ensure it retains relevant prompt history.
3.  **Archive**: Move the outdated or consumed artifacts into
    `~/progs_config/agetns/dd/<YYYY-MM-DD_HH-MM>_<task_name>/_archive/`
    (using the appropriate version control commands like `hg mv` or `hg
    addremove`). **NEVER permanently delete artifacts.**
