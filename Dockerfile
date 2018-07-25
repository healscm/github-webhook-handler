FROM heal/nodejs:8.11.1

ENV HOME /home/deployment
ENV APP_HOME $HOME/app

WORKDIR $APP_HOME
COPY package*.json $APP_HOME/

RUN npm install -g cnpm --registry=http://r.cnpmjs.org \
  && cnpm install github-webhook-handler \
  && cnpm install -g forever
EXPOSE 7777
ADD . $APP_HOME

CMD ["forever" "start" "/home/deployment/app/deploy.js"]
