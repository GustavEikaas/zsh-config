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
  git push "$@"
}

# Define git add and commit alias
function ggac {
    git add .
    git commit -m "$@"
}

