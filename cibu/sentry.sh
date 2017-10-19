main(){
    check
    if [[ "$(type -t "$2")" = function ]]; then
        $2 $@
    else
        show_help
    fi
}

check(){
    if [[ -z "$SENTRY_WEBHOOK" ]]; then
        echo "\$SENTRY_WEBHOOK environment variable not set"
        exit 1
    fi
}

release(){
    VERSION=$(date '+%Y-%m-%d-%H:%M:%S')
    if [[ -n "$3" ]]; then
        VERSION="$3"
    fi
    curl $SENTRY_WEBHOOK -X POST -H 'Content-Type: application/json' -d "{\"version\": \"$VERSION\", \"url\": \"$4\"}"
}

show_help(){
echo -e "
cibu sentry <SUBCOMMAND> [args...]

sentry related commands

SUBCOMMANDS:

release [version] [url]
    Create new release in sentry
    Defaults: version = current date, url = none
    Example: cibu sentry release '2.0.0-beta1' 'https://github.com/titanium-codes/cibu/issues/2'
"
}
