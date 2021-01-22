# ExaPi
Dockerized ExaGear image for Raspberry Pi 1, 2, 3 and 4.

## Usage
```
docker build -t exapi --build-arg PI_VERSION=<RASPI VERSION (1, 2, 3 or 4)> .
Optionally to just run the Image:
docker run -it --entrypoint /bin/bash exapi:latest
```

## Usage as Base Image
Please note that "CMD" and "RUN" commands are executed Outside the ExaGear Guest OS.
The ExaGear image root is located at: "/opt/exagear/images/default/" within the docker container.
