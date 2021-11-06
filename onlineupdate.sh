#Build by lone_wind
#清理文件
clean_up () {
    rm -rf openwrt*.img* sha256sums* *update.sh*
}
#版本选择
machine_choose () {
    echo -e '\e[92mFusionWrt固件升级脚本\e[0m'
    echo -e '\e[91m-------------------\e[0m'
    echo -e '\e[92m输入对应数字选择设备或退出\e[0m'
    echo "0 --- Exit退出"
    echo "1 --- R4S"
    echo "2 --- R2S"
    echo "3 --- X86"
    read -p "请输入数字[0-3],回车确认 " machine_num
    case $machine_num in
        0)
            echo -e '\e[91m退出脚本，升级结束\e[0m'
            exit;
            ;;
        1)
            echo -e '\e[92m已选择R4S\e[0m'
            wget https://raw.githubusercontent.com/lone-wind/scripts/main/r4s_update.sh && sh r4s_update.sh
            ;;
        2)
            echo -e '\e[92m已选择R2S\e[0m'
            wget https://raw.githubusercontent.com/lone-wind/scripts/main/r2s_update.sh && sh r2s_update.sh
            ;;
        3)
            echo -e '\e[92m已选择X86\e[0m'
            wget https://raw.githubusercontent.com/lone-wind/scripts/main/x86_update.sh && sh x86_update.sh
            ;;
        *)
            echo -e '\e[91m非法输入,请输入数字[0-3]\e[0m'
            machine_choose
            ;;
    esac
}
#系统升级
update_system () {
    clean_up
    machine_choose
}
update_system