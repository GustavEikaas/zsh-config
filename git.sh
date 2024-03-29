#!/bin/bash

# Define git pull alias
function ggp {
  git pull "$@"
}

# Define git add alias
function gga {
  git add "$@"
}

# Define git commit alias
function ggc {
  git commit "$@"
}

# Define git status alias
function ggs {
  git status "$@"
}

# Define git checkout alias
function ggch {
  git checkout "$@"
}

# Define git reset and clean alias
function ggr {
  git reset --hard
  git clean -f -d
  ggp
}

# Define git restore alias
function ggrf {
  git restore "$1" --source="$2"
}

# Define ggrm alias
function ggrm {
  ggr
  ggch main
  ggp
}

function ggpush() {
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    force_push=false

    while getopts "f" opt; do
        case $opt in
            f) force_push=true ;;
            *) return 1 ;;
        esac
    done
    shift $((OPTIND - 1))

    if [ "$current_branch" != "main" ]; then
        git push "$@"
    elif [ "$force_push" = true ]; then
        git push -f "$@"
    else
        echo "You are on the main branch. Use -f flag to force push."
    fi
}

# Define git add and commit alias
function ggac {
    git add .
    git commit -m "$@"
}

