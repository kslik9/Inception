PURPLE=\033[0;35m
NC=\033[0m

all:
	sh ./srcs/requirements/tools/make.sh
	docker-compose -f ./srcs/docker-compose.yml up -d --build
	@echo "$(PURPLE)Building has been done successfully$(NC)"

clean:
	docker-compose -f ./srcs/docker-compose.yml down
	@echo "$(PURPLE)Goodbye$(NC)"

fclean:
	@docker-compose -f ./srcs/docker-compose.yml down -v --rmi all
	@echo "$(PURPLE)Goodbye everything$(NC)"

re: fclean all
