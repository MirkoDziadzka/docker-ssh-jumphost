
all:
	$(MAKE) build

build:
	docker build --tag ssh-jumphost .

export:
	$(MAKE) build
	$(MAKE) docker-ssh-jumphost.tar

.PHONY:: docker-ssh-jumphost.tar
docker-ssh-jumphost.tar:
	docker image save ssh-jumphost > docker-ssh-jumphost.tar

authorized_keys:
	for file in $$HOME/.ssh/*.pub; do cat $$file >> authorized_keys; done

run: build authorized_keys
	@echo
	@echo "======================================================="
	@echo
	@echo "run 'ssh -l user -p 2022 localhost' from another window"
	@echo "hit ctrl-c to terminate this container"
	@echo
	@echo "======================================================="
	@echo
	docker run -it --rm -p 2022:22 --mount type=bind,source=$$(pwd),target=/mnt --name ssh-jumphost-test --env SSH_AUTHORIZED_KEYS=$$(base64 authorized_keys) ssh-jumphost

clean:
	-rm docker-ssh-jumphost.tar authorized_keys

# end of file
