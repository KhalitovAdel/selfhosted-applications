dev:
	docker compose rm -v -f && source .env && docker compose up -d
dev-remote:
	docker compose rm -v -f && source .env && docker compose -f docker-compose.yml -f docker-compose.remote.yml up -d
rebuild:
	source .env && \
		docker compose down || echo "application was dows" && \
		docker compose up -d 