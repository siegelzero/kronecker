# Package
version = "0.0.1"
author = "Kenneth Brown"
description = "Fast number-theoretic algorithms"
license = "MIT"

srcDir = "kronecker"

# Deps
requires "nim >= 0.18.0"

# Tests
task test, "Runs the test suite":
  exec "nim c -r tests/test_kronecker"
  exec "nim c -r src/core"

