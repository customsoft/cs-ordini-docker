# Utilizza l'immagine di base di Logstash
FROM docker.elastic.co/logstash/logstash:7.14.0

# Copia il file di configurazione di Logstash personalizzato
COPY logstash.conf /usr/share/logstash/pipeline/

# Porta predefinita di Logstash (può essere cambiata nel file di configurazione)
EXPOSE 5044

# Comando di avvio di Logstash
CMD ["-f", "/usr/share/logstash/pipeline/logstash.conf"]
