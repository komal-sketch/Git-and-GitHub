# Git hooks for DevOps engineers
While GitHub Actions handles CI/CD in the cloud, Git hooks let you customise Git’s behaviour locally. Hooks are scripts that run automatically when certain events occur in a repository (e.g., before a commit or after a push). They allow you to enforce coding standards, run tests, or trigger integrations at key points in the development lifecycleatlassian.com. Sample hook scripts reside in the .git/hooks directory; they are disabled by default with a .sample suffixatlassian.com. To activate a hook, remove the .sample extension, copy your script into .git/hooks/ and make it executable.

# Common hooks and use cases

•	pre commit: Runs before a commit is recorded. Use it to lint code with tools like flake8, scan for secrets or TODOs, or run unit tests. If the script exits with a
non zero status, the commit is aborted.

•	commit msg: Executes after the commit message is prepared but before the commit is finalised. It can enforce commit message conventions (e.g., Conventional 
Commits), check message length or ensure a ticket number is present.

•	pre push: Runs before pushing to a remote. It can run the full test suite, run security scanners or prevent pushes to protected branches.

