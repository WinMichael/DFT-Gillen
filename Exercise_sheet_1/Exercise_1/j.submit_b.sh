#!/bin/bash -l
#
# allocate 16 nodes (64 CPUs) for 1 hours
#PBS -l nodes=2:ppn=40,walltime=01:00:00
#
# job name 
#PBS -N MoS2.phon
#
# stdout and stderr files
#PBS -o 1_b.out -e run.err
#
# first non-empty non-comment line ends PBS options

export OMP_NUM_THREADS=1

module load intel64
module load gcc

echo $PBS_O_WORKDIR
cd $PBS_O_WORKDIR

mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_b/MgO_222.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_b/MgO_333.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_b/MgO_444.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_b/MgO_555.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_b/MgO_666.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_b/MgO_777.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_b/MgO_888.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_b/MgO_999.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_b/MgO_101010.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_b/MgO_111111.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_b/MgO_121212.in
