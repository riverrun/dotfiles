function search() {
    grep $1 **/*~(.git|deps|doc|_build|__pycache__)/*(.)
}

function replace() {
    sed -i "s/$1/$2/g" **/*~(.git|deps|doc|_build|__pycache__)/*(.)
}