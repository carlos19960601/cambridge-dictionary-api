IMAGE_NAME ?= cambridge-dictionary-api
TAG ?= latest

.PHONY: help docker-build

help: ## 显示可用命令及用法 | make help
	@echo "Usage:"
	@echo "  make <target> [IMAGE_NAME=name] [TAG=tag]"
	@echo ""
	@echo "Targets:"
	@awk 'BEGIN {FS = ":.*## "}; /^[a-zA-Z_-]+:.*## / {split($$2, parts, " \\| "); printf "  %-15s %s\n", $$1, parts[1]; if (parts[2] != "") printf "  %-15s 示例: %s\n", "", parts[2]; printf "\n"}' $(MAKEFILE_LIST)

docker-build: ## 构建 Docker 镜像（默认 cambridge-dictionary-api:latest） | make docker-build IMAGE_NAME=my-api TAG=v1
	docker build -t $(IMAGE_NAME):$(TAG) .
