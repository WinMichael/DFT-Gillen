#!/usr/bin/python
import os
import sys 
import string
import math
import re
import array



nk1=int(sys.argv[1])
nk2=int(sys.argv[2])
nk3=int(sys.argv[3])

print "K_POINTS crystal"
print nk1*nk2*nk3
for i1 in range(nk1):
	for i2 in range(nk2):
		for i3 in range(nk3):
			print "%9.7f\t%9.7f\t%9.7f\t%9.7f"%(float(i1)/nk1,float(i2)/nk2,float(i3)/nk3, float(1)/(nk1*nk2*nk3))	