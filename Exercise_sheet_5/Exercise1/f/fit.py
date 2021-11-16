from scipy.optimize import leastsq
import numpy as np
import sys

def Murnaghan(parameters, vol):
    'From Phys. Rev. B 28, 5480 (1983)'
    E0, B0, BP, V0 = parameters

    E = E0 + B0 * vol / BP * (((V0 / vol)**BP) / (BP - 1) + 1) - V0 * B0 / (BP - 1.0)

    return E

def objective(pars, y, x):
    #we will minimize this function
    err =  y - Murnaghan(pars, x)
    return err



nvols=len(sys.argv)-1

if nvols>0:
	ntemp = -6
	fname = sys.argv[1]
	with open(fname, 'r') as f:
		for line in f:
			ntemp += 1

vols=np.zeros(shape=(nvols))
U0=np.zeros(shape=(nvols))
temperatures=np.zeros(shape=(ntemp))
Fvib=np.zeros(shape=(nvols,ntemp))
Ffree=np.zeros(shape=(nvols,ntemp))
eq_vols=np.zeros(shape=(ntemp))

for i in range(nvols):
	infile=open(sys.argv[i+1])
	lines=infile.readlines()
	infile.close()

	for j in range(ntemp):
		p=lines[6+j].split()

		temperatures[j]=float(p[0])
		Fvib[i][j]=float(p[2])

#read DFT energies
infile=open('DFT_energies')
lines=infile.readlines()

for i in range(nvols):
	p=lines[i].split()

	vols[i]=(float(p[0]))**3
	U0[i]=float(p[1])


#calculate F for all volumes and temperatures
for i in range(nvols):
	for j in range(ntemp):
		Ffree[i][j]=U0[i]+Fvib[i][j]



#Let's fit and plot now

x0 = [ -15.0, 5.0, 2.0, 130.0] #initial guess of parameters
x = np.linspace(min(vols), max(vols), 100)

for j in range(ntemp):
	energies=np.zeros(shape=(nvols))

	for i in range(nvols):
		energies[i]=Ffree[i][j]


	plsq = leastsq(objective, x0, args=(energies, vols))

	print 'Fitted parameters = {0}'.format(plsq[0])

	eq_vols[j]=plsq[0][3]


	#write the fitted curves to files

	y = Murnaghan(plsq[0], x)
	
	filename1='fit_'+str(temperatures[j])
	outfile1=open(filename1,'w')
	for i in range(len(x)):
		outfile1.write( "%9.5f\t %10.5f\n"%(x[i],y[i]) )
	outfile1.close()

	filename2='Ffree_'+str(temperatures[j])
	outfile2=open(filename2,'w')
	for i in range(nvols):
		outfile2.write( "%9.5f\t %10.5f\n"%(vols[i],Ffree[i][j]) )
	outfile2.close()


#Now we calculate the thermal expansion coefficient from central differences
deltaT = temperatures[1]-temperatures[0]
therm_alpha=np.zeros(shape=(ntemp))
for j in range(1,ntemp-1):
	alpha = (eq_vols[j+1]-eq_vols[j-1])/(2*deltaT)
	print eq_vols[j+1],eq_vols[j-1],eq_vols[j+1]-eq_vols[j-1],deltaT,alpha
	therm_alpha[j] = alpha/eq_vols[j]

	filename3='therm_alpha'
	outfile3=open(filename3,'w')
	for j in range(1,ntemp-1):
		outfile3.write( "%9.5f\t %15.10f\n"%(temperatures[j],therm_alpha[j]) )
	outfile2.close()
	

	
