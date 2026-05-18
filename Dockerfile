FROM FROM ghcr.io/decolua/9router:latest

EXPOSE 3000

CMD ["node", "server.js", "-p", "3000"]
