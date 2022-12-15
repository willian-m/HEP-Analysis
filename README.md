# HEP Analysis toolbox

This repository is my personal toolbox for analysis of high-energy physics data
using jupyter-notebook. It contains a `Dockerfile` to build a Docker container 
with the necessary tools, includiong the jupyter-notebook. It is tailored for 
use along Google's collab, allowing easy integration Google's drive and thus 
easy sharing of you analysis notebook with colleagues.

## Workflow

Assuming your data is in a folder `/data/path` on your local computer, you 
do the following:

1. Clone this repository
2. From within the cloned repo, build the docker image:  `docker build . -t hep-analysis`
3. Run the container with: `docker run --mount type=bind,source=/data/path,target=/path/desired/on/container -p 8888:8888 -l container-name`
4. The output you give a URL similar to: `http://127.0.0.1:8888/?token=<random token string>`. Copy it.
5. You can either paste the URL into a browser, or open a new Google collab notebook,
click on the arrow at the side of the resource meter/reconnect button at the top left 
corner and select `Connect to a local runtime`. On the modal opened, past in the backend 
URL the copied URL.

> Tip 1: If you want to keep all data oon Google Drive, you can either use `rclone` to 
> manually sync data back and forth between your hard drive and Google Drive or use 
> Google's client.

> Tip 2: It is possible to have the docker container running in a remote machine and use your 
> local computer to edit a collab notebook. You will need to forward the remote port 8888
> to a local port (that may be the same 8888) port, even if there is a  gateway between your 
> remote and local computer (the most common architecture in universities). The easiest way 
> is via SSH with the command `ssh -L 8888:remotehost:8888 gatehost`.
