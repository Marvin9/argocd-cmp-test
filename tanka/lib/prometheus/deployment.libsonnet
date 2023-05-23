{
  apiVersion: 'apps/v1',
  kind: 'Deployment',
  metadata: {
    name: 'prometheus',
  },
  spec+: {
    minReadySeconds: 10,
    replicas: 1,
    revisionHistoryLimit: 10,
    selector: {
      matchLabels: {
        name: 'prometheus',
      },
    },
    template: {
      metadata: {
        labels: {
          name: 'prometheus',
        },
      },
      spec: {
        containers: [
          {
            image: 'prom/prometheus',
            imagePullPolicy: 'IfNotPresent',
            name: 'prometheus',
            ports: [
              {
                containerPort: 9090,
                name: 'api',
              },
            ],
          },
        ],
      },
    },
  },
}
