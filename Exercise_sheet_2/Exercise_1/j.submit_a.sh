#!/bin/bash -l
#
# allocate 16 nodes (64 CPUs) for 6 hours
#PBS -l nodes=1:ppn=40,walltime=01:00:00
#
# job name 
#PBS -N MoS2.phon
#
# stdout and stderr files
#PBS -o 1_a1.out -e run.err
#
# first non-empty non-comment line ends PBS options

export OMP_NUM_THREADS=1

module load intel64
module load gcc

echo $PBS_O_WORKDIR
cd $PBS_O_WORKDIR

mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_2/Exercise_1/MgO_a.in
