#!/bin/bash

# Define ghprc alias
function ghprc {
  gh pr create --draft --fill
  gh pr view
}

# Define ghprm alias
function ghprm {
  gh pr merge --squash -d
  if [ $? -ne 0 ]; then
    read -p "Pull Request still draft, mark as ready and merge? (Y to merge, N to cancel): " markReady
    if [[ "$markReady" == "Y" || "$markReady" == "y" ]]; then
      gh pr ready
    else
      echo "Aborting..."
      return
    fi
  fi
  gh pr merge --squash -d
  ghprv
  ggrm
}

# Define ghpush alias
function ghpush {
  if [ "$1" == "-F" ]; then
    shift
  else
    if ! main-check && [ "$F" != "true" ]; then
      echo "On main branch, use -F flag to bypass"
      return
    fi
  fi

  git push
  gh pr view
  if [ $? -ne 0 ]; then
    read -p "No PR linked to branch, do you want to create a draft PR? (Y/N): " createPr
    if [[ "$createPr" == "Y" || "$createPr" == "y" ]]; then
      ghprc
    fi
  fi
}

# Define ghprch alias
function ghprch {
  gh pr checkout "$@"
}

# Define ghprd alias
function ghprd {
  gh pr diff "$@"
}

# Define ghprv alias
function ghprv {
  gh pr view "$@"
}

