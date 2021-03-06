FROM ubuntu as Build
RUN apt-get update && apt-get install -y wget \
 unzip \
 sed \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /neo
COPY prepare-node.sh .
RUN chmod +x prepare-node.sh
RUN ./prepare-node.sh

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS Final
RUN apt-get update && apt-get install -y screen \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /neo-cli
COPY --from=Build /neo/neo-cli .
COPY start.sh .
RUN chmod +x start.sh

ENTRYPOINT ["/neo-cli/start.sh" ]