#!/bin/bash

AUTHORIZED_KEYS_FILE=/local/user/.ssh/authorized_keys

if [ -z "${SSH_AUTHORIZED_KEYS}" ] ; then
    echo ERROR: must set SSH_AUTHORIZED_KEYS environment variable
    exit 1
fi

echo "${SSH_AUTHORIZED_KEYS}" | base64 --decode >> "${AUTHORIZED_KEYS_FILE}"
chown user "${AUTHORIZED_KEYS_FILE}"
chmod 0644 "${AUTHORIZED_KEYS_FILE}"

exec /usr/bin/supervisord -c /supervisord.conf

