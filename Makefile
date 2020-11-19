
all: authorized_keys
	docker build --tag ssh-jumphost .

authorized_keys:
	for file in $$HOME/.ssh/*.pub; do cat $$file >> authorized_keys; done

run:
	@echo
	@echo "======================================================="
	@echo
	@echo "run 'ssh -l user -p 2022 localhost' from another window"
	@echo "hit ctrl-c to terminate this container"
	@echo
	@echo "======================================================="
	@echo
	docker run -it --rm -p 2022:22 --mount type=bind,source=$$(pwd),target=/mnt --name ssh-jumphost-test ssh-jumphost
