run:
	source .env && docker compose up
rebuild:
	source .env && \
		docker compose down || echo "application was dows" && \
		docker compose up -d