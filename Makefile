.PHONY=run
run: build
	docker run -d --name jupyter -v $$PWD:/home/jovyan/work -p 8888:8888 -P jupyter/opencv-datascience

.PHONY=build
build:
	docker build -t jupyter/opencv-datascience .
