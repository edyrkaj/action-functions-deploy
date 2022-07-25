#!/bin/bash

cd functions || exit; npm install;

# Build the functions
functions_command="${FUNCTIONS_LIST}";

if [ -z "${FIREBASE_TOKEN}" ]; then
    echo "FIREBASE_TOKEN is missing"
    exit 1
fi

if [ -z "${FIREBASE_PROJECT}" ]; then
    echo "FIREBASE_PROJECT is missing"
    exit 1
fi

if [ -z "${FUNCTIONS_LIST}" ]; then
    functions_command="functions";
    echo "FUNCTIONS_LIST is missing but we will use default command ${functions_command}"
fi

# run command to deploy functions
firebase deploy \
    -m "${GITHUB_REF} (${GITHUB_SHA})" \
    --project ${FIREBASE_PROJECT} \
    --only ${functions_command}
