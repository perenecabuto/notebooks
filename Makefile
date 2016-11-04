PORT := 8888
INSTANCE_NAME := notebook-local

.PHONY=run
run: build
	@if test "`docker ps -a | grep $(INSTANCE_NAME)`"; then \
		docker start $(INSTANCE_NAME); \
	else \
		docker run -d --name $(INSTANCE_NAME) -v $$PWD:/home/jovyan/work -p $(PORT):$(PORT) -P jupyter/opencv-datascience;\
	fi

.PHONY=build
build:
	docker build -t jupyter/opencv-datascience .
