# Allwinner Cortex-A55 octa core 1/2/4GB RAM SoC
BOARD_NAME="radxa cubie a5e"
BOARDFAMILY="sun55iw3"
BOARD_MAINTAINER=""
BOOTCONFIG="radxa-a5e_defconfig"
OVERLAY_PREFIX="sun55i-a527"
#BOOT_LOGO="desktop"
KERNEL_TARGET="dev,edge"
BOOT_FDT_FILE="sun55i-a527-cubie-a5e.dtb"
IMAGE_PARTITION_TABLE="gpt"
#IMAGE_PARTITION_TABLE="msdos"
BOOTFS_TYPE="fat"
BOOTSTART="1"
BOOTSIZE="512"
ROOTSTART="513"
#enable_extension "radxa-aic8800"
#AIC8800_TYPE="sdio"

function post_family_tweaks__radxa_cubie-a5e() {
	display_alert "Applying wifi firmware"
	pushd "$SDCARD/lib/firmware"
	ln -s "aic8800/SDIO/aic8800D80" "aic8800_sdio" # use armbian-firmware
	popd
}
