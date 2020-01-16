FROM gcr.io/google-appengine/openjdk

ADD https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 ./cloud_sql_proxy
ADD http://downloads.metabase.com/v0.34.1/metabase.jar ./metabase.jar

RUN chmod +x ./cloud_sql_proxy

CMD ./cloud_sql_proxy -instances=$MB_SQL_INSTANCE=tcp:$MB_DB_PORT & java -jar ./metabase.jar
