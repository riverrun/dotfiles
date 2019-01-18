function search() {
    # use `ag` instead
    grep $1 **/*~(.git|deps|doc|_build|__pycache__|node_modules)/*(.)
}

function replace() {
    # sed -i "s/$1/$2/g" **/*~(.git|deps|doc|_build|__pycache__|node_modules)/*(.)
    ag -0 -l $1 | xargs -0 sed -i "s/$1/$2/g"
}

function addssh() {
    eval $(ssh-agent)
    ssh-add
}
