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
module load gcc

echo $PBS_O_WORKDIR
cd $PBS_O_WORKDIR

$HOME/bin/qe/serial/open_grid.x -i opengrid.in
$HOME/bin/qe/serial/wannier90.x -pp C
$HOME/bin/qe/serial/pw2wannier90.x -i pw2wan.in
$HOME/bin/qe/serial/wannier90.x C
