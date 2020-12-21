FROM ubuntu:20.04
EXPOSE 5000
RUN apt-get update -y && apt-get install --no-install-recommends wget -y && apt install git -y; \
    rm /var/lib/apt/lists/*; \
    wget -qO- https://get.haskellstack.org/ | sh; \
	git clone --single-branch --branch HS https://github.com/Innf107/vplan-ars.git; 	
WORKDIR "/vplan-ars/server"
RUN stack build;
WORKDIR "/vplan-ars/server"
CMD  stack run; \
docker build --pull --rm -f "Dockerfile" -t vplan:latest