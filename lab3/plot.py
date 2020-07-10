# libraries
import numpy as np
import matplotlib.pyplot as plt
 
# set width of bar
barWidth = 0.1
 
#ipc
#bars1 =[9.40344,7.00547, 2.01710,2.68914 ] 
#bars2 = [9.50261,7.14856, 2.36697 ,2.78785 ]
#bars3 = [9.46121, 7.12020,2.33612, 2.61375]
#bars4 = [ 9.49383,7.09032, 2.14592,3.02147]
#bars5 = [ 9.46286,7.12074,2.33565,2.76974]

#maximum slowdown
bars1 =[1.06169365,1.0727843, 1.1937446, 1.7908362] 
bars2 = [1.022876,1.028632,1.056372,1.745266]
bars3 = [1.0440748,1.0479759,1.0696548,2.0176768]
bars4 = [1.0188537,1.0373214,1.1283475, 1.6027575]
bars5 = [1.0467799,1.0511267,1.1081724,1.986029]

 
# Set position of bar on X axis
r1 = np.arange(len(bars1))
r2 = [x + barWidth for x in r1]
r3 = [x + barWidth for x in r2]
r4 = [x + barWidth for x in r3]
r5 = [x + barWidth for x in r4]
 
# Make the plot
plt.bar(r1, bars1, color='#BDBDBD', width=barWidth, edgecolor='white', label='FCFS')
plt.bar(r2, bars2, color='#6E6E6E', width=barWidth, edgecolor='white', label='FRFCFS')
plt.bar(r3, bars3, color='#1C1C1C', width=barWidth, edgecolor='white', label='FRFCFS_Cap')
plt.bar(r4, bars4, color='#0040FF', width=barWidth, edgecolor='white', label='ATLAS')
plt.bar(r5, bars5, color='#FF0040', width=barWidth, edgecolor='white', label='BLISS')

 
# Add xticks on the middle of the group bars
plt.xlabel('Maximum Slowdown', fontweight='bold')
plt.xticks([r + barWidth for r in range(len(bars1))], ['HLLL','HHLL','HHHH','HHHHHHHH'])
# Create legend & Show graphic
plt.legend()
plt.show()

