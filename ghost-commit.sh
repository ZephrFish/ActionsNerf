#!/bin/bash

# Ghost commit script with random identity generation

# Arrays of random names and domains
NAMES=("Ghost" "Phantom" "Shadow" "Specter" "Wraith" "Spirit" "Shade" "Revenant" "Apparition" "Poltergeist")
DOMAINS=("ghost.local" "phantom.local" "shadow.local" "specter.local" "wraith.local" "spirit.local" "void.local" "null.local" "dark.local" "stealth.local")

# Generate random identity
NAME_INDEX=$((RANDOM % ${#NAMES[@]}))
DOMAIN_INDEX=$((RANDOM % ${#DOMAINS[@]}))
RANDOM_NAME="${NAMES[$NAME_INDEX]}"
RANDOM_EMAIL="${NAMES[$NAME_INDEX],,}@${DOMAINS[$DOMAIN_INDEX]}"

# Configure Git with random identity
git config user.name "$RANDOM_NAME"
git config user.email "$RANDOM_EMAIL"

echo "Using identity: $RANDOM_NAME <$RANDOM_EMAIL>"

# Check if there's a commit message argument
if [ -z "$1" ]; then
    COMMIT_MSG="Ghost commit $(date +%s)"
else
    COMMIT_MSG="$1"
fi

# Add all changes
git add -A

# Create commit with random author and committer
GIT_AUTHOR_NAME="$RANDOM_NAME" \
GIT_AUTHOR_EMAIL="$RANDOM_EMAIL" \
GIT_COMMITTER_NAME="$RANDOM_NAME" \
GIT_COMMITTER_EMAIL="$RANDOM_EMAIL" \
git commit -m "$COMMIT_MSG"

echo "$RANDOM_NAME commit created: $COMMIT_MSG"
echo "Push to trigger history wipe workflow"