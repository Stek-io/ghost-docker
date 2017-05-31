#!/usr/bin/env bash

# Sync files to the GHOST_CONTENT mount
rsync --ignore-existing -avz -progress "$GHOST_SOURCE/content/" "$GHOST_CONTENT/"

# Run DB migrator
knex-migrator init

# Start node
npm start