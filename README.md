# Python Intro 201804 [![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/geomar-tm/python-intro-201804/v2.0.0?urlpath=lab)

This course was held in April / May 2018.

## Preparation

### 1. Install Python on your computer

Follow
<https://conda.io/docs/user-guide/install/index.html#regular-installation> to
install _Miniconda3_ on your computer.  Miniconda is essentially a package
manager that we will use to install Python packages needed throughout the
course / in your later work.

On Linux and MacOS, the installer will ask whether you want to add Miniconda /
Conda to your path.  Please choose to **_not_** add it to your path.  ([See
below](#why) for why this is important.)

On Windows, install Miniconda to a hard drive with at least a few GB of free
space.  On Linux / MaxOS, the rest of this preparation guide will assume that
you installed to `${HOME}/miniconda3/`.

_**Note** that you should choose Python 3: [https://python3statement.org/](https://python3statement.org/#sections40-timeline)_

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
conda create -n py3_std -c conda-forge python=3 basemap basemap-data-hires cartopy cf_units cmocean dask gsw haversine hdf5 ipython jupyter jupyterlab line_profiler matplotlib memory_profiler netCDF4 numpy pandas seaborn scipy seawater xarray
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

> _**Note** that if Jupyter fails with a message "could not assign address", you need to explicitly choose the IP address for the jupyter server:_
>
> ```bash
> jupyter lab --ip=127.0.0.1
> ```

### Why?

#### Why not add Miniconda to the path?

Adding things to the `$PATH` using the `.bashrc` or the `.profile` may, at
first glance, seem comfortable.  There are, however, a few reasons for _not_
doing so:

1. The Python env really is a minimal one.  But Python is used by many
  different tools on your computer which probably expect that just calling
  `python` will use the Python (and additional packages) installed by the
  operating system.  None of these will be available to Miniconda's Python.

2. The conda environment we added above contains binary dependencies (such as
  a `libnetcdf`) of the packages we installed.  You don't want these to be the
  defaults when, e.g., compiling software that has nothing to do with your work
  in Python.

#### Why don't we just `conda install` everything right after installing Miniconda?

Working with environments provides an easy way of choosing packages and even
specific versions for different projects / tasks.  You might want to freeze the
environment for some project (like a paper, where you want to make sure that
plots don't change just because the new Matplotlib does something different
than the old one) while in another project, you might want to go for more
recent versions.

This video has a great intro to managing different working environments for
different projects:  <https://www.youtube.com/watch?v=cY2NXB_Tqq0>


## Credits

This course was partly inspired by: [https://rabernat.github.io/research_computing/](https://rabernat.github.io/research_computing/)

We downloaded sea-level data from: [PEGELONLINE](http://pegelonline.wsv.de)

We use annual-mean data from the [Baltic Sea-Ice Ocean Model BSIOM](https://portal.geomar.de/metadata/modelExperiment/show/349235).
