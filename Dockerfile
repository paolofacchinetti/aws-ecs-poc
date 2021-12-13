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

# Buildiamo l'eseguibile e lo posizioniamo nella root directory
RUN go build -o /aws-ecs-poc

# Specifichiamo che la nostra app usa la porta 8080 
EXPOSE 8080 

# Specifichiamo a Docker il comando da eseguire quando viene avviato un container a partire dalla nostra immagine
CMD [ "/aws-ecs-poc" ]