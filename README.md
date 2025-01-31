# bootcamp-monitoring
Monitoring template for bootcamp

## Creating the instances
Create Prometheus and Grafana instances via https://github.com/sknop/bootcamp-terraform

You need to set the flag 

    create-monitoring-instances = true

The Terraform script will automatically add both instances to your hosts.yml file.

## Configuring monitoring in cp-ansible

This Ansible script is designed to be used in conjunction with cp-ansible.
When deploying your Confluent Cluster, add the following variables to your inventory:

    jmxexporter_enabled: true
    jmxexporter_version: 1.1.0
    jmxexporter_jar_url: https://github.com/prometheus/jmx_exporter/releases/download/{{jmxexporter_version}}/jmx_prometheus_javaagent-{{jmxexporter_version}}.jar

Note that cp-ansible might lag behind the JMX Monitoring Stacks used for the dashboards,
so you should update the configuration scripts for the JMX Exporter.

Clone https://github.com/confluentinc/jmx-monitoring-stacks onto your jumphost, then
add configuration source paths in your inventory file, for example:

    kafka_controller_jmxexporter_config_source_path: /home/ubuntu/jmx-monitoring-stacks/shared-assets/jmx-exporter/kafka_broker.yml
    kafka_broker_jmxexporter_config_source_path: /home/ubuntu/jmx-monitoring-stacks/shared-assets/jmx-exporter/kafka_broker.yml
    schema_registry_jmxexporter_config_source_path: /home/ubuntu/jmx-monitoring-stacks/shared-assets/jmx-exporter/confluent_schemaregistry.yml
    kafka_connect_jmxexporter_config_source_path: /home/ubuntu/jmx-monitoring-stacks/shared-assets/jmx-exporter/kafka_connect.yml
    kafka_rest_jmxexporter_config_source_path: /home/ubuntu/jmx-monitoring-stacks/shared-assets/jmx-exporter/confluent_rest.yml
    ksql_jmxexporter_config_source_path: /home/ubuntu/jmx-monitoring-stacks/shared-assets/jmx-exporter/confluent_ksql.yml

Do not forget to rerun your Ansible playbook.

## Apply the Ansible script

All the information Ansible needed is stored in your inventory file hosts,yml.

Simply point the playbook in this repository to your inventory file

    ansible-playbook -i /path/to/hosts.yml playbook.yml

This will install Prometheus and Grafana for you and provision these 
to talk to your Confluent Cluster and interlink both instances by configuring Grafana to 
use your Prometheus instances as a datasource.

There are some dashboards preloaded in a Confluent folder to get you started.

More dashboards can be found in https://github.com/confluentinc/jmx-monitoring-stacks.


