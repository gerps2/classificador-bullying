# Imagem base
FROM python:3.9

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia os arquivos do projeto para o diretório de trabalho
COPY ./api /app

# Instala as dependências do projeto
RUN pip install --no-cache-dir -r /app/requirements.txt
RUN python -m nltk.downloader punkt stopwords wordnet
RUN chmod +x app.py

# Expõe a porta que será usada pelo aplicativo Flask
EXPOSE 80

# Define o comando de execução do aplicativo
CMD ["python", "app.py"]
