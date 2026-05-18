FROM ghcr.io/decolua/9router:latest

EXPOSE 20128

CMD ["node", "server.js"]
