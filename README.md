# Python Intro 201804

This course will be held in April / May 2018.

## Preparation

### 1. Install Python on your computer

Follow
<https://conda.io/docs/user-guide/install/index.html#regular-installation> to
install _Miniconda3_ on your computer.  Miniconda is essentially a package
manager that we will use to install Python packages needed throughout the
course / in your later work.

On Linux and MacOS, the installer will ask whether you want to add Miniconda /
Conda to your path.  Please choose to **_not_** add it to your path.

On Windows, install Miniconda to a hard drive with at least a few GB of free
space.  On Linux / MaxOS, the rest of this preparation guide will assume that
you installed to `${HOME}/miniconda3/`.

### 2. Set up the working environment

_(This step will start / activate the root environment you installed in step 1
and then add an environment with all the packages we need in the course.)_

Start a terminal (Linux / MacOS) or the Anaconda prompt (Windows). Activate the
root (or base) environment of your Miniconda:

```bash
source ${HOME}/miniconda3/bin/activate root  # Linux / MacOS
activate root                                # Windows
```

And create an environment containing Python 3, Numpy, Matplotlib, scipy, Ipython,
Jupyter, Jupyterlab, Pandas, Xarray, netCDF4, Cartopy, Basemap, ...:

```bash
conda create -n py3_std -c conda-forge python=3 dask line_profiler memory_profiler seaborn seawater numpy matplotlib scipy ipython jupyter jupyterlab pandas xarray netCDF4 cartopy basemap basemap-data-hires
```

### 3. Activate the new environment

Now, activate the new environment:

```bash
source ${HOME}/miniconda3/bin/activate py3_std  # Linux / MacOS
activate py3_std                                # Windows
```

And start up Jupyterlab as a first test:

```bash
jupyter lab
```
