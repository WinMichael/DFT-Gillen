import numpy as np
import matplotlib.pyplot as plt
import matplotlib.ticker as mticker
import scipy.constants as con

Ry 					= con.value("Rydberg constant times hc in eV")

# =============================================================================
# part a
# =============================================================================

data_a				= np.loadtxt("Exercise_1/1_a/1_a.txt")
cut_off, energy		= data_a[:,0], data_a[:,1]
energy				= energy*Ry/8
flattened 			= np.diff(data_a[:,1],1)
mask 				= (np.abs(flattened) <= 1e-3)
ind 				= np.where(mask)
ind					= ind[0][0]+1

fig, ax = plt.subplots()
ax.grid()
ax.plot(cut_off, energy, 'ks', label = "simulation run")
ax.annotate("convergence", xy=(cut_off[ind],energy[ind]),
			xytext=(90,-1029), color = 'red',
			arrowprops=dict(color='red', arrowstyle = '-|>'))
ax.legend()
ax.set_xlabel("cut off energy in eV")
ax.set_ylabel("total energy per atom in eV")

plt.savefig("1_a.pdf")

# =============================================================================
# part b and c
# =============================================================================

data_b				= np.loadtxt("Exercise_1/1_b/1_b.txt")
sampling_b, energy	= data_b[:,0], data_b[:,1]
energy_b			= energy*Ry/8
flattened 			= np.diff(data_b[:,1],1)
mask 				= (np.abs(flattened) <= 1e-3)
ind 				= np.where(mask)
ind_b				= ind[0][0]+1

data_c				= np.loadtxt("Exercise_1/1_c/1_c.txt")
sampling_c, energy	= data_c[:,0], data_c[:,1]
energy_c			= energy*Ry/8
flattened 			= np.diff(data_c[:,1],1)
mask 				= (np.abs(flattened) <= 1e-3)
ind 				= np.where(mask)
ind_c				= ind[0][0]+1

fig, ax = plt.subplots()
ax.grid()
ax.yaxis.set_major_formatter(mticker.ScalarFormatter())
ax.yaxis.get_major_formatter().set_scientific(False)
ax.yaxis.get_major_formatter().set_useOffset(False)
ax.plot(sampling_b, energy_b, 'ks', label = "simulation run")
ax.plot(sampling_c, energy_c, 'bo', label = "simulation run shifted")
ax.annotate("convergence", xy=(sampling_b[ind_b],energy_b[ind_b]),
			xytext=(9,-1034.714), color = 'red',
			arrowprops=dict(color='red', arrowstyle = '-|>'))
ax.annotate("convergence shifted", xy=(sampling_c[ind_c],energy_c[ind_c]),
			xytext=(9,-1034.716), color = 'red',
			arrowprops=dict(color='red', arrowstyle = '-|>'))
ax.legend()
ax.set_xlabel("$k$-point sampling")
ax.set_ylabel("total energy per atom in eV")

plt.savefig("1_b_c.pdf")

# =============================================================================
# part b and c
# =============================================================================

data_d1				= np.loadtxt("Exercise_1/1_d/1_d1.txt")
sampling_d1, energy	= data_d1[:,0], data_d1[:,1]
energy_d1			= energy*Ry/8
flattened 			= np.diff(data_d1[:,1],1)
mask 				= (np.abs(flattened) <= 1e-3)
ind 				= np.where(mask)
ind_d1				= ind[0][0]+1

data_d2				= np.loadtxt("Exercise_1/1_d/1_d2.txt")
sampling_d2, energy	= data_d2[:,0], data_d2[:,1]
energy_d2			= energy*Ry/8
flattened 			= np.diff(data_d2[:,1],1)
mask 				= (np.abs(flattened) <= 1e-3)
ind 				= np.where(mask)
ind_d2				= ind[0][0]+1

fig, ax = plt.subplots()
ax.grid()
ax.yaxis.set_major_formatter(mticker.ScalarFormatter())
ax.yaxis.get_major_formatter().set_scientific(False)
ax.yaxis.get_major_formatter().set_useOffset(False)
ax.plot(sampling_d1, energy_d1, 'ks', label = "simulation run")
ax.annotate("convergence", xy=(sampling_d1[ind_d1],energy_d1[ind_d1]),
			xytext=(80,-1073.92), color = 'red',
			arrowprops=dict(color='red', arrowstyle = '-|>'))
ax.legend()
ax.set_xlabel("cut off energy in eV")
ax.set_ylabel("total energy per atom in eV")

plt.savefig("1_d1.pdf")

fig, ax = plt.subplots()
ax.grid()
ax.yaxis.set_major_formatter(mticker.ScalarFormatter())
ax.yaxis.get_major_formatter().set_scientific(False)
ax.yaxis.get_major_formatter().set_useOffset(False)
ax.plot(sampling_d2, energy_d2, 'ks', label = "simulation run")
ax.annotate("convergence", xy=(sampling_d2[ind_d2],energy_d2[ind_d2]),
			xytext=(9,-1073.98435), color = 'red',
			arrowprops=dict(color='red', arrowstyle = '-|>'))
ax.legend()
ax.set_xlabel("cut off energy in eV")
ax.set_ylabel("total energy per atom in eV")

plt.savefig("1_d2.pdf")