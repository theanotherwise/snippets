```bash
git config --global --edit
git config --edit

git push                                # Push changes 
git pull                                # Pull changes
git log                                 # Logs
git status                              # Show status
git show                                # Show

git fetch --all                         # Fetch remote changes
git fetch --prune                       # Fetch and remove deleted branches

git switch bname                        # Switch to branch
git checkout bname                      # Switch to branch

git switch -c bname                     # Create new branch from current
git checkout -b bname                   # Create new branch from current

git switch -c bname origin/bname        # Create new branch from specified branch
git checkout -b bname origin/bname      # Create new branch from specified branch

git switch -c 2.6.2 tags/v2_6_2         # Create new branch from specified tag
git checkout -b 2.7.2 tags/v2_7_2       # Create new branch from specified tag

git reset --hard origin/bname           # Reset not push commits
git clean -fd                           # Clean not commited changes

git branch -vv                          # Show push origin
git remote -v                           # Show current branch

git branch -a --contains tags/v2_7_2    # Search branch which contains tag

git push --set-upstream origin bname    # Set upstream
git branch -u origin/bname              # Set upstream

# Stash
# Merge
# Rebase

# Remote
git remote rename origin test
git remote rename test origin

git remote remove origin

git remote add origin git@github.com:theanotherwise/git.git

git remote get-url --all origin
git remote get-url --push origin

git remote set-url --add origin gi2t@github.com:theanotherwise/git.git
git remote set-url --delete origin git2@github.com:theanotherwise/git.git
```
