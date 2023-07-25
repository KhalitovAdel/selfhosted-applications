SHELL := /bin/bash
.PHONY: deploy-all

deploy-all:
	source .env && docker compose up -d

deploy-common:
	source .env && docker compose up -d traefik postgres keycloak