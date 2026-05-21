FROM eceasy/cli-proxy-api:latest AS source

FROM python:3.11-slim

RUN mkdir /CLIProxyAPI

COPY --from=source /CLIProxyAPI /CLIProxyAPI

WORKDIR /CLIProxyAPI

RUN chmod +x /CLIProxyAPI/CLIProxyAPI
EXPOSE 8317
