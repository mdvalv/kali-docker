build:
	docker build -t my-kali .

bash:
	docker run --name kali --rm -it -p 1123:1123 --mount src=my-kali-root,dst=/root --mount src=my-kali-postgres,dst=/var/lib/postgresql my-kali bash

new-bash:
	docker exec -it kali bash
