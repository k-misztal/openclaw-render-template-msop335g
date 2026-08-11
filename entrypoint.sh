#!/bin/sh
set -e

[ -f /data/.env ] && { set -a; . /data/.env; set +a; }

echo "Starting entrypoint.sh script..."

if [ -d /data/brain/.git ]; then
  echo "[brain] present"
elif [ -z "$BRAIN_REPO_URL" ]; then
  echo "[brain] SKIP: BRAIN_REPO_URL unset"
else
  echo "[brain] cloning $BRAIN_REPO_URL"
  git clone "$BRAIN_REPO_URL" /data/brain && echo "[brain] ok" || echo "[brain] FAILED"
fi

exec "$@"
