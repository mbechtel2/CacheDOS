# CacheDOS

## Setup

### Initialize submodules

	$ git submodule update --init
	$ git submodule update --remote

### Make benchmarks and kernel modules
	
	$ cd IsolBench/bench; make; cd ../../
	$ cd memguard; make; cd ..
	$ cd base-memguard; make; cd ..

## Evaluation

### Recreate a specific figure

Move the Fig# subdirectory (replace # with the figure's numeric value):

	$ cd figures/Fig#/
	$ sudo ./run.sh

### Recreate all figures

	$ cd figures
	$ sudo ./run-tests.sh


Note that Figure 5 requires that the kernel be patched with PALLOC. For
patching instructions please refer to [https://github.com/heechul/palloc](https://github.com/heechul/palloc).

## Figure creation

### Copying Results

After a figure's tests are run, there will be one or more result text files generated
in its Fig# directory. These results need to be manually copied to figures/results.csv,
specifically in the columns for that figure (typically B through F). 

### Data to Copy

Below are example results text files for each of the files. The bold data values
should be copied to the csv file.

#### Figure 4

results.txt:

<pre><code>
CPU part	: 0xd03
CPU part	: 0xd03
CPU part	: 0xd03
CPU part	: 0xd03
Cortex-A53. PI3
bandwidth_read (48) bandwidth_read (4096)
<b>5.94</b>     #
<b>5.88</b>     # Figure 4a 
<b>6.20</b>     # Copy into corresponding platform column
<b>6.35</b>     #
bandwidth_read (48) bandwidth_write (4096)
<b>5.96</b>     #
<b>16.20</b>    # Figure 4b   
<b>1124.70</b>  # Copy into corresponding platform column
<b>1854.18</b>  #
</code></pre>
    
#### Figure 5

*The snippets below are only for the solo case. The same data for the +1-3
attacker cases will also need to be copied.*

nopart-results.txt (same as results.txt from Figure 4):

<pre><code>
bandwidth_read (48) bandwidth_write (4096)
assigned to cpu 0
memsize=48 KB, type=read, cpuid=0
stop at 4
g_nread(bytes read) = 47477293056
elapsed = 4.00 sec ( 4000015 usec )
CPU0: B/W = 11319.43 MB/s | CPU0: average = <b>5.39</b> ns # Figure 5a, copy to no part. column

 Performance counter stats for 'bandwidth -m 48 -t 4 -c 0 -r 1':

             3,340      LLC-load-misses           #    <b>0.00%</b> of all LL-cache hits   
       683,526,876      LLC-loads                      # Figure 5b, copy to no part. column

       4.003569937 seconds time elapsed
</code></pre>
    
PALLOC-results.txt:

<pre><code>
bandwidth_read (48) bandwidth_write (4096)
assigned to cpu 0
memsize=48 KB, type=read, cpuid=0
stop at 4
g_nread(bytes read) = 47172943872
elapsed = 4.00 sec ( 4000020 usec )
CPU0: B/W = 11246.85 MB/s | CPU0: average = <b>5.43</b> ns # Figure 5a, copy to no part. column

 Performance counter stats for 'bandwidth -m 48 -t 4 -c 0 -r 1':

             3,409      LLC-load-misses           #    <b>0.00%</b> of all LL-cache hits   
       681,173,299      LLC-loads                      # Figure 5b, copy to PALLOC column                             

       4.003787949 seconds time elapsed
</code></pre>       
           
#### Figure 6

*The snippets below are only for the solo case. The same data for the +1-3
attacker cases will also need to be copied.*

results.txt:

<pre><code>
bandwidth_read (48) <b>bandwidth_read</b> (4096) # If bandwidth_read copy to Figure 6a,
assigned to cpu 0                         # else if bandwidth_write copy to Figure 6b
memsize=48 KB, type=read, cpuid=0
stop at 4
g_nread(bytes read) = 42912890880
elapsed = 4.00 sec ( 4000008 usec )
CPU0: B/W = 10231.21 MB/s | CPU0: average = 5.97 ns

 Performance counter stats for 'bandwidth -m 48 -t 4 -c 0 -r 1':

       <b>293,911,466</b>      rc2:u        # Divide the top value by the bottom value, and copy                                                 
       <b>747,701,839</b>      LLC-loads:u  # the result into the corresponding platform column

       4.005241393 seconds time elapsed
</code></pre>           
           
#### Figure 11

base-bwr-results.txt:

<pre><code>
assigned to cpu 0
memsize=4096 KB, type=read, cpuid=0
stop at 5
g_nread(bytes read) = 524288000
elapsed = 5.00 sec ( 5000506 usec )
CPU0: B/W = <b>99.99</b> MB/s | CPU0: average = 610.41 ns
            # Copy to BwRead,Baseline cell
</code></pre>
                
base-bww-results.txt

<pre><code>
assigned to cpu 0
memsize=4096 KB, type=write, cpuid=0
stop at 5
g_nread(bytes read) = 524288000
elapsed = 5.00 sec ( 5000577 usec )
CPU0: B/W = <b>99.99</b> MB/s | CPU0: average = 610.42 ns
            # Copy to BwWrite,Baseline cell
</code></pre>

modified-bwr-results.txt

<pre><code>
assigned to cpu 0
memsize=4096 KB, type=read, cpuid=0
stop at 5
g_nread(bytes read) = 2617245696
elapsed = 5.00 sec ( 5000024 usec )
CPU0: B/W = <b>499.20</b> MB/s | CPU0: average = 122.27 ns
            # Copy to BwRead,Modified cell
</code></pre>            

modified-bww-results.txt

<pre><code>
assigned to cpu 0
memsize=4096 KB, type=write, cpuid=0
stop at 5
g_nread(bytes read) = 599785472
elapsed = 5.00 sec ( 5000028 usec )
CPU0: B/W = 114.40 MB/s | CPU0: average = 533.53 ns
            # Copy to BwWrite,Modified cell
</code></pre>            
                
#### Figure 13

noreg-results.txt (same as results.txt from Figure 4):

<pre><code>
CPU part	: 0xd03
CPU part	: 0xd03
CPU part	: 0xd03
CPU part	: 0xd03
Cortex-A53. PI3
bandwidth_read (48) bandwidth_read (4096)
5.94
5.88
6.20
6.35
bandwidth_read (48) bandwidth_write (4096)
<b>5.96</b>     #
<b>16.20</b>    # Figure 13   
<b>1124.70</b>  # Copy to no reg. column
<b>1854.18</b>  #
</code></pre>
   
1000r-100w-results.txt:

<pre><code>
CPU part	: 0xd03
CPU part	: 0xd03
CPU part	: 0xd03
CPU part	: 0xd03
Cortex-A53. PI3
bandwidth_read (48) bandwidth_write (4096)
<b>5.31</b>     # 
<b>6.67</b>     # Figure 13   
<b>8.09</b>     # Copy to 1000R/100W column
<b>8.67</b>     #
</code></pre>
    
500r-100w-results.txt:

<pre><code>
CPU part	: 0xd03
CPU part	: 0xd03
CPU part	: 0xd03
CPU part	: 0xd03
Cortex-A53. PI3
bandwidth_read (48) bandwidth_write (4096)
<b>5.46</b>     #
<b>6.38</b>     # Figure 13
<b>7.96</b>     # Copy to 500R/100W column
<b>8.66</b>     #
</code></pre>

500r-50w-results.txt:

<pre><code>
CPU part	: 0xd03
CPU part	: 0xd03
CPU part	: 0xd03
CPU part	: 0xd03
Cortex-A53. PI3
bandwidth_read (48) bandwidth_write (4096)
<b>5.46</b>     #
<b>6.15</b>     # Figure 13
<b>6.87</b>     # Copy to 500R/50W column
<b>7.49</b>     #
</code></pre>
    
### Plot Generation

Once all the results are copied columns H through L will contain the data to be copied to the corresponding
.dat files. The file to place the data in will be in the cells beginning with a '#'.

A single figure can then be generated by going to the figures Fig# directory and running:

	$ gnuplot gen.gp

All figures can be generated by running:

	$ ./gen-figures

From the figures directory.
