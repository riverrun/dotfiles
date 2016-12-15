function search() {
    grep $1 **/*~(.git|deps|doc|_build|__pycache__|node_modules)/*(.)
}

function replace() {
    sed -i "s/$1/$2/g" **/*~(.git|deps|doc|_build|__pycache__|node_modules)/*(.)
}

alias zoek='racket /data/develop/scheme/potsnpans/zoek.rkt'
