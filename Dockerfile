FROM eceasy/cli-proxy-api:latest AS source

FROM python:3.11-slim

RUN mkdir /CLIProxyAPI

COPY --from=source /CLIProxyAPI/CLIProxyAPI /CLIProxyAPI/CLIProxyAPI
COPY --from=source /CLIProxyAPI/config.example.yaml /CLIProxyAPI/config.example.yaml

WORKDIR /CLIProxyAPI

RUN chmod +x /CLIProxyAPI/CLIProxyAPI
EXPOSE 8317
