#!/bin/bash

set -euo pipefail

if [ -z "${ENV_VAULT}" ]; then
    echo "ENV_VAULT is not set"
    exit 1
fi

LINES=20

echo "Show last ${LINES} modified files of ${ENV_VAULT}"

# Wechsel in das Verzeichnis ENV_VAULT
pushd "${ENV_VAULT}"

# Auflisten der zuletzt geänderten Dateien, ohne die im .daily Verzeichnis
git ls-files -z | grep -vzZ '.daily' | xargs -0 -n1 -I{} git log -1 --date=iso --format="%ad {}" {} | sed 's/\+.* //' | sort | tail -n $LINES

# Zurück zum ursprünglichen Verzeichnis
popd
