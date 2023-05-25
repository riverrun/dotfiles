replace() {
    rg -0 -l $1 | xargs -0 sed -i "s/$1/$2/g"
}

umbrella_cmd() {
    for i in apps/*
    do
        (cd $i && echo $i && $@)
    done
}

addssh() {
    eval $(ssh-agent)
    ssh-add
}
