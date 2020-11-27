function search() {
    # use `ag` instead
    grep $1 **/*~(.git|deps|doc|_build|__pycache__|node_modules)/*(.)
}

function replace() {
    # sed -i "s/$1/$2/g" **/*~(.git|deps|doc|_build|__pycache__|node_modules)/*(.)
    ag -0 -l $1 | xargs -0 sed -i "s/$1/$2/g"
}

function umbrella_cmd() {
    for i in apps/*
    do
        (cd $i && echo $i && $@)
    done
}

function addssh() {
    eval $(ssh-agent)
    ssh-add
}
