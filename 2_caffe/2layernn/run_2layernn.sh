#!/usr/bin/env sh

/path/to/caffe/build/tools/caffe train --solver=/path/to/hw1/2_caffe/2layernn/2layernn_solver.prototxt 2>&1 | tee 2layernn.log

# Make appropriate changes in paths and name of log file!
