### Docker container

If you want to test the most recent features of <strong>svFSI</strong>, we provide the option to build and run **svFSI** in Docker container. All necessary files and instruction are shipped with **svFSI** source code under `Docker` directory. We also present the same material here for your reference. The Dockerfile is as follows.

```Docker
FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

# Install supporting packages
RUN apt-get update
RUN apt-get install -yq --no-install-recommends apt-utils
RUN apt-get install -yq git make cmake
RUN apt-get install -yq libblas-dev liblapack-dev
RUN apt-get install -yq gcc g++ gfortran 
RUN apt-get install -yq openmpi-bin libopenmpi-dev

# Create directory
RUN mkdir -p /home/test

# Add non-root user and set up home directory
RUN useradd testuser -u 1000 -g 100 -m -s /bin/bash
RUN chown testuser /home/test
USER testuser
WORKDIR /home/test

# Obtain source code
RUN git clone https://github.com/SimVascular/svFSI

# Compile svFSI source code
RUN mkdir Build && \
    cd Build && \
    cmake ../svFSI && \
    make

ENV PATH=$PATH:/home/test/Build/svFSI-build/bin
```

This Dockerfile will build **svFSI** executable from the most recent source code in the main repository. The following procedure has been successfully tested on MacOS Big Sur, Ubuntu 18.04 and Windows 10 with WSL 2. Assuming you already have [Docker](https://docs.docker.com/get-docker/) installed, please follow the steps below to run **svFSI**.

1\. Build Docker image. In the current directory (Path_to_svFSI/Docker), run the following command.

   ```bash
    docker build -t svfsi-image .
   ```

   This may take a while. Afterwards, run the command `docker images`, and you should see `svfsi-image`.

2\. Download the examples.

   ```bash
    git clone https://github.com/SimVascular/svFSI-Tests
   ```

3\. Run the container in interactive mode.

   ```bash
    docker container run --cap-add=SYS_PTRACE -v "$PWD"/svFSI-Tests:/home/test/svFSI-Tests -it --rm --name svfsi-demo svfsi-image
   ```

   This will open a shell prompt and you can proceed as usual. Here, `--cap-add=SYS_PTRACE` fixes a known [issue](https://github.com/open-mpi/ompi/issues/4948) of running openmpi in Docker.

4\. Let's take `04-fluid/06-channel-flow-2D` for example. In the shell prompt, run the following commands to generate the simulation results.

   ```bash
    cd svFSI-Tests/04-fluid/06-channel-flow-2D && \
   mpiexec -n 4 svFSI ./svFSI_Taylor-Hood.inp
   ```

   The results will be stored in `4-procs` in vtu format, and can be viewed with [Paraview](https://www.paraview.org).

5\. After all tests are done, execute the following commands to exit the docker and delete the image.

   ```bash
    exit && \
    docker rmi <IMAGE ID>
   ```

Please note that **svFSI** built with this Dockerfile won't work with any example that requires Trilinos. Trilinos takes too long to build within the Docker image, and we encourage any user that needs it to build **svFSI** from source.
