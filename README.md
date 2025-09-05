# Framework di Etichettatura Immagini CPA/ROG

Framework professionale per l'etichettatura di immagini relative agli attacchi CPA e ROG attraverso applicazioni web containerizzate. Il sistema supporta l'esecuzione simultanea di entrambi gli scenari con interfacce web indipendenti.

## Caratteristiche principali

- **Architettura containerizzata** con Docker e Docker Compose
- **Esecuzione simultanea** di entrambi gli scenari (CPA e ROG)
- **Interfacce web separate** su porte dedicate
- **Persistenza dati** con salvataggio automatico del progresso
- **Deployment automatizzato** tramite script di avvio rapido

## Prerequisiti

- **Docker** >= 20.10
- **Docker Compose** >= 2.0
- **Shell**: Bash/Zsh (macOS/Linux/WSL/Windows)
- **Browser web** moderno (Chrome, Firefox, Safari, Edge)

---

## Architettura e accesso

Il framework è composto da due stack indipendenti che **possono essere eseguiti simultaneamente**:

| Scenario     | Porta Frontend | Porta Backend | URL di Accesso           |
|--------------|:--------------:|:-------------:|--------------------------|
| **CPA**      |     8080       |     5000      | http://localhost:8080    |
| **ROG**      |     8081       |     5001      | http://localhost:8081    |

> ✅ **Esecuzione simultanea supportata**: È possibile avviare entrambi gli stack contemporaneamente grazie alla configurazione di porte separate.

---

## 🚀 Modalità 1: Avvio rapido

Utilizzare questa modalità per iniziare immediatamente l'etichettatura senza configurazioni aggiuntive.

### Script di avvio automatico

Gli script di avvio scaricano automaticamente le immagini Docker preconfigurate da Docker Hub e avviano i servizi.

#### Avvio CPA
```bash
bash run_cpa.sh
```

#### Avvio ROG  
```bash
bash run_rog.sh
```

#### Avvio simultaneo (entrambi gli scenari)
```bash
bath run_cpa.sh
bash run_rog.sh
```

### Funzionalità degli script

- ✅ **Download automatico** delle immagini Docker da Docker Hub
- ✅ **Avvio dei container** con configurazione ottimale
- ✅ **Apertura automatica** del browser all'URL corretto
- ✅ **Gestione errori** con messaggi informativi

### Accesso alle applicazioni

Dopo l'avvio degli script:
- **CPA**: Apri [http://localhost:8080](http://localhost:8080)
- **ROG**: Apri [http://localhost:8081](http://localhost:8081)

---

## 📊 Utilizzo dell'applicazione

### Procedura di etichettatura

1. **Accesso iniziale**
   - Accedi all'URL dello scenario desiderato
   - Inserisci il tuo username identificativo
   - Conferma per iniziare la sessione

2. **Processo di etichettatura**
   - Analizza l'immagine visualizzata
   - Applica l'etichetta appropriata secondo le linee guida
   - Procedi all'immagine successiva

3. **NOTA: Salvataggio del progresso**
   - Utilizza il pulsante **"Save Progress"** regolarmente
   - **Obbligatorio** prima della chiusura dell'applicazione
   - Il salvataggio preserva tutto il lavoro svolto

4. **Esportazione delle etichette**

   Il file delle etichette è persistito automaticamente in `/app/reconstructed_labels.csv` all'interno del container backend.

   #### Metodo 1: Tramite Docker Desktop
   1. Apri **Docker Desktop** → **Containers**
   2. Seleziona il container backend (`cpa-backend` o `rog-backend`)
   3. Vai su **"Files"** → **"Browse files"**
   4. Naviga su `/app/reconstructed_labels.csv`
   5. Clicca su **"Download"**

   #### Metodo 2: Da terminale
   ```bash
   # Esportazione etichette CPA
   docker cp cpa-backend:/app/reconstructed_labels.csv ./cpa_labels.csv

   # Esportazione etichette ROG  
   docker cp rog-backend:/app/reconstructed_labels.csv ./rog_labels.csv

   # Verifica dei nomi container attivi
   docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}"
   ```

### Modalità di confronto

Entrambe le applicazioni supportano modalità di confronto per analisi comparative:
- Visualizzazione affiancata di immagini correlate
- Strumenti di annotazione avanzati
- Salvataggio sincronizzato delle etichette comparative

---


## 🛑 Gestione dei container

### Arresto dei servizi

#### Arresto singolo scenario
```bash
# Arresto CPA
docker compose -f cpa/docker-compose.yml down

# Arresto ROG
docker compose -f rog/docker-compose.yml down
```

#### Arresto di tutti i servizi
```bash
# Arresto completo di tutti i container del progetto
docker compose -f cpa/docker-compose.yml down
docker compose -f rog/docker-compose.yml down
```

#### Arresto tramite Docker Desktop
1. Apri **Docker Desktop**
2. Vai alla sezione **"Containers"**
3. Individua i container `cpa-*` o `rog-*`
4. Clicca su **"Stop"** per fermare il container desiderato

---
