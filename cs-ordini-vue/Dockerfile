# Usa l'immagine di base appropriata per l'interfaccia Vue (es. node:14)
FROM node:14

# Aggiorna l'elenco dei pacchetti e installa le dipendenze
RUN apt update 

# Crea la directory di lavoro e imposta Composer
RUN mkdir /var/www/html
WORKDIR /var/www/html

# Copia solo i file necessari
# COPY . .

# Clona il repository da GitHub
RUN git clone https://github.com/customsoft/cs-ordini-vue.git .

# Installa le dipendenze dell'applicazione
RUN npm install

# Pulisci la cache di apt-get e altre operazioni di pulizia
RUN apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /root/.cache

# Esegui la build dell'applicazione Vue
RUN npm run build

# Comando predefinito per l'immagine Docker (ad es. per avviare un server HTTP)
CMD ["npm", "start"]
