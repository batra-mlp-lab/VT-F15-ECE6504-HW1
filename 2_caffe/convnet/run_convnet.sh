#!/usr/bin/env sh

/path/to/caffe/build/tools/caffe train --solver=/path/to/hw1/2_caffe/convnet/convnet_solver.prototxt 2>&1 | tee convnet.log

# Make appropriate changes in paths and name of log file!
