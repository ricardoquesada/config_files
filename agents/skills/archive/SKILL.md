---
name: archive
description: Invoked manually with /archive to move specific or recently created artifacts into the _archive directory.
---

When the user invokes `/archive` (or `/archive <filename>`), your goal is to
move the specified artifact out of the active context and into the `_archive/`
subfolder using `hg mv`.

### Execution Steps:

1.  **Identify Target File**:
    -   If a specific `<filename>` is provided, target that file.
    -   If NO filename is provided, target the artifact(s) that you generated in
        your immediately preceding response.
2.  **Locate Target**: Ensure the file exists in the current active directory
    under `~/progs/config_files/agents/dd/<YYYY-MM-DD_HH-MM>_<task_name>/`.
3.  **Execute Archive**:
    -   Ensure the `_archive/` directory exists (create it if necessary).
    -   Use `hg mv` to move the target file into the `_archive/` directory.
        (Never use `rm`).
4.  **Report**: Respond to the user with the exact, specific filename(s) that
    you successfully archived.
