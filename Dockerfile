# 新加：构建参数，默认不拉
ARG PULL_LATEST=false

# 新加：如果 PULL_LATEST=true，就手动 pull 最新 latest
RUN if [ "$PULL_LATEST" = "true" ]; then docker pull eceasy/cli-proxy-api:v7.1.66; fi

# 原内容不变
FROM eceasy/cli-proxy-api:latest AS source

FROM python:3.11-slim

RUN mkdir /CLIProxyAPI

COPY --from=source /CLIProxyAPI/CLIProxyAPI /CLIProxyAPI/CLIProxyAPI
COPY --from=source /CLIProxyAPI/config.example.yaml /CLIProxyAPI/config.example.yaml

WORKDIR /CLIProxyAPI

RUN chmod +x /CLIProxyAPI/CLIProxyAPI
EXPOSE 8317
