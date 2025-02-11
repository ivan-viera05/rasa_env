# Usa la imagen oficial de Rasa
FROM rasa/rasa:latest

# Define el directorio de trabajo
WORKDIR /app

# Copia todos los archivos del proyecto a la imagen
COPY . /app


# Instala dependencias
RUN pip install --user -r requirements.txt

# Entrena el modelo 
RUN rasa train --fixed-model-name model

# Comando para ejecutar Rasa en modo API
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--debug"]
