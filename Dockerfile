# Usa la imagen oficial de Rasa
FROM rasa/rasa:latest

# Define el directorio de trabajo
WORKDIR /app

# Copia todos los archivos del proyecto a la imagen
COPY . /app


# Instala dependencias
RUN pip install -r requirements.txt || true

# Entrena el modelo
RUN rasa train

# Comando para ejecutar Rasa en modo API
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--debug"]
