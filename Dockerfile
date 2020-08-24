FROM ruby:2.7.1-alpine3.12
RUN mkdir /app
WORKDIR /app

COPY kashi.sh /app/
COPY search.rb /app/
COPY get_lyrics.rb /app/

RUN set -x \
  && apk upgrade --no-cache \ 
  && apk add --no-cache --virtual build-dependencies build-base \
  && apk add --no-cache libxml2-dev libxslt-dev bash fzf util-linux \
  && gem install nokogiri -- --use-system-libraries --with-xml2-config=/usr/bin/xml2-config --with-xslt-config=/usr/bin/xslt-config \
  && gem install addressable \
  && apk del build-dependencies

ENTRYPOINT ["./kashi.sh"]
