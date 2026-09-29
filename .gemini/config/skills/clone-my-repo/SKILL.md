---
name: clone-my-repo
description: >-
  Clones GitHub repositories for user rasyidcode into ~/My-Work.
  Use when the user asks to clone their repository by name or URL, or fetch a project from their GitHub.
---

# Clone My Repo Workflow

This skill automates cloning GitHub repositories for the user into the local development directory.

## Default Configurations

* **Default GitHub User:** `rasyidcode`
* **Default Base Path:** `~/My-Work/` (`/home/nb81/My-Work/`)
* **Default URL Scheme:** SSH (`git@github.com:rasyidcode/<repo-name>.git`)

---

## Step-by-Step Procedure

### 1. Resolve Repository Name and Target Directory
* If the user specifies a repository name (e.g., `my-app`), format the remote URL as:
  `git@github.com:rasyidcode/<repo-name>.git`
* If a full URL is provided (HTTPS or SSH), use that URL directly and infer the directory name.
* Set the target directory to:
  `~/My-Work/<repo-name>`

### 2. Verify Target Path
* Check if the destination directory already exists:
  ```bash
  ls -ld ~/My-Work/<repo-name>
  ```
* If it already exists, notify the user and ask whether they want to pull latest changes or inspect the existing repo instead of re-cloning.

### 3. Clone Repository
* Clone using `git clone`:
  ```bash
  git clone <repo-url> ~/My-Work/<repo-name>
  ```
* **Note on Sandbox Permissions:** Since private repositories use host-level SSH credentials (`~/.ssh`), run the clone command with `BypassSandbox: true` if sandboxed execution fails due to SSH configuration/network isolation.

### 4. Verify Clone and Branch Status
* Verify the repository was cloned cleanly and check the active branch:
  ```bash
  git -C ~/My-Work/<repo-name> status
  ```

### 5. Report to User
* Provide a summary with:
  * Repository name and remote URL.
  * Clickable file link to the cloned directory: `[~/My-Work/<repo-name>](file:///home/nb81/My-Work/<repo-name>)`.
  * Active branch and working tree status.
  * If no project/workspace is currently open in the IDE/Antigravity, remind the user that they can set `~/My-Work/<repo-name>` as their active workspace.
