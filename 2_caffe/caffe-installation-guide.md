# Caffe Installation

## What is Caffe?

[Caffe](http://caffe.berkeleyvision.org/) is a deep learning framework developed primarily by [Berkeley Learning and Vision Centre](http://bvlc.eecs.berkeley.edu/) (BLVC).
It uses both the CPU and GPU to accelerate training of neural networks.

## Setting up Caffe:

The [Caffe installation page](http://caffe.berkeleyvision.org/installation.html) has most of the necessary details. To make your work a little simpler,
we run through some of the key steps. 

1.  Know your hardware to decide your installation type.
    If your machine has a GPU, find out if it supports CUDA (5.* and above should be fine). If it does,
    you can go ahead with the GPU installation. You can use this to check the GPU in your machine:
    ```sh
    $ lscpi | grep –i nvidia
    ```
    If your machine does not have a GPU or if CUDA is not supported, go ahead with a CPU
    installation. However, even for a CPU only installation, you will need to install CUDA in order to
    compile your code.
    [This](http://corpocrat.com/2014/11/03/how-to-setup-caffe-to-run-deep-neural-network/) has pointers to set up CUDA and cuDNN (this further optimizes your performance with
    the GPU and is optional)

2.  OS:

    Linux and OS X are supported. Unofficial support for windows support exists. Trying it can be a good adventure.

3.  Interface:

    Python: ANACONDA python provides most of the necessary python packages. Also, one can
    install packages to existing anaconda version without any root privileges.
    Anaconda install page: http://docs.continuum.io/anaconda/install.html
    Depending on your choice make appropriate changes in the Makefile.config
    MATLAB: Caffe also supports MATLAB interface. For both python and MATLAB interface, make sure you 
    make appropriate in the path in your Makefile.Config file. 
    
4.  Make:
    Run the following once you have installed all the dependencies and made necessary changes in
    your Makefile.Config:

    `make all`  
    `make test`  
    `make runtest`

    If all the tests pass, you are mostly set!

5.  Pycaffe:

    Once you finish installing, you need to build the python interface – pycaffe so that you can
    import caffe into your python environment like any other python package.

    ```
    $ make pycaffe
    $ make distribute
    ```

    Then, add caffe to your PYTHONPATH using

    ```
    $ PYTHONPATH=/path/to/caffe/python:$PYTHONPATH
    ```
    You may want to add this to your ~/.bashrc file so that caffe is added to your PYTHONPATH
    once for all. You will need to restart the terminal or execute:
    
    ```
    $ source ~/.bashrc
    ```
    
    [This](https://bitbucket.org/GusFYP/fyp_real/wiki/Home) may be of help while setting up pycaffe:

6. Run an example net to verify the installation

    caffe-master is the folder in which you have installed caffe
    ```sh
    $ cd caffe-master
    $ ./data/mnist/get_mnist.sh
    $ ./examples/mnist/create_mnist.sh
    $ ./examples/mnist/train_lenet.sh
    ```

## Getting a basic idea of Caffe

1. [This](http://caffe.berkeleyvision.org/tutorial/) is a good tutorial that details the structure of Caffe.
2. You need to specify Caffe to take in data through the data layer.
- using HDF5 input format is convenient due to support through h5py in python. It comes installed with
anaconda. In case, you want to do install it separately, it is [here](http://docs.h5py.org/en/latest/build.html)
- LMDB is also supported through python. It can be installed by:
```sh
$ pip install [lmdb](https://lmdb.readthedocs.org/en/release/)
``` 
And if you are using anaconda,
```sh
$ conda install lmdb
```
- you may also want to see imagedata layer. Although this might be a little slower, it is easier to setup.
3. Using the command-line interface to define net and train:
Examples are your best friends here! Having a look at the examples in caffe-master/examples/
should give you a good idea. There are two important files you need to write:
1. your_net.prototxt – contains the definition of your network architecture
2. your_net_solver.prototxt – parameters like the solver method, base learning rate, maximum number
of iterations, etc are set here. You can snapshot intermediate models during training so that you can
continue training at a later point or to inspect the the training process. More info on the solver file is [here](http://caffe.berkeleyvision.org/tutorial/solver.html)
You might also want to write a log file. You can do this by adding this to the end of the command that
executes the training process: 
```sh
$ command-to-train-your-net-in-caffe 2>&1 | tee nameofyourlogfile.log
```
[This](http://nbviewer.ipython.org/github/BVLC/caffe/blob/master/examples/01-learning-lenet.ipynb) python notebook provides a good 
outline on using caffe with python interface completely. Although command line inter-face is simpler and saves a few lines of code, pythonistas may prefer to use this! 

