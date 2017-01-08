set -ex

main() {
    if [ $TARGET = x86_64-unknown-linux-gnu ]; then
        cross build --target $TARGET
    else
        local td=$(mktemp -d)

        git clone . $td

        pushd $td
        ./gen-peripherals.sh
        test -z "$(git status -s)"
        popd

        rm -rf $td
    fi
}

if [ -z $TRAVIS_TAG ]; then
    main
fi
