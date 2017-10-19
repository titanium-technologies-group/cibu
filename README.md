# cibu

CI BUild helper

Set of tools to simplify CI/CD pipelines.

## Modules

### prepare-ssh

Put `$SSH_PRIVATE_KEY` env var contents to ~/.ssh/id_rsa file, fix permissions and add key to ssh agent.

Very usefull for ssh operations in GitLab CI

### sentry

Sentry.io related commands

release `[version]` `[url]`

    Create new release in sentry

    Required env vars: `$SENTRY_WEBHOOK` - sentry release webhook url

    Defaults: version = current date, url = none

    Example: `cibu sentry release '2.0.0-beta1' 'https://github.com/titanium-codes/cibu/issues/2'`

### compose

docker and docker-compose related commands

login `<login>` `<password>` `<registry>`

    Run docker login on remote server

    Example `cibu compose login user password registry.gitlab.com`

    Will run `ssh $TARGET_HOST docker login -u user -p password registry.gitlab.com`


upload `[suffix]`

    Upload docker-compose file with target suffix (if provided) to remote server.

    Example: `cibu compose upload qa`

    Will run `scp docker-compose-qa.yml $TARGET_HOST:$TARGET_PATH/docker-compose.yml`


pull `[docker-compose pull argumets]`

    Perform a 'docker-compose pull' with arguments (if provided) on remote server in selected dir

    Example: `cibu compose pull --parallel`

    Will run `ssh $TARGET_HOST 'cd $TARGET_PATH; docker-compose pull --parallel'`


remove `<service>`

    Stop and remove selected service

    Example: `cibu compose remove redis`

    Will run `ssh $TARGET_HOST 'cd $TARGET_PATH; docker-compose stop redis; docker-compose rm -f redis'`


up `[docker-compose up args...]`

    Run docker-compose up command on target server

    Example: `cibu compose up --force-recreate`

    Will run `ssh $TARGET_HOST 'cd $TARGET_PATH; docker-compose up --force-recreate'`


update `<service>`

    Stop, remove and recreate selected service

    Example: `cibu compose update redis`

    Will run `ssh $TARGET_HOST 'cd $TARGET_PATH; docker-compose stop redis; docker-compose rm -f redis; docker-compose up -d --force-recreate --remove-orphans --no-deps redis'`


cleanup

    Run docker system prune and clean volumes marked to remove

    Example: `cibu compose cleanup`

    Will run `ssh $TARGET_HOST 'docker system prune -a -f; rm -rf /var/lib/docker/aufs/diff/*-removing'`

### help

Show overview and list of modules
