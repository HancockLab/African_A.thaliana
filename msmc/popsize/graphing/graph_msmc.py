#!/bin/python
import sys
import argparse
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from scipy import stats
from scipy.interpolate import interp1d
import scipy as sp
from astropy.stats.funcs import bootstrap

#colors=['#001f3f','#0074D9','#7FDBFF','#39CCCC','#3D9970','#2ECC40','#01FF70','#FFDC00','#FF851B','#FF4136','#85144b','#F012BE','#B10DC9','#111111','#AAAAAA','#DDDDDD']
#colors=['#d10000', "#ff6622","#ffda21","#33dd00","#1133cc","#220066","#330044"]
#colors=["#ff6622","#1133cc","#33dd00", "#1133cc"]

# main colors
#colors=['#FC6432','#32CAFC','#FEB42F','#17973A']
colors=['#FC6432','#32CAFC','#17973A']



parser = argparse.ArgumentParser(description="A script that plots msmc results. This will plot all lines and color them according to the group provided by the -f argument (and label according to the -l arg). \nTODO: add --means option to plot the means of the groups instead of all the lines.")
parser.add_argument("-l", "--legend", action="store", required=True, help="Labels for the legend. Should be same order as the files. Comma separated. e.g. '-l Within_Morocco,Within_Iberia'. Will automatically replace _ with a space.")
parser.add_argument("-o", "--out", action="store", required=True, help="Output filename")
parser.add_argument("-f", "--files", action="store", required=True, help="List of files containing the comparisons to graph. Comma separated. e.g. '-f w_m.txt,w_i.txt,w_w.txt'")
parser.add_argument("-m", "--means", action="store_true", required=False, default=False, help="Plot means of each group instead of every line.")
parser.add_argument("-k","--kruskal", action="store_true",required=False, default=False, help="Output complete sample array to file for each set of comparisons. For later use in a Kruskal-Wallis Rank Sum test.")

args = parser.parse_args()

file_list = args.files.split(",")
legend=args.legend.split(",")
for idx,l in enumerate(legend):
    legend[idx]=l.replace("_", " ")

num_groups = len(file_list)
plt.figure(figsize=(7,7))

if not args.means:
    for idx,f in enumerate(file_list):
        f2 = open(f,'r')
        for line in f2:
            try:
                res = open('results/'+line.strip("\n")+".popsize.txt", 'r')
            except FileNotFoundError:
                print("Couldn't find file: "+line.strip("\n")+". Continuing...")
                continue
            x_temp=res.readline()
            x = x_temp[1:-2].split(',')
            x = [float(t) for t in x]
            x[0] = x[1] / 4.0
            y_temp = res.readline()
            y = y_temp[1:-2].split(',')
            plt.step(x, y, where='post',lw=2.0, color=colors[idx], label=legend[idx],alpha=0.2)
elif args.means:
    for idx,f in enumerate(file_list):
        x_list = []
        y_list = []
        f2 = open(f, 'r')
        length=0
        for line in f2:
            try:
                res = open('results/'+line.strip("\n")+".popsize.txt", 'r')
                length=length+1
            except FileNotFoundError:
                print("Couldn't find file: "+line.strip("\n")+". Continuing...")
                continue
            x_temp=res.readline()
            x = x_temp[1:-2].split(',')
            try:
                x = [float(t) for t in x]
            except ValueError:
                print(x)
                print(res)
                continue
            x[0] = x[1] / 4.0
            y_temp = res.readline()
            y = y_temp[1:-2].split(',')
            x_list.append([float(i) for i in x])
            y_list.append([float(i) for i in y])
        if args.kruskal:
            np.savetxt(f+".x.array.txt",np.array(x_list))
            np.savetxt(f+".y.array.txt",np.array(y_list))
        x_mean = np.array(x_list).mean(axis=0)
        y_mean = np.array(y_list).mean(axis=0)
        x_median = np.median(np.array(x_list), axis=0)
        y_median = np.median(np.array(y_list), axis=0)
        y_std = np.std(np.array(y_list),axis=0)
        y_minus_std = y_mean - y_std
        y_plus_std = y_mean + y_std
        top_confidence = stats.norm.interval(0.05,loc=y_mean,scale=y_std)[0]
        bottom_confidence = stats.norm.interval(0.05,loc=y_mean,scale=y_std)[1]
        x_min = np.amin(np.array(x_list))
        x_max = np.amax(np.array(x_list))
        ## Step function with standard deviation
#        plt.step(x_mean, y_plus_std, where='post',lw=2.0, color=colors[idx], alpha=0.2)
#        plt.step(x_mean, y_mean, where='post',lw=2.0, color=colors[idx], label=legend[idx]+"(N="+str(length)+")")
#        plt.step(x_mean, y_minus_std, where='post',lw=2.0, color=colors[idx], alpha=0.2)

        ## Step function and fill in stddev
#        plt.step(x_mean, y_mean, where='post',lw=2.0, color=colors[idx], label=legend[idx]+"(N="+str(length)+")")
#        plt.fill_between(x_mean, y_plus_std, y_minus_std, color=colors[idx], alpha=0.2)

        ## Lines with standard deviation (use this for means with stdev!)
##        plt.plot(x_mean, y_mean, lw=2.0, color=colors[idx], label=legend[idx]+"(N="+str(length)+")")

#        plt.plot(x_mean, y_mean, lw=2.0, color=colors[idx], label=legend[idx])
#        plt.fill_between(x_mean, y_plus_std, y_minus_std, color=colors[idx], alpha=0.2)
        
        # multiply std dev by 1.5:
        x_mean2 = np.multiply(x_mean, 1.5)
        plt.fill_between(x_mean2, y_plus_std, y_minus_std, color=colors[idx], alpha=0.2)

        ## Lines with confidence intervals
 #       plt.plot(x_mean, y_mean, lw=2.0, color=colors[idx], label=legend[idx]+"(N="+str(length)+")")
 #       plt.fill_between(x_mean, top_confidence, bottom_confidence, color=colors[idx], alpha=0.2)

        ## Lines with median
#        plt.plot(x_median, y_median, lw=2.0, color=colors[idx], label=legend[idx]+"(N="+str(length)+")")    

        ## Median with cubic spline
        x_mult = np.multiply(x_median,(1.5)) # change gen time to 1.5 by multiplying
        x_rev = x_mult[::-1]
#        x_rev = x_median[::-1] # flip arrays so they are monotonically increasing
        y_rev = y_median[::-1]
        spln = interp1d(x_rev, y_rev, kind="cubic",bounds_error=False)
        xnew = np.linspace(x_min, x_max, num=10000, endpoint=True)
        plt.plot(xnew, spln(xnew), lw=2.0, color=colors[idx], label=legend[idx])

        ## Bootstrap resample # it is very ugly
#        y_boot = bootstrap(np.array(y_list),5)
#        for boot in y_boot:
#            for second_boot in boot:
#                plt.plot(x_median, second_boot, lw=0.5, color=colors[idx], alpha=0.2)

if args.means:
#    plt.legend(loc='center left', bbox_to_anchor=(1,0.5), frameon=False)
    plt.legend(loc='best', frameon=False)
else:
    plt.legend(legend,loc='center left', bbox_to_anchor=(1,0.5))
#plt.xlim(7e4,2e6) # supp fig
plt.xlim(3.5e4,1.3e6) #<- main figure
#plt.ylim(0,38e04)
plt.ylim(0,30e4) #<- main figure
plt.xscale('log')
#plt.axvspan(90000, 120000, color='lightblue', alpha=0.2, lw=0)
plt.axvspan(5500, 18000, color='lightblue', alpha=0.2, lw=0)
#plt.axvspan(420000, 480000, color='lightblue', alpha=0.5, lw=0)
#plt.axvspan(620000, 680000, color='lightblue', alpha=0.5, lw=0)
plt.gca().invert_xaxis()
plt.xlabel("Years ago")
plt.ylabel("Effective population size")
plt.savefig(args.out+'.pdf', bbox_inches='tight') 
#plt.savefig(args.out+'.eps', bbox_inches='tight', dpi=1000, format='eps')
