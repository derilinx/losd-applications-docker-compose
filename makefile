.PHONY: init help init core down up clean-config clean logs build fast

include ./.env
export $(shell sed 's/=.*//' .env)


default: up

logs_virtuoso: 
	docker-compose logs -f virtuoso

logs_moodle: 
	docker-compose logs -f moodle

logs_olap: 
	docker-compose logs -f olap

logs_cubeviz: 
	docker-compose logs -f cubeviz

build: 
	docker-compose build

up: 
	docker-compose up -d
