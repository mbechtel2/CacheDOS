# Figure 5
echo "Figure 5 (no part.)"
cd ../../IsolBench/scripts
./test-isolbench_nopart.sh > ../../figures/Fig5/nopart-results.txt 2>&1
cd ../../
./util/palloc-setup.sh
echo 1 > /sys/kernel/debug/palloc/use_palloc
cd IsolBench/scripts
echo "Figure 5 (PALLOC)"
./test-isolbench_PALLOC.sh > ../../figures/Fig5/PALLOC-results.txt 2>&1
echo 0 > /sys/kernel/debug/palloc/use_palloc