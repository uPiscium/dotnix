#!/usr/bin/env sh

git config --global init.defaultBranch main
git config --global credential.helper store
git config --global fetch.prune true
git config --global user.email "upiscium@gmail.com"
git config --global user.name "uPiscium"

git config --global alias.a "add"
git config --global alias.aa "!sh ~/dotfiles/gitscripts/addAll.sh"
git config --global alias.b "branch"
git config --global alias.brd "push origin -d"
git config --global alias.c "commit -m"
git config --global alias.cc "rm -r --cached ."
git config --global alias.g "log --graph --oneline --decorate"
git config --global alias.l !"git fetch -p && git pull"
git config --global alias.m "merge"
git config --global alias.nb "!sh ~/dotfiles/gitscripts/newBranch.sh"
git config --global alias.p "push"
git config --global alias.pu "push -u"
git config --global alias.r "reset"
git config --global alias.s "status"
git config --global alias.w "switch"

gh alias set rpc 'repo clone'
gh alias set prc 'pr create -B'
gh alias set prm 'pr merge'
gh alias set rlc 'release create'
gh alias set rll 'release list'

