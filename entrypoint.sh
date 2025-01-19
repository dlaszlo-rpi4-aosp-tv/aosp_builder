#!/bin/bash
if [ ! -z "$GIT_USERNAME" ] && [ ! -z "$GIT_EMAIL" ]; then
    git config --global user.name "${GIT_USERNAME}"
    git config --global user.email "${GIT_EMAIL}"
fi
exec "$@"

