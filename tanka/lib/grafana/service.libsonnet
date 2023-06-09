{
  apiVersion: 'v1',
  kind: 'Service',
  metadata: {
    labels: {
      name: 'grafana',
    },
    name: 'grafana',
  },
  spec: {
    ports: [{
      name: 'grafana-ui',
      port: 3000,
      targetPort: 3000,
    }],
    selector: {
      name: 'grafana',
    },
    type: 'NodePort',
  },
}
