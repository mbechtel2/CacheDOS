#Figure 13
echo "Figure 13"
cd ../../memguard
insmod memguard.ko

#No regulation
echo "\tCopying Figure 4 for no regulation results"
cp ../figures/Fig4/results.txt noreg-results.txt
cd ../IsolBench/scripts

#Read: 500MB/s, Write: 100MB/s
echo "\t500R/100W"
echo mb 2500 500 500 500 > /sys/kernel/debug/memguard/read_limit
echo mb 2500 100 100 100 > /sys/kernel/debug/memguard/write_limit
./test-isolbench_bwwrite.sh > ../../figures/Fig13/500r-100w-results.txt

#Read: 1000MB/s, Write: 100MB/s
echo "\t1000R/100W"
echo mb 2500 1000 1000 1000 > /sys/kernel/debug/memguard/read_limit
echo mb 2500 100 100 100 > /sys/kernel/debug/memguard/write_limit
./test-isolbench_bwwrite.sh > ../../figures/Fig13/1000r-100w-results.txt

#Read: 500MB/s, Write: 50MB/s
echo "\t500R/50W"
echo mb 2500 500 500 500 > /sys/kernel/debug/memguard/read_limit
echo mb 2500 50 50 50 > /sys/kernel/debug/memguard/write_limit
./test-isolbench_bwwrite.sh > ../../figures/Fig13/500r-50w-results.txt

rmmod memguard