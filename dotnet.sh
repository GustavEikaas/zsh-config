#!/bin/bash

# Define ddr alias
function ddr {
  dotnet run "$@"
}

# Define ddt alias
function ddt {
  dotnet test "$@"
}

# Define ddb alias
function ddb {
  dotnet build "$@"
}

