#!/bin/bash

# Define ppi alias
function ppi {
  pnpm install "$@"
}

# Define ppb alias
function ppb {
  pnpm build "$@"
}

# Define pps alias
function pps {
  pnpm start "$@"
}

