# Usa la imagen base de Rasa
FROM rasa/rasa:latest

# Configura el directorio de trabajo
WORKDIR /app

# Copia todos los archivos del repositorio a /app
COPY . /app

# Otorga permisos adecuados a la carpeta de trabajo (si es necesario)
RUN chmod -R 777 /app || true

# Instala las dependencias sin `--user`
RUN pip install -r requirements.txt

# Entrena el modelo (opcional, puedes omitirlo si ya tienes uno)
RUN rasa train --fixed-model-name model || true

# Ejecuta el bot con el modelo entrenado
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--model", "models"]
