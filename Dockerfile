############################################################
# Dockerfile to build Stanford NLP service
############################################################
FROM java:jre-alpine

MAINTAINER Instabase, Inc.

RUN apk add --update --no-cache \
	 unzip \
	 wget

# TODO(jssln): Host this ourselves.
RUN wget http://nlp.stanford.edu/software/stanford-corenlp-full-2017-06-09.zip
RUN unzip stanford-corenlp-full-2017-06-09.zip && \
	rm stanford-corenlp-full-2017-06-09.zip

WORKDIR stanford-corenlp-full-2017-06-09

EXPOSE 9001

CMD java -Xmx4g -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port 9001 -timeout 60000