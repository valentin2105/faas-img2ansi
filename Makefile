.PHONY: install image dependencies

build: dependencies
	@go install .

image: 
	@docker build -t johnmccabe/faas-img2ansi .

dependencies:
	@apk update
	@apk add git
	@rm -rf /var/cache/apk/*
	@go get -u github.com/golang/dep/cmd/dep
	@dep ensure