# Kali Docker

Just a Dockerfile with some tools I use for CTFs.

## Using the image

You can easily use the image by running:

```sh
docker run --rm -it mdval/kali-docker bash
```

However, this is how I usually start the container:
```sh
docker run --name kali --rm -it -p 1123-1133:1123-1133 --mount src=kali-docker-root,dst=/root --mount src=kali-docker-postgres,dst=/var/lib/postgresql mdval/kali-docker bash
```

- `-p 1123-1133:1123-1133`: This will publish ports for 1123 to 1133, so we can use `nc -lvnp 1123` from the container, for example
- `--mount src=kali-docker-root,dst=/root`: This will save the home directory in a volume, to make it persistent
- `--mount src=kali-docker-postgres,dst=/var/lib/postgresql`: This will save Postgres databases in a volume, to make it persistent

By using `--name kali`, you can easily get a new connection to the container by running:
```sh
docker exec -it kali bash
```

## Building the image

```sh
make build
```
