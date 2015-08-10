#!/usr/bin/env sh

/path/to/caffe/build/tools/caffe train --solver=/path/to/hw1/2_caffe/logreg/logreg_solver.prototxt 2>&1 | tee logreg.log

