#!/usr/bin/env bash

set -eux

# We always want backtraces for everything.
export RUST_BACKTRACE=1

cargo build --examples $PROFILE
cargo test $PROFILE || true

if [[ "$PROFILE" == "--release" ]]; then
    cargo bench
fi
