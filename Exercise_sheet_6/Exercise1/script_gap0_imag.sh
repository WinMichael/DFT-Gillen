#!/bin/bash
awk 'FNR==2 {print FILENAME,$0}' MgB2.imag_iso_* | awk '{print $1 "   " $4}' > MgB2.imag_iso_gap0
sed -i 's/MgB2.imag_iso_//' MgB2.imag_iso_gap0
