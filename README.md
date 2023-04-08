# Inception
 
 
## Usage:

Build the images:

```
make build ;
```

Create and start the containers:

```
make up ;
```

Display all images, containers, volumes and networks:

```
make ls ;
```

Build the images, create and start the containers and display the application's stats:

```
make ;
```

Stop the containers:

```
make stop ;
```

Factory reset:

```
make purge ;
```

Display the logs of a container:

```
docker logs <container_name>
```

or remove the '-d' flag in Makefile rule 'make up'

ssh into a running container
```
docker exec -it <container_name> bash
```
