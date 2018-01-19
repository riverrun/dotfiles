function search() {
    grep $1 **/*~(.git|deps|doc|_build|__pycache__|node_modules)/*(.)
}

function replace() {
    sed -i "s/$1/$2/g" **/*~(.git|deps|doc|_build|__pycache__|node_modules)/*(.)
}

function addssh() {
    eval $(ssh-agent)
    ssh-add
}

# mount a usb stick - $1 = device and $2 = mountpoint
function mountusb() {
    mount -o gid=users,fmask=113,dmask=002 $1 $2
}
