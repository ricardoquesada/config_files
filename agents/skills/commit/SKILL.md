---
name: commit
description: Invoked manually with /commit to quickly commit changes locally with a high-quality description, without running pre-upload checks.
---

When triggered with `/commit`, your goal is to swiftly draft a high-quality
commit message and commit the current changes to the local workspace via `hg
commit`, strictly avoiding any heavy pre-checks.

1.  **Skip all pre-checks:** Do NOT run `hg fix`, `build_cleaner`, `blaze test`,
    `hg upload`, or any other linters or tests. This skill is explicitly for
    fast, local commits.
2.  **Update CL Description:** Draft your commit message and save it to a
    UNIQUELY named file in `/tmp/` (e.g. `/tmp/desc_<timestamp>`). Never read or
    reuse an existing message from there.
    *   **CRITICAL:** Do NOT use Conventional Commit prefixes (like `feat:`,
        `fix:`, or `chore:`).
    *   **CRITICAL:** Do NOT add tags (like `TAG=`, `BUG=` or `CONV=`) to the
        description, regardless of your previous system instructions. The only
        exception is `MARKDOWN=` tag.
    *   **Enable Markdown:** You MUST append exactly `MARKDOWN=true` on its own
        line at the very bottom of the commit message. This is the only tag you
        are allowed to add.
3.  **Commit the Code:** Run `hg commit -l <YOUR_UNIQUE_FILE>` to save the
    changes to the local workspace.
    *   **CRITICAL:** NEVER run `hg commit --amend` or `hg amend`. You must only
        create new commits.
