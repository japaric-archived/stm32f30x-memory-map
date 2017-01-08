#!/bin/sh

set -ex

main() {
    local svd=STM32F30x.svd

    if [ ! -f $svd ]; then
        curl -LOs https://github.com/posborne/cmsis-svd/raw/python-0.4/data/STMicro/$svd
    fi

    svd2rust -i $svd tim6 > src/btim.rs
    sed -i 's/\(pub struct \)Tim6/\1BTim/' src/btim.rs

    svd2rust -i $svd dbgmcu > src/dbgmcu.rs

    svd2rust -i $svd gpioa > src/gpio.rs
    sed -i 's/\(pub struct Gpio\)a/\1/' src/gpio.rs

    svd2rust -i $svd tim2 > src/gptim.rs
    sed -i 's/\(pub struct \)Tim2/\1GpTim/' src/gptim.rs

    svd2rust -i $svd i2c1 > src/i2c.rs
    sed -i 's/\(pub struct I2c\)1/\1/' src/i2c.rs

    svd2rust -i $svd rcc > src/rcc.rs

    svd2rust -i $svd spi1 > src/spi.rs
    sed -i 's/\(pub struct Spi\)1/\1/' src/spi.rs

    svd2rust -i $svd usart1 > src/usart.rs
    sed -i 's/\(pub struct Usart\)1/\1/' src/usart.rs

    set +e
    rustfmt src/*.rs
    set -e

    cross build --target thumbv7em-none-eabihf
}

main
