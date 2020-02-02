# docker-minidlna

A Docker build context to create a clean Docker image with MiniDLNA.

# Prerequisites

[Docker] 17.05+

# Usage

## Retrieving the Image

```shell
docker pull rexypoo/minidlna
```

## Running MiniDLNA from the Command Line

Find the media you wish to share and invoke it as follows:

```shell
docker run -d --rm \
      --name minidlna \
      --net=host \
      -v "$HOME"/Music:/Multimedia/Music:ro \
      -v "$HOME"/Pictures:/Multimedia/Pictures:ro \
      -v "$HOME"/Videos:/Multimedia/Videos:ro \
      rexypoo/minidlna
```
In this example the host directories `$HOME/Music`,  `$HOME/Pictures` and `$HOME/Videos` are assumed to contain your media. If you just want to share a particular folder you can mount the volume directly to `/Multimedia` inside the container.

The network mapping `--net=host` appears to be required due to MiniDLNA automatically mapping a dynamic port at startup.

See the Dockerfile labels related to `org.label-schema.docker.cmd` for more information.

# License

This project is subject to the MIT license included in this repository.

[Docker]: https://www.docker.com
