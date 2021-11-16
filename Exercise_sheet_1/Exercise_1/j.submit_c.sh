#!/bin/bash -l
#
# allocate 16 nodes (64 CPUs) for 1 hours
#PBS -l nodes=2:ppn=40,walltime=01:00:00
#
# job name 
#PBS -N MoS2.phon
#
# stdout and stderr files
#PBS -o 1_c.out -e run.err
#
# first non-empty non-comment line ends PBS options

export OMP_NUM_THREADS=1

module load intel64
module load gcc

echo $PBS_O_WORKDIR
cd $PBS_O_WORKDIR

mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_c/MgO_222_shift.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_c/MgO_444_shift.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_c/MgO_666_shift.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_c/MgO_888_shift.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_c/MgO_101010_shift.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_c/MgO_121212_shift.in
