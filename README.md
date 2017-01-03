# Scripts for using GPU with NVIDIA Docker on AWS
The scripts in this repository are used to run (Jupyter notebook)[http://jupyter.org] with [NVIDIA Docker](https://github.com/NVIDIA/nvidia-docker) on [AWS](https://aws.amazon.com). 

These scripts are based on a [post](http://qiita.com/masafumi_miya/items/8263a25642d65a0c4a20) (in Japanese).

## 1. Launch EC2 instance
* ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-20161213
* g2.2xlarge (also work on g2.8xlarge but I did not test)

## 2. Disable nouveau
This step is required for installing NVIDIA driver.

```console
$ ssh -i "public_key.pem" ubuntu@ec2-54-162-123-145.compute-1.amazonaws.com 'bash -s' < disable_nouveau.sh
```

When this script is finised, the remote machine will restart.

## 3. Install NVIDIA driver
```console
$ ssh -i "public_key.pem" ubuntu@ec2-54-162-123-145.compute-1.amazonaws.com 'bash -s' < install_nvidia_driver.sh
```

## 4. Install Docker
```console
$ ssh -i "public_key.pem" ubuntu@ec2-54-162-123-145.compute-1.amazonaws.com 'bash -s' < install_docker.sh
```

## 5. Install NVDIA Docker
```console
$ ssh -i "public_key.pem" ubuntu@ec2-54-162-123-145.compute-1.amazonaws.com 'bash -s' < install_nvidia_docker.sh
```

## 6. Build Docker image
```console
$ scp -r -i "public_key.pem" docker ubuntu@ec2-54-162-123-145.compute-1.amazonaws.com:~/
$ ssh -i "public_key.pem" ubuntu@ec2-54-162-123-145.compute-1.amazonaws.com 'cd docker; chmod 755 *.sh'
$ ssh -i "public_key.pem" ubuntu@ec2-54-162-123-145.compute-1.amazonaws.com 'bash -s' < build_docker_image.sh
```

## 7. Run notebook server
```console
$ ssh -i "public_key.pem" ubuntu@ec2-54-162-123-145.compute-1.amazonaws.com

# On remote
$ cd docker
$ ./run_docker_container.sh