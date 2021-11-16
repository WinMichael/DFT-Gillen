#!/bin/bash -l
#
# allocate 16 nodes (64 CPUs) for 1 hours
#PBS -l nodes=2:ppn=40,walltime=01:00:00
#
# job name 
#PBS -N MoS2.phon
#
# stdout and stderr files
#PBS -o 1_a.out -e run.err
#
# first non-empty non-comment line ends PBS options

export OMP_NUM_THREADS=1

module load intel64
module load gcc

echo $PBS_O_WORKDIR
cd $PBS_O_WORKDIR

mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_a/MgO_040.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_a/MgO_045.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_a/MgO_050.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_a/MgO_055.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_a/MgO_060.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_a/MgO_065.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_a/MgO_070.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_a/MgO_075.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_a/MgO_080.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_a/MgO_085.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_a/MgO_090.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_a/MgO_095.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_a/MgO_100.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_a/MgO_105.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_a/MgO_110.in
