FROM docker.elastic.co/beats/metricbeat:7.13.1
COPY metricbeat.yml /usr/share/metricbeat/metricbeat.yml