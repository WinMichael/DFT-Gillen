#!/bin/bash -l
#
# allocate 16 nodes (64 CPUs) for 6 hours
#PBS -l nodes=1:ppn=40,walltime=1:00:00
#
# job name 
#PBS -N phon
#
# stdout and stderr files
#PBS -o run.out -e run.err
#
# first non-empty non-comment line ends PBS options

export OMP_NUM_THREADS=1

module load intel64
module load gcc

echo $PBS_O_WORKDIR
cd $PBS_O_WORKDIR

mpirun -np 20 $HOME/bin/qe/mpi/pw.x -i Si.scf.in
mpirun -np 20 $HOME/bin/qe/mpi/ph.x -i ph.in
