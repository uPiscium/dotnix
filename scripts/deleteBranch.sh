#!/usr/bin/env sh

git push origin --delete "$1"
if [ $? -eq 0 ]; then
    echo "Branch '$1' deleted successfully."
else
    echo "Failed to delete branch '$1'."
fi

git branch -d "$1"
if [ $? -eq 0 ]; then
    echo "Local branch '$1' deleted successfully."
else
    echo "Failed to delete local branch '$1'."
fi
