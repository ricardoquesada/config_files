---
name: upload
description: Format, clean, draft a descriptive commit message, and upload the CL.
---

When triggered, run through this final checklist to safely prepare and upload
the code:

1.  **Format Code:** Run `hg fix` on all modified files. (Strictly no `g4` or
    `git`).
2.  **Clean Dependencies:** Run `build_cleaner` on the modified packages.
3.  **Verify Tests:** Ensure relevant unit tests have been updated and run the
    necessary `blaze test` commands to confirm they pass.
4.  **Update CL Description:** Draft your commit message and save it to a
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
    *   **CRITICAL:** Commit the code strictly as a new commit. NEVER run `hg
        commit --amend` or `hg amend`. You must only create new commits using
        `hg commit -l <YOUR_UNIQUE_FILE>`.
5.  **Upload the CL:** Once everything passes and the new commit is created, run
    `hg upload .` (or the equivalent command for this Fig workspace) to upload
    the CL for review.
