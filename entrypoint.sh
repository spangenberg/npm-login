#!/bin/sh

email=nobody@example.com
pass=
registry=registry.npmjs.com
user=

while getopts ":e:p:u:" opt; do
  case $opt in
    e)
      email="$OPTARG"
      ;;
    p)
      pass="$OPTARG"
      ;;
    u)
      user="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

shift $(expr $OPTIND - 1)

if [ -n "$1" ]; then
  registry="$1"
fi

if [ -z "$pass" ]; then
  echo "Password required, please specify -p." >&2
fi

if [ -z "$user" ]; then
  echo "User required, please specify -u." >&2
fi

if [ -z "$user" -o -z "$user" ]; then
  exit 1
fi

export NPM_EMAIL="$email"
export NPM_PASS="$pass"
export NPM_RC_PATH=/npm/.npmrc
export NPM_REGISTRY="https://$registry"
export NPM_USER="$user"

exec npm-cli-login
