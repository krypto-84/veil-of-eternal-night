#!/bin/bash
set -e

echo "Syncing content from Obsidian..."
rsync -av --delete \
  ~/Documents/obsidian/veil-of-eternal-night/ \
  ~/veil-wiki/content/

echo "Pushing to GitHub..."
cd ~/veil-wiki
git add -A
git commit -m "Update content $(date '+%Y-%m-%d %H:%M')"
git push github v4

echo "Done! Cloudflare will build and deploy automatically."
