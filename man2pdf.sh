#!/bin/bash
echo Converting manual page for $1 to pdf format in file named $1.pdf
man -t $1 | ps2pdf - $1.pdf


