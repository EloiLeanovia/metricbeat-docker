FROM docker.elastic.co/beats/metricbeat:7.13.1
COPY metricbeat.yml /usr/share/metricbeat/metricbeat.yml
USER root
RUN chown -R root:metricbeat /usr/share/metricbeat 
RUN /usr/share/metricbeat/metricbeat modules disable system
RUN /usr/share/metricbeat/metricbeat modules enable mysql
RUN chown -R metricbeat:metricbeat /usr/share/metricbeat/data
RUN chmod -R g+r /usr/share/metricbeat/data
RUN ls -al /usr/share/metricbeat/data
COPY mysql.yml /usr/share/metricbeat/modules.d/mysql.yml
USER metricbeat