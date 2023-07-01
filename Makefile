run:
	docker compose rm -v -f && source .env && docker compose up -d
rebuild:
	source .env && \
		docker compose down || echo "application was dows" && \
		docker compose up -d 