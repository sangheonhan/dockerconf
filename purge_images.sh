#! /bin/bash

docker rmi $(sudo docker images -q)
