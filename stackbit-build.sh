#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dea3219b21f2a0019ee9f22/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dea3219b21f2a0019ee9f22
curl -s -X POST https://api.stackbit.com/project/5dea3219b21f2a0019ee9f22/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5dea3219b21f2a0019ee9f22/webhook/build/publish > /dev/null
