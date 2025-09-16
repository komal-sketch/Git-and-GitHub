# Git Stashing

## 🔹 What is Git Stashing?
- **Git stash** temporarily saves your uncommitted changes (both staged and unstaged) without committing them.
- It clears your working directory so you can switch branches, pull updates, or work on something else, and later reapply those changes.

📦 Think of it like: *“Putting your unfinished work in a box and storing it on a shelf, so you can come back to it later.”*

---

## 🔹 Basic Commands

- Save changes to stash:
  ```bash
  git stash

# Git Stash Commands

| Command                         | Description                                                   | Example Use Case                                                   |
|---------------------------------|---------------------------------------------------------------|---------------------------------------------------------------------|
| `git stash`                     | Save uncommitted changes (both staged and unstaged).          | You’re halfway coding a feature but need to quickly switch branch.  |
| `git stash list`                | Show all saved stashes.                                       | Check what stashes you’ve saved so far.                            |
| `git stash apply`               | Apply the most recent stash but keep it in stash list.        | Restore work temporarily while keeping a backup in stash.          |
| `git stash pop`                 | Apply the most recent stash and remove it from stash list.    | Continue exactly where you left off without keeping stash.          |
| `git stash drop stash@{0}`      | Delete a specific stash (example: `stash@{0}`).                | Clean up a stash you don’t need anymore.                           |
| `git stash clear`               | Remove all stashes.                                           | Start fresh by clearing all saved stashes.                         |
| `git stash && git checkout main`| Save work-in-progress and switch to another branch safely.     | Quickly stash changes on `feature-A` and move to `main`.            |
| `git stash pop && git merge main`| Reapply stashed changes after syncing with latest code.        | Pull latest updates from `main` and continue your work seamlessly. |


# Use Cases:

1.	Switching branches quickly
    Work on feature-A → need to check main → stash, switch, then reapply.
2.	Pulling latest changes without conflicts
    Run git pull safely by stashing your local work first.
3.	Experimenting safely
    Try quick changes without committing. If not needed, drop the stash.
4.	Keeping a clean working directory
    Stash your changes before running tests, builds, or scripts.
5.	Multiple tasks at once
    Save multiple unfinished works with multiple stashes and restore later.
