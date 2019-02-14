#Figure 12
echo "Figure 12"

#Base MemGuard
echo "\tRunning baseline MemGuard"
cd ../../base-memguard
insmod memguard.ko g_hw_type=armv7
echo mb 100 100 100 100 > /sys/kernel/debug/memguard/limit
bandwidth -c 0 > ../figures/Fig11/base-bwr-results.txt 2>&1
bandwidth -a write -c 0 > ../figures/Fig11/base-bww-results.txt 2>&1
rmmod memguard

#Modified MemGuard
echo "\tRunning modified MemGuard"
cd ../memguard
insmod memguard.ko
echo mb 500 500 500 500 > /sys/kernel/debug/memguard/read_limit
echo mb 100 100 100 100 > /sys/kernel/debug/memguard/write_limit
bandwidth -c 0 > ../figures/Fig11/modified-bwr-results.txt 2>&1
bandwidth -a write -c 0 > ../figures/Fig11/modified-bww-results.txt 2>&1
rmmod memguard