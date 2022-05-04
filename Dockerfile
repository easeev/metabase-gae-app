FROM easeev/google-appengine-openjdk:11

ADD https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 ./cloud_sql_proxy
ADD https://downloads.metabase.com/v0.43.0/metabase.jar ./metabase.jar

RUN chmod +x ./cloud_sql_proxy
RUN keytool -importkeystore -srckeystore /etc/ssl/certs/java/cacerts -destkeystore /etc/ssl/certs/java/cacerts.jks -deststoretype JKS -srcstorepass changeit -deststorepass changeit -noprompt; \
	mv /etc/ssl/certs/java/cacerts.jks /etc/ssl/certs/java/cacerts; \
	/var/lib/dpkg/info/ca-certificates-java.postinst configure;

CMD ./cloud_sql_proxy -instances=$MB_SQL_INSTANCE=tcp:$MB_DB_PORT & java -jar ./metabase.jar
