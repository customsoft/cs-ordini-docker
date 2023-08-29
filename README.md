# cs-ordini-docker

Questo progetto fornisce un ambiente Docker per l'esecuzione delle parti dell'applicazione cs-ordini, inclusa l'API in PHP e l'interfaccia Vue.js.

## Requisiti

- Docker e Docker Compose devono essere installati sulla tua macchina.

## Come utilizzare

1. Clona il repository:

```bash
git clone https://github.com/username/cs-ordini-docker.git
```

2. Naviga nella directory del progetto:

```bash
cd cs-ordini-docker
```

3. Crea una copia dell'ambiente di sviluppo:

```bash
cp .env.example .env
```

4. Apri il file .env e configura le variabili d'ambiente secondo le tue esigenze.

5. Avvia i contenitori Docker:

```bash
docker-compose up -d
```

6. Accedi all'applicazione API in PHP:
Apri il browser e visita: http://localhost:8080

7. Accedi all'applicazione Vue.js:
Apri il browser e visita: http://localhost:3000

8. Accedi al servizio di caching Redis:
Il servizio Redis è in esecuzione all'indirizzo localhost:6379.

9. Accedi ai log con Kibana:
Apri il browser e visita: http://localhost:5601
Configura l'indice "logstash-*" in Kibana per visualizzare i log.

10. Esegui il servizio di backup con Rclone:
Il servizio di backup con Rclone è in esecuzione all'interno del container. Consulta la documentazione di Rclone per configurare e utilizzare il backup.

11. Per arrestare i contenitori Docker:

```bash
docker-compose down
```

## Struttura del progetto

```scss
cs-ordini-docker/
├── cs-ordini-api/
│   ├── Dockerfile
│
├── cs-ordini-vue/
│   ├── Dockerfile
│
├── cs-ordini-cache/
│   ├── Dockerfile
│
├── cs-ordini-log/
│   ├── Dockerfile
│   ├── logstash.conf
│   ├── rclone.conf
│
├── cs-ordini-backup/
│   ├── Dockerfile
│   ├── backup.sh
│   ├── rclone.conf
│
├── docker-compose.yml
└── .env.example
```

## Configurazione delle variabili d'ambiente nel file .env

### Variabili per il database MariaDB
MYSQL_ROOT_PASSWORD=your_database_root_password
MYSQL_DATABASE=your_database_name
MYSQL_USER=your_database_user
MYSQL_PASSWORD=your_database_password

### Variabili per Rclone (esempio)
RCLONE_REMOTE_NAME=remote
RCLONE_REMOTE_TYPE=your_remote_type
RCLONE_REMOTE_PROVIDER=your_remote_provider
RCLONE_REMOTE_CLIENT_ID=your_client_id
RCLONE_REMOTE_CLIENT_SECRET=your_client_secret
RCLONE_REMOTE_SCOPE=your_scope
RCLONE_REMOTE_TOKEN=your_token

## Backup e Ripristino dei Dati

Per eseguire un backup dei dati dell'applicazione, puoi utilizzare il servizio di backup con Rclone. Esegui il seguente comando all'interno del container `cs-ordini-backup`:

```bash
docker exec cs-ordini-backup-container /backup.sh
```

Per ripristinare i dati da un backup, segui la documentazione di Rclone per utilizzare il comando rclone sync per copiare i dati dall'archivio di backup al percorso desiderato.

## Comandi Avanzati

### Esecuzione di uno script all'interno di un container

Se desideri eseguire uno script all'interno di un container, utilizza il comando `docker exec` seguito dal nome del container e il percorso dello script all'interno del container:

```bash
docker exec cs-ordini-backup-container /path/to/script.sh
```

## Accesso a una shell interattiva all'interno di un container

Se desideri accedere a una shell interattiva all'interno di un container, utilizza il comando docker exec con l'opzione -it:

```bash
docker exec -it cs-ordini-vue-container /bin/bash
```

## Requisiti di Sistema

- Docker versione 20.10 o superiore
- Docker Compose versione 1.27 o superiore
- Almeno 8 GB di RAM disponibile
- Almeno 100 GB di spazio su disco


## Note sulla Sicurezza

- Mantieni le tue variabili d'ambiente sensibili, come le credenziali del database e dell'autenticazione, al sicuro e non le condividere nel repository.
- Assicurati di proteggere l'accesso ai servizi esposti tramite autenticazione e autorizzazione adeguata.
- Considera l'uso di un reverse proxy (ad esempio Nginx) per gestire l'accesso HTTPS ai tuoi servizi Docker e aumentare la sicurezza.
- Mantieni aggiornati i tuoi container e i pacchetti software per mitigare le vulnerabilità di sicurezza note.

## Contributi

Se desideri contribuire a questo progetto, sentiti libero di aprire una pull request o segnalare problemi nella sezione delle issue.

## Licenza

Questo progetto è rilasciato con licenza GNU Affero General Public License.

