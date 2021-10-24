# git 

## Basics
```bash
touch foo.txt

git add foo.txt
git mv foo.txt bar.txt
git rm -f bar.txt
```

```bash
touch foo.txt

echo "Lorem Ipsum" > foo.txt
git add foo.txt                         # \
git commit -m "added foo.txt file"      #  | -> same as git commit -m "message" -a
```

```bash
git reset --mixed
git reset --soft

git reset --hard
```

```bash
git pull --verbose

git fetch --all --verbose
git fetch --prune --verbose
```

## Stash
```bash
git stash push -m "probably good changes"
git stash list
git stash show stash@{0} -p

git pop stash@{0}

git stash apply stash@{0}
git stash drop stash@{0}
```

```bash
git stash create
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
git stash store -m "test" xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

## Branch
```bash
git switch bname                        # Switch to branch
git checkout bname                      # Switch to branch

git switch -c bname                     # Create new branch from current
git checkout -b bname                   # Create new branch from current

git switch -c bname origin/bname        # Create new branch from specified branch
git checkout -b bname origin/bname      # Create new branch from specified branch

git switch -c 2.6.2 tags/v2_6_2         # Create new branch from specified tag
git checkout -b 2.7.2 tags/v2_7_2       # Create new branch from specified tag

git branch -vv                          # Show push origin
```

```bash
git push --set-upstream origin bname    # Set upstream
git branch -u origin/bname              # Set upstream
```

## Remote
```bash
git remote -v

git remote rename origin test
git remote rename test origin

git remote remove origin

git remote add origin git@github.com:theanotherwise/git.git

git remote get-url --all origin
git remote get-url --push origin

git remote set-url --add origin gi2t@github.com:theanotherwise/git.git
git remote set-url --delete origin git2@github.com:theanotherwise/git.git
```
