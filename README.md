# pru-mcp3208-6ch

To build, extract PRU software support package pru-software-support-package-5.7.0.tar.gz (from
[here](https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package/)) to 
`/usr/share/ti/pru-software-support-package`. It can be 
extracted to another path as long as the `PRU_SSP` environment variable points to it and is exported.

Aditionally, the PRU code generation tools must be installed (downloaded from [here](http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/2.3.3/ti_cgt_pru_2.3.3_armlinuxa8hf_busybox_installer.sh)) and installed in
`/usr/share/ti/cgt-pru`. To proceed instalation, make  `chmod a+x ti_cgt_pru_2.3.3_armlinuxa8hf_busybox_installer.sh` (or the actual cgt version). After unpacking make `./ti_cgt_pru_2.3.3_armlinuxa8hf_busybox_installer.sh` . If it is installed in a different path, the `PRU_CGT` environment variable must be exported and point to it.

For cross-compilation, export `CC` to the appropriate cross-compiler, like `export CC=arm-linux-gnueabihf-gcc`.

To compile, simply run `make`. To load the firmware into the PRUs, run 
`make deploy` in the BeagleBone Green Wireless. It also configures the relevant pins.
The ARM Host program, `host_rpmsg_mcp3208` reads the data and prints all readings of each buffer into the STDOUT, together with the timestamp and time difference between consecutive messages.

Pinout
------

* P8_42: SPI MISO     12
* P8_43: SPI Clock    13
* P8_45: SPI MOSI     11
* P8_46: Chip Select  10
