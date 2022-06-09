output "prometheus-ip" {
  description = "Public IP of the prometheus instance"
  value = aws_instance.prometheus.public_ip
}

output "grafana-ip" {
  description = "Public IP of the grafana instance"
  value = aws_instance.grafana.public_ip
}

