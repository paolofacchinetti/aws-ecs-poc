# Immagine docker iniziale dalla quale partiamo
FROM golang:1.16-alpine

# Directory *interna* al nostro container che verrà usata come destinazione di default per i comandi successivi
WORKDIR /app

# Copiamo i nostri file locali all'interno dell'immagine
COPY go.mod ./
COPY go.sum ./

# Eseguiamo un comando all'interno del container (in questo caso scarichiamo in locale le nostre dipendenze)
RUN go mod download

# Copiamo i sorgenti Go all'interno del container
COPY *.go ./

# buildiamo l'eseguibile e lo posizioniamo nella root directory
RUN go build -o /aws-ecs-poc

# apriamo la porta 8080 (utilizzata dal nostro webserver)
EXPOSE 8080 

# Specifichiamo a Docker il comando da eseguire quando la nostra immagine viene utilizzata per avviare un container
CMD [ "/aws-ecs-poc" ]