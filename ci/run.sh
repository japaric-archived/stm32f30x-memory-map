set -ex

test_mode() {
    if [ $TARGET = x86_64-unknown-linux-gnu ]; then
        cargo build --target $TARGET
    else
        local td=$(mktemp -d)
        local oldpwd=$(pwd)

        git clone . $td

        cd $td

        ./gen-peripherals.sh
        test -z $(git status -s)

        cd $oldpwd
    fi
}

run() {
    test_mode
}

run
