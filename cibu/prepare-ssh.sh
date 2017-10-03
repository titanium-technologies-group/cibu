main() {
    if [[ -z "$SSH_PRIVATE_KEY" ]]; then
        echo "Environment variable \$SSH_PRIVATE_KEY not set."
        exit 1
    fi
    mkdir -p ~/.ssh
    echo -e "Host *\n\tStrictHostKeyChecking no" > ~/.ssh/config
    echo "$SSH_PRIVATE_KEY" > ~/.ssh/id_rsa
    chmod 600 ~/.ssh/id_rsa
    eval $(ssh-agent -s)
    ssh-add
}
