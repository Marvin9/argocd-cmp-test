{
  apiVersion: 'v1',
  kind: 'Service',
  metadata: {
    labels: {
      name: 'prometheus',
    },
    name: 'prometheus',
  },
  spec: {
    ports: [
      {
        name: 'prometheus-api',
        port: 9090,
        targetPort: 9090,
      },
    ],
    selector: {
      name: 'prometheus',
    },
  },
}
