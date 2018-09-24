# npm-login

## Log into npmjs.com

`docker run --rm -v "$PWD/.npmrc:/npm/.npmrc" spangenberg/npm-login:latest -u USERNAME -p PASSWORD`

## Log into private registry

`docker run --rm -v "$PWD/.npmrc:/npm/.npmrc" spangenberg/npm-login:latest -u USERNAME -p PASSWORD registry.example.com`
