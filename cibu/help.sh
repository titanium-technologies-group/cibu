main() {
    echo -e "CI BUilder helper

    cibu <module> [args..]

MODULES:"
    find $PREFIX -type f -iname "*.sh" -print | sed 's/.*\///; s/\.sh//'
}
