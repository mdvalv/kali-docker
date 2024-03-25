build:
	docker build -t kali-docker .

bash:
	docker run --privileged --name kali --rm -it -p 1123-1133:1123-1133 --mount src=kali-docker-root,dst=/root --mount src=kali-docker-postgres,dst=/var/lib/postgresql kali-docker bash

bash-network:
	docker run --name kali --rm -it --network="host" --mount src=kali-docker-root,dst=/root --mount src=kali-docker-postgres,dst=/var/lib/postgresql kali-docker bash

new-bash:
	docker exec -it kali bash
