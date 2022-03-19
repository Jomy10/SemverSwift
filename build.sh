#!/usr/bin/env zsh

set -e

THISDIR=$(dirname "$0")
cd $THISDIR

PROFILEIN="$1"
PROFILE="${PROFILEIN:="DEBUG"}"

export SWIFT_BRIDGE_OUT_DIR="$(pwd)/generated"
if [[ $PROFILE == "RELEASE" ]]
then
  cargo build --release --target x86_64-apple-darwin
  cargo build --release --target x86_64-apple-ios
  cargo build --release --target aarch64-apple-ios

  swift-bridge-cli create-package \
    --bridges-dir ./generated \
    --out-dir ../SemverBridge \
    --macos target/x86_64-apple-darwin/release/libsemver_swift_bridge.a \
    --ios target/aarch64-apple-ios/release/libsemver_swift_bridge.a \
    --simulator target/x86_64-apple-ios/release/libsemver_swift_bridge.a \
    --name SemverBridge
else
  cargo build --target x86_64-apple-darwin

  swift-bridge-cli create-package \
    --bridges-dir ./generated \
    --out-dir ../SemverBridge \
    --macos target/x86_64-apple-darwin/debug/libsemver_swift_bridge.a \
    --name SemverBridge
fi
