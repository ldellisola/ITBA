#!/bin/sh
psql -v ON_ERROR_STOP=1  <<EOF
CREATE EXTENSION IF NOT EXISTS "tablefunc";
EOF
