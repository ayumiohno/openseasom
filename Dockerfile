FROM python:3.10

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs
RUN apt-get install -y libglib2.0-0 libnss3 libnspr4 libdbus-1-3 libatk1.0-0 libatk-bridge2.0-0 libcups2 libatspi2.0-0 libx11-6 libxcomposite1 libxdamage1 libxext6 libxfixes3 libxrandr2 libgbm1 libdrm2 libxcb1 libxkbcommon0 libpango-1.0-0 libcairo2 libasound2 

WORKDIR /app

RUN pip install Flask
RUN npm install puppeteer
RUN npm install escape-html
RUN npm install express
RUN npm install fs

COPY server.py server.py
COPY admin.js admin.js

RUN echo "CTF{*****}" > secret.txt

EXPOSE 1336 1337

CMD ["sh", "-c", "node admin.js & python server.py"]
