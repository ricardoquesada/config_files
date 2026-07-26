---
name: sync-ahura
description: Invoked manually with /sync-ahura to copy Ahura's latest AGENTS.md, agents/, and skills/ files and update all artifact path references to use ricardoq's workspace path.
---

When the user triggers `/sync-ahura`, execute the following automated synchronization workflow:

### Source & Target Paths

- **Source Root Directory:** `/google/src/cloud/ricardoq/dd/configs/users/ahura/_agents/`
- **Destination Root Directory:** `/google/src/cloud/ricardoq/dd/configs/users/ricardoq/_agents/`
- **Target Artifact Storage Directory:** `/google/src/cloud/ricardoq/dd/google3/experimental/users/ricardoq/g3doc/dd/`

---

### Execution Steps

1. **Copy Ahura Agent Infrastructure Files:**
   - Copy `AGENTS.md` (or `AGENT.md`) from source to destination.
   - Copy `agents.json`, `plugins.json`, and `skills.json` from source to destination.
   - Copy all agent definition files in `agents/` directory from source to destination.
   - Copy all skill folders and files in `skills/` directory from source to destination (preserving `skills/sync-ahura/SKILL.md`).

2. **Update Path References Across All Files:**
   - In all copied markdown (`.md`) and configuration (`.json`) files in the destination directory, perform the following replacements:
     - Replace `google3/users/experimental/ahura/<YYYY-MM-DD_HH-MM>_<short_underscored_task_name>/` with `/google/src/cloud/ricardoq/dd/google3/experimental/users/ricardoq/g3doc/dd/<YYYY-MM-DD_HH-MM>_<short_underscored_task_name>/`
     - Replace `google3/users/experimental/ahura/<YYYY-MM-DD_HH-MM>_<task_name>/_archive/` with `/google/src/cloud/ricardoq/dd/google3/experimental/users/ricardoq/g3doc/dd/<YYYY-MM-DD_HH-MM>_<task_name>/_archive/`
     - Replace `google3/users/experimental/ahura/<YYYY-MM-DD_HH-MM>_<task_name>/` with `/google/src/cloud/ricardoq/dd/google3/experimental/users/ricardoq/g3doc/dd/<YYYY-MM-DD_HH-MM>_<task_name>/`
     - Replace `google3/users/experimental/ahura/` with `/google/src/cloud/ricardoq/dd/google3/experimental/users/ricardoq/g3doc/dd/`
     - Replace `google3/experimental/users/ahura/` with `/google/src/cloud/ricardoq/dd/google3/experimental/users/ricardoq/g3doc/dd/`

3. **Verify Synchronization:**
   - Verify that `AGENTS.md`, `agents/`, and `skills/` files were successfully copied.
   - Confirm that zero un-transformed `ahura` path templates remain in destination files (excluding explicit source directory references in `sync-ahura/SKILL.md`).

4. **Report Results:**
   - Present a concise summary of all synchronized files (`AGENTS.md`, `agents/*`, `skills/*`) and updated path references to the user.
