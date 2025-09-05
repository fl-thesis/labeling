Write-Host "Avvio container CPA con build..."
docker compose -f docker-compose-cpa.yml up --build -d
Start-Sleep -Seconds 5
Start-Process "http://localhost:8080"
