#!/bin/sh
##############################################################################  
# Optional parameters, any information specific for the system studied 
# 
SysInfo='Silicon'

# Mandatory parameters
# Specify SystemName and Force Constants matrix

Sysname='Si'

#
# Specify lattice type (used to create ttrinp file). It should be the same as in scf.in file 
# Specify atoms in the unit cell as they specified in scf.in file
# Specify atomic masses for these atoms in the same order as atoms in scf.in file
# Specify the frequency step (delta_e) as well, but 0.75 is a good choice

ibrav=2
atoms="Si1  Si2  "
mass="28.086  28.086 "
delta_e=0.75


# Below run commands 

# This is the folder where the QE and QHA programs are located
QE_DIR=$HOME/bin/qe/serial

# Generate q-points
$QE_DIR/tetra.x 

cp matdyn.init matdyn.init.tmp
cat  kpts_out >> matdyn.init.tmp
echo  EOF >>matdyn.init.tmp

mv  matdyn.init.tmp matdyn.in

echo ' Recalculating omega(q) from C(R)'
$QE_DIR/matdyn.x < matdyn.in > matdyn.out

nmodes=`head -1 frequency | cut -c 13-16 `
nkpt=`head -1 frequency | cut -c 23-26 `
natoms=`echo "scale=0; $nmodes/3" | bc -l`
#
cat >phdos1.in <<EOF
$nkpt  $nmodes
$atoms
EOF

# Calculate partial phonon DOS
$QE_DIR/Partial_phonon_DOS.x < phdos1.in 

#rm -f phdos1.in

cat >phdos.in <<EOF
$delta_e
$atoms
EOF

# Calculate total  phonon DOS and atom projected phonon DOS
$QE_DIR/phonon_dos.x <frequency 

# Remove NaN from  all phonon DOS files

cat >name <<EOF
PHDOS.out
EOF

cp PHDOS.out PHDOS.out.copy

$QE_DIR/Ghost_DOS.x <name  >out 

mv out PHDOS.out

# Finally, thermodynamic properties
#
# Parameters required for QHA calculations
# Total Phonon DOS file
# output file for C_V, S, Internal energy
#
cat >fqha.in <<EOF
PHDOS.out
$Sysname.QHA.out
EOF

cat Temperature >> fqha.in

$QE_DIR/F_QHA.x <fqha.in 

echo 'Phonon DOS and Quasiharmonic calculations have finished.' 
echo 'Now you can analyse these data using Gnuplot or xmgrace'
echo 'Enjoy!'


