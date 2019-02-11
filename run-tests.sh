# Figure 4
cd IsolBench/scripts
./test-isolbench_default.sh > ../../figures/Fig4/results.txt

# Figure 5
../../util/palloc-setup.sh
./test-isolbench_nopart.sh > ../../figures/Fig5/nopart-results.txt
./test-isolbench_PALLOC.sh > ../../figures/Fig5/PALLOC-results.txt
sudo echo 0 > /sys/kernel/debug/palloc/use_palloc

# Figure 6
./test-isolbench_linefills.sh > ../../figures/Fig6/results.txt

#Figure 12

#Base MemGuard
cd ../../base-memguard
insmod memguard.ko
echo mb 100 100 100 100 > /sys/kernel/debug/memguard/limit
bandwidth -c 0 > ../figures/Fig12/base-bwr-results.text
bandwidth -a write -c 0 > ../figures/Fig12/base-bww-results.txt
rmmod memguard

#Modified MemGuard
cd ../memguard
insmod memguard.ko
echo mb 500 500 500 500 > /sys/kernel/debug/memguard/read_limit
echo mb 100 100 100 100 > /sys/kernel/debug/memguard/write_limit
bandwidth -c 0 > ../figures/Fig12/modified-bwr-results.text
bandwidth -a write -c 0 > ../figures/Fig12/modified-bww-results.txt


#Figure 13
cd ../IsolBench/scripts

#No regulation
cp ../../figures/Fig4/results.txt ../../figures/Fig13/noreg-results.txt

#Read: 500MB/s, Write: 100MB/s
echo mb 2500 500 500 500 > /sys/kernel/debug/memguard/read_limit
echo mb 2500 100 100 100 > /sys/kernel/debug/memguard/write_limit
./test-isolbench_default.sh > ../../figures/Fig12/500r-100w-results.txt

#Read: 1000MB/s, Write: 100MB/s
echo mb 2500 1000 1000 1000 > /sys/kernel/debug/memguard/read_limit
echo mb 2500 100 100 100 > /sys/kernel/debug/memguard/write_limit
./test-isolbench_default.sh > ../../figures/Fig12/1000r-100w-results.txt

#Read: 500MB/s, Write: 50MB/s
echo mb 2500 500 500 500 > /sys/kernel/debug/memguard/read_limit
echo mb 2500 50 50 50 > /sys/kernel/debug/memguard/write_limit
./test-isolbench_default.sh > ../../figures/Fig12/500r-50w-results.txt

#Cleanup
rmmod memguard
cd ../..
