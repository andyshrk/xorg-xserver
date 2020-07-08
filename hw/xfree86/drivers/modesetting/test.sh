export DISPLAY=:0
killall -9 X
/etc/init.d/lightdm stop
sleep 1

/etc/init.d/lightdm start
sleep 2
su linaro -c "xhost +"
#X&
#sleep 4
#openbox&

echo performance | tee $(find /sys/ -name *governor)
irqbalance&

xrandr --output "Virtual-1" --pos 1920x0
xrandr --output "HDMI-1" --pos 1920x1080
sync
sleep 3
GST_DEBUG=fpsdisplaysink:6 gst-play-1.0 /4k.mp4 --videosink="fpsdisplaysink video-sink=xvimagesink signal-fps-measurements=true text-overlay=false sync=false"
