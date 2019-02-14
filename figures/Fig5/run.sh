# Figure 5
echo "Copying Figure 4 data for Figure 5a"
cp ../Fig4/results.txt nopart-results.txt
cd ../../
./util/palloc-setup.sh
echo 1 > /sys/kernel/debug/palloc/use_palloc
cd IsolBench/scripts
echo "Figure 5b"
./test-isolbench_PALLOC.sh > ../../figures/Fig5/PALLOC-results.txt 2>&1
echo 0 > /sys/kernel/debug/palloc/use_palloc