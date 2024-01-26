# customize-wsl-distro
Customize WSL distro from a docker container
1. Build your docker image by dockerfile
2. Run a container from docker image
```bash
docker run -t ghcr.io/kevinpan45/wsl-kp45-ubuntu:latest
```
3. Export the container to a tar.gz file
```bash
docker export <Container ID> > distro-to-import.tar
```
4. Import tar.gz file as a WSL distro by WSL CLI --import
```bash
wsl --import <Distro> .wsl\<Distro> istro-to-import.tar
```
5. Run imported WSL distro
```bash
wsl -d <Distro>
```