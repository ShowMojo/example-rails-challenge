SHELL:=/bin/bash

wipe-all: down wipe-volumes wipe-images wipe-containers

wipe-volumes:
	@$$(cd gt-app/tmp && ls -A | grep -v '\.keep' | xargs sudo rm -rf)
	@if [[ -n "$$(docker volume ls -qf dangling=true)" ]]; then\
		docker volume rm -f $$(docker volume ls -qf dangling=true);\
  fi
	@docker volume ls -qf dangling=true | xargs -r docker volume rm

wipe-images:
	@if [[ -n "$$(docker images --filter "dangling=true" -q --no-trunc)" ]]; then\
		docker rmi -f $$(docker images --filter "dangling=true" -q --no-trunc);\
	fi
	@if [[ -n "$$(docker images | grep "none" | awk '/ / { print $3 }')" ]]; then\
		docker rmi -f $$(docker images | grep "none" | awk '/ / { print $3 }');\
	fi

wipe-containers:
	@if [[ -n "$$(docker ps -qa --no-trunc --filter "status=exited")" ]]; then\
		docker rm -f $$(docker ps -qa --no-trunc --filter "status=exited");\
	fi

wipe-postgres-redis-data:
	@sudo rm -rf tmp

down:
	@docker-compose down
	@docker-compose kill

install-docker:
	@echo "Installing Docker"

	@sudo apt-get update

	@sudo apt-get install \
		apt-transport-https \
		ca-certificates \
		curl \
		software-properties-common -y

	@curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

	@sudo add-apt-repository \
		"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
		$$(lsb_release -cs) \
		stable"

	@sudo apt-get update

	@sudo apt-get install docker-ce

	@sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) \
		-o /usr/local/bin/docker-compose

	@sudo chmod +x /usr/local/bin/docker-compose
	@sleep 5
	@echo "Docker Installed successfully"

install-docker-if-not-already-installed:
	@if [ -z "$$(which docker)" ]; then\
		make install-docker;\
	fi

build-all-docker-images:
	@echo "Building docker images."
	@echo "Grab a coffe and wait."
	@docker-compose build
	@echo "Docker images built"

pull:
	@git pull origin $$(git branch | grep \* | cut -d ' ' -f2) --rebase

push:
	@git push origin $$(git branch | grep \* | cut -d ' ' -f2) --force-with-lease

up:
	@docker-compose up -d

set-up: install-docker-if-not-already-installed down build-all-docker-images

reset: wipe-all set-up

