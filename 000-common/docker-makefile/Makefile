.PHONY: rebuild start clean stop down

rebuild:
	@echo "docker-compose up -d --build --force-recreate"
	docker-compose up -d --build --force-recreate

start:
	@echo "docker-compose up -d"
	docker-compose up -d

logs:
	@echo "docker-compose logs -f"
	docker-compose logs -f

stop:
	@echo "docker-compose down || true"
	docker-compose down || true

down: stop

clean-docker: stop
	@echo "docker-compose rm -fsv || true"
	docker-compose rm -fsv || true

clean: clean-docker