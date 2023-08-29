version: '3'

services:
  # Servizio per il container Samba che funge da controller di dominio Active Directory
  samba-ad:
    image: dperson/samba
    container_name: samba-ad
    environment:
      TZ: Europe/Rome
      SAMBA_DOMAIN: MYDOMAIN           # Nome del dominio
      SAMBA_REALM: MYDOMAIN.LOCAL      # Nome del realm
      SAMBA_HOST_IP: your_host_ip      # Indirizzo IP dell'host che ospita il container
      SAMBA_ADMINPASS: your_admin_password   # Password dell'amministratore di dominio
      SAMBA_USER: your_admin_user      # Nome utente dell'amministratore di dominio
      SAMBA_SHARE: /data               # Percorso condiviso all'interno del container
      SAMBA_SHARE_NAME: DataShare      # Nome della condivisione Samba
    volumes:
      - /path/to/data:/data            # Percorso sulla macchina host con dati da condividere
    ports:
      - "137:137/udp"                  # Porte UDP per Samba
      - "138:138/udp"                  # Porte UDP per Samba
      - "139:139/tcp"                  # Porte TCP per Samba
      - "445:445/tcp"                  # Porte TCP per Samba
    cap_add:
      - NET_ADMIN                      # Aggiungi capacità di rete
    restart: unless-stopped            # Riavvia il container a meno che non venga fermato esplicitamente
