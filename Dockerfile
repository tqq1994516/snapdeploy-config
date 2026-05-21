FROM eceasy/cli-proxy-api:latest AS source

FROM python:3.11-slim

COPY --from=source /CLIProxyAPI /

RUN chmod +x /CLIProxyAPI
EXPOSE 8317
