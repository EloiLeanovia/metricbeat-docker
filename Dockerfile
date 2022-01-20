FROM docker.elastic.co/beats/metricbeat:7.13.1
COPY metricbeat.yml /usr/share/metricbeat/metricbeat.yml
USER root
RUN chown -R root:metricbeat /usr/share/metricbeat 
RUN /usr/share/metricbeat/metricbeat modules disable system
RUN /usr/share/metricbeat/metricbeat modules enable mysql
RUN /usr/share/metricbeat/metricbeat modules enable jolokia
#LOL TODO: trouver une solution à ça
RUN chmod -R 777 /usr/share/metricbeat/data
COPY mysql.yml /usr/share/metricbeat/modules.d/mysql.yml
COPY jolokia.yml /usr/share/metricbeat/modules.d/jolokia.yml
# Installation de filebeat
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.8.23-x86_64.rpm
RUN rpm -vi filebeat-6.8.23-x86_64.rpm
RUN systemctl start filebeat

USER metricbeat
