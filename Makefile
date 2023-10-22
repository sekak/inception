

define cmd =
	sudo docker stop \$(sudo docker ps -a -q); \
	sudo docker rm \$(sudo docker ps -a -q);\
	sudo docker rmi \$(sudo docker images -q);\
	sudo docker volume rm \$(sudo docker volume ls -q)
endef

all:
	@echo "build images..."
	@sh ./srcs/requirement/tools/file.sh
	@sudo docker-compose  -p inception -f ./srcs/docker-compose.yaml up


down:
	sudo docker-compose -f ./srcs/docker-compose.yaml down

clean: down  
	@echo "stop and remove the containers, networks, and volumes that are created by docker-compose up."
	@ sh -c "$(value cmd)"
 

fclean: clean 
	@echo "remove volumes directory"
	@sudo rm -rf /home/med/data

re: fclean all

.PHONY: re fclean clean down up all 