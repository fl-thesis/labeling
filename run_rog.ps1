Write-Host "Avvio container ROG con build..."
docker compose -f docker-compose-rog.yml up --build -d
Start-Sleep -Seconds 5
Start-Process "http://localhost:8081"
