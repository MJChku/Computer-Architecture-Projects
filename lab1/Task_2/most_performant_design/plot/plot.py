import matplotlib.pyplot as plt
import csv

for i in range(1,12,1):
    
    x = []
    y = []
    pltname = "plot_"+str(i)
    filename = "plot_"+ str(i) + '_y1.csv'
    filename2 = "plot_"+ str(i) + '_y2.csv'
    with open(filename,'r') as csvfile:
        plots = csv.reader(csvfile, delimiter=';')
        for row in plots:
            row = row[0:]
            x = [ float(ele) for ele in row if ele != '']

    with open(filename2,'r') as csvfile:
        plots = csv.reader(csvfile, delimiter=';')
        for row in plots:
            y = [float(ele) for ele in row if ele != '']

    z = [ys/xs for (xs,ys) in zip(x,y)]
    plt.plot(z)
    plt.ylabel('IPC')
    plt.savefig(pltname+'.png')
    plt.clf()
