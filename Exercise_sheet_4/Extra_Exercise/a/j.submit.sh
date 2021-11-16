#!/bin/bash -l
#
# allocate 16 nodes (64 CPUs) for 6 hours
#PBS -l nodes=2:ppn=40,walltime=2:00:00
#
# job name 
#PBS -N MoS2.phon
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

mpirun -np 40 -genv I_MPI_PERHOST=allcores  -genv I_MPI_PERHOST=allcores $HOME/bin/qe/6.4/mpi/pw.x -i SiO2.scf.in
mpirun -np 40 -genv I_MPI_PERHOST=allcores  -genv I_MPI_PERHOST=allcores $HOME/bin/qe/6.4/mpi/pw.x -i SiO2.nscf.in