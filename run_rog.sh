#!/bin/bash

echo "Avvio container ROG con build..."
docker compose -f docker-compose-rog.yml up --build -d
sleep 5
if command -v xdg-open > /dev/null; then
    xdg-open "http://localhost:8081"
elif command -v open > /dev/null; then
    open "http://localhost:8081"
elif command -v start > /dev/null; then
    start "http://localhost:8081"
else
    echo "Apri manualmente: http://localhost:8081"
fi
