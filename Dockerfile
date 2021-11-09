FROM docker.elastic.co/beats/metricbeat:7.13.1
COPY metricbeat.yml /usr/share/metricbeat/metricbeat.yml
USER root
RUN chown root:metricbeat /usr/share/metricbeat/metricbeat.yml
RUN /usr/share/metricbeat/metricbeat modules disable system
RUN /usr/share/metricbeat/metricbeat modules enable mysql
COPY mysql.yml /usr/share/metricbeat/modules.d/mysql.yml
USER metricbeat