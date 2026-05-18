FROM ghcr.io/decolua/9router:latest

ENV PORT="3000"
ENV HOSTNAME="0.0.0.0"
ENV NODE_ENV="production"

EXPOSE 3000

CMD ["node", "server.js"]
