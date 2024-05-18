#!/bin/bash

IMAGE_VERSION=$(date '+%Y%m%d.%H%M%S')

SCRIPT_PATH=$(dirname "$0")

if [ "$SCRIPT_PATH" = "." ]; then
    SCRIPT_PATH=$(pwd)
fi

cd "$SCRIPT_PATH"

echo "${SCRIPT_PATH}"
SCRIPT_DIR=$(basename "${SCRIPT_PATH%/}")

REPOSITORY=`cat repository.txt`

IMAGE_NAME="${REPOSITORY}:${SCRIPT_DIR}-${IMAGE_VERSION}"

echo -n "${IMAGE_NAME}" > tag.txt

# echo ${IMAGE_NAME}
# =======================

CONTAINER_NAME=`cat container.txt`

# =======================

docker tag ${CONTAINER_NAME} ${IMAGE_NAME}
docker push "${IMAGE_NAME}"

# =======================

git add .
git commit -m "${IMAGE_VERSION}"
git push --force-with-lease

# docker-compose build

# docker tag ${CONTAINER_NAME} ${IMAGE_NAME}
# docker push "${IMAGE_NAME}"