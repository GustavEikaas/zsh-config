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

# Define git push alias
function ggpush {
  if [[ "$1" == "-F" ]]; then
    shift
    git push "$@"
  else
    if git rev-parse --abbrev-ref HEAD | grep -q "^main$"; then
      echo "On main branch, use -F flag to bypass"
    else
      git push "$@"
    fi
  fi
}

# Define git add and commit alias
function ggac {
  if [[ "$1" == "-F" ]]; then
    shift
    git add .
    git commit -m "$@"
  else
    if git rev-parse --abbrev-ref HEAD | grep -q "^main$"; then
      echo "On main branch, use -F flag to bypass"
    else
      ggs
      git add .
      git commit -m "$1"
    fi
  fi
}

