### Pre-Matching Algorithm

This algorithm will be used to help find those D2D links that can perform SWIPT in the D2D communication system.

The pseudocode of this algorithm will look like this:

![image-20220207115914557](C:\Users\elc20yl\AppData\Roaming\Typora\typora-user-images\image-20220207115914557.png)

As shown the pseudocode, the generated D2D links set $D$, CUE set $C$ , transmission power of CUE $P_{k} ^{c}$, the  minimum power segment $P_{thresold}^{1}$ , maximum transmission $P_{max}$, the minimum Throughput of a D2D link $T_{min}^{D}$  will be taken as input, and it should generate a partner selection $PS$, a SWIPT-supported D2D link group 𝐸𝑛𝑎𝐷 and a Non-EH group $InfD$. 

To start with, two empty sets for $EhaD$ and $InfD$ will be firstly initialized respectively. Each D2D link i will be paired with a CUE k from a sub-partner selection $PS_{i}^{D}$ which will be initialized as the CUE set C for each loop of D2D i can be obtained using equations:
$$
\theta_{i,min}=\frac{P_{thresold}^{1}}{P_{max}h_{i}^{D}+P_{k}^{c}h_{k,i}+N_{0}}(1 )
$$

$$
T_{i,max}^{D}=\frac{P_{i}^{D}h_{i}^{D}}{P_{k}^{C}h_{k,i}+N_{0}+\frac{N_{1}}{1-\theta_{i,min}}}
$$

Then, as mentioned before, for each D2D link i  paired with the current CUE k, if the minimum power splitting ratio 𝜃𝑖,𝑚𝑖𝑛 of the current D2D i is greater than 1  and the maximum throughput $T_{i,max}^{D}$ is smaller than the minimum throughput $T_{min}^{D}$ , that means it is impossible  for the current CUE k to help the D2D link i perform SWIPT, then the current CUE k will be removed from the  sub-partner selection set. Finally, at the end of loop of the CUE set, the current sub-partner selection will be  checked if it is empty, if so, it means that the current D2D link i cannot find any CUE k to help it perform SWIPT  hence cannot activate EH, then it will be added to 𝐼𝑛𝑓𝐷. Otherwise, it means that there is at least one CUE k  which can help it perform SWIPT and it will be added to the group $EhaD$. The sub-partner selection will be added  EEE380/381/480 Interim Report Page 10 of 22 to the partner selection set $PS$. So, at the end of this pre-matching algorithm, each D2D link i will have a partner  selection set where the CUEs can help it perform SWIPT.