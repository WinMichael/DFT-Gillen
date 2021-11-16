#!/bin/bash -l
#
# allocate 1 node (40 CPUs) for 1 hour
#PBS -l nodes=1:ppn=40,walltime=1:00:00
#
# job name 
#PBS -N diamond
#
# stdout and stderr files
#PBS -o run.out -e run.err
#
# first non-empty non-comment line ends PBS options

export OMP_NUM_THREADS=1

module load intel64
module load intelmpi
module load gcc

echo $PBS_O_WORKDIR
cd $PBS_O_WORKDIR

mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i C.scf.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i C.nscf.in
