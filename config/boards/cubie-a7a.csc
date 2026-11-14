# Allwinner A733 (sun60iw2) octa-core 2-16GB LPDDR5, GbE, PCIe, USB, WiFi6/BT (USB AIC8800)
#
# TODO: DWC3 USB2 hub / AIC8800 enumeration is still being validated.
# Ethernet, SD boot, UART and the eMMC module are working.
BOARD_NAME="Radxa Cubie A7A"
BOARD_VENDOR="radxa"
BOARDFAMILY="sun60iw2"
BOARD_MAINTAINER="juanesf91"
INTRODUCED="2026"
KERNEL_TARGET="edge"
KERNEL_TEST_TARGET="edge"
IMAGE_PARTITION_TABLE="msdos"
HAS_VIDEO_OUTPUT="no" # no mainline HDMI driver yet

BOOTCONFIG_EDGE="radxa_cubie_a7a_defconfig"
BOOT_FDT_FILE="allwinner/sun60i-a733-cubie-a7a.dtb"

# WiFi/BT is an AIC8800D80 connected over USB (not SDIO).
MODULES="aic_load_fw_usb aic8800_fdrv_usb aic_btusb_usb"
PACKAGE_LIST_BOARD="rfkill bluetooth bluez bluez-tools"
AIC8800_TYPE="usb"
enable_extension "radxa-aic8800"

# The kernel's parallel dtbs_install target can race while creating the
# vendor subdirectory. Pre-create it to keep the install step deterministic.
function kernel_make_config__cubie_a7a_precreate_dtbs_dirs() {
	if [[ -n "${kernel_dest_install_dir:-}" ]]; then
		mkdir -p "${kernel_dest_install_dir}/dtbs/allwinner/overlay"
	fi
}
