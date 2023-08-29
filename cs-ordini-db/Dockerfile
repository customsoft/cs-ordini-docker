# Utilizza l'immagine di base di MariaDB
FROM mariadb:latest

# Copia le chiavi di crittografia nella directory appropriata dell'immagine
COPY my-encryption-keys /etc/mysql/encryption-keys

# Imposta le variabili d'ambiente per abilitare la crittografia
ENV MYSQL_ENCRYPTION_DIR /etc/mysql/encryption-keys
ENV MYSQL_ENCRYPTION_CIPHER 'aes_cbc'

# Personalizza le opzioni di configurazione di MariaDB per abilitare la crittografia
RUN echo '[mysqld]' >> /etc/mysql/my.cnf && \
    echo 'plugin-load-add=file_key_management' >> /etc/mysql/my.cnf && \
    echo 'file-key-management' >> /etc/mysql/my.cnf && \
    echo 'file-key-management-filename = /etc/mysql/encryption-keys/keyfile' >> /etc/mysql/my.cnf && \
    echo 'file-key-management-filekey = FILE:/etc/mysql/encryption-keys/keyfile.key' >> /etc/mysql/my.cnf && \
    echo 'file-key-management-encryption-algorithm = AES_CBC' >> /etc/mysql/my.cnf

# Esponi la porta di default di MariaDB
EXPOSE 3306

# Comando di avvio di MariaDB
CMD ["mysqld"]

#################
# Assicurati di sostituire "my-encryption-keys" con il percorso reale alla directory contenente le chiavi di crittografia che desideri utilizzare.
# Per costruire l'immagine Docker utilizzando questo Dockerfile, posizionati nella stessa directory del Dockerfile e delle chiavi di crittografia e esegui il seguente comando:
#
# docker build -t my-mariadb-encryption-image .
#
# Una volta completata la creazione dell'immagine, puoi eseguire un contenitore MariaDB con crittografia utilizzando il seguente comando:
# docker run --name my-mariadb-encryption-container -e MYSQL_ROOT_PASSWORD=mysecretpassword -d my-mariadb-encryption-image
#
# Assicurati di sostituire "mysecretpassword" con la password desiderata per l'utente root di MariaDB.
