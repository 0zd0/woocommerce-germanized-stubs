#!/usr/bin/env bash
#
# Generate woocommerce-germanized stubs from the source directory.
#

HEADER=$'/**\n * Generated stub declarations for woocommerce-germanized.\n * @see https://vendidero.de/woocommerce-germanized\n * @see https://github.com/0zd0/woocommerce-germanized-stubs\n */'

FILE="woocommerce-germanized-stubs.phpstub"
DIR=$(dirname "$0")

IGNORE_HOOKS=(
)
IGNORE_HOOKS_STRING=$(IFS=,; echo "${IGNORE_HOOKS[*]}")

set -e

"$DIR/vendor/bin/generate-hooks" \
    --input=source/woocommerce-germanized \
    --input=source/overrides \
    --output=hooks \
    --ignore-hooks="$IGNORE_HOOKS_STRING"

"$DIR/vendor/bin/generate-stubs" \
    --force \
    --finder=finder.php \
    --header="$HEADER" \
    --functions \
    --classes \
    --interfaces \
    --traits \
    --constants \
    --out="$FILE"
