#!/bin/sh
set -e

[ -f /data/.env ] && { set -a; . /data/.env; set +a; }

echo "Starting entrypoint.sh script..."

if [ -n "$BRAIN_REPO_URL" ] && [ -n "$GITHUB_TOKEN" ] && [ ! -d /data/brain/.git ]; then
  echo "Cloning brain repo..."
  git clone "https://${GITHUB_TOKEN}@github.com/${BRAIN_REPO}.git" /data/brain \
    || echo "Brain clone failed, continuing."
fi

exec "$@"
