function search() {
    grep $1 **/*~(.git|deps|doc|_build|__pycache__|node_modules)/*(.)
}

function replace() {
    sed -i "s/$1/$2/g" **/*~(.git|deps|doc|_build|__pycache__|node_modules)/*(.)
}

function tsend {
    tmux send-keys -t "$@" C-m
}

function addssh() {
    eval $(ssh-agent)
    ssh-add
}
