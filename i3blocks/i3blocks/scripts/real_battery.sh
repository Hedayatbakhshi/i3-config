# install upower for this to work
capacity=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep capacity | sed 's/[ \t]//g' | awk -F'[:%]' '{print $2}'`
pcng=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | sed 's/[ \t]//g' | awk -F'[:%]' '{print $2}'`
state=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | sed 's/[ \t]//g' | awk -F'[:%]' '{print $2}'`

case $state in
  fully-charged)
    state="FULL"
    ;;

  charging)
    state="CHR"
    ;;

  [dD]ischarging)
    state="DIS"
    ;;
esac

printf "$state %.2f%% ($pcng%%)" `echo "scale=10; $pcng * $capacity / 100" | bc` 
