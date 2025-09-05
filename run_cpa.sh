#!/bin/bash

echo "Avvio container CPA con build..."
docker compose -f docker-compose-cpa.yml up --build -d
sleep 5
if command -v xdg-open > /dev/null; then
    xdg-open "http://localhost:8080"
elif command -v open > /dev/null; then
    open "http://localhost:8080"
elif command -v start > /dev/null; then
    start "http://localhost:8080"
else
    echo "Apri manualmente: http://localhost:8080"
fi
