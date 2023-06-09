{
  apiVersion: 'apps/v1',
  kind: 'Deployment',
  metadata: {
    name: 'grafana',
  },
  spec: {
    selector: {
      matchLabels: {
        name: 'grafana',
      },
    },
    template: {
      metadata: {
        labels: {
          name: 'grafana',
        },
      },
      spec: {
        containers: [
          {
            image: 'grafana/grafana',
            name: 'grafana',
            ports: [{
              containerPort: 3000,
              name: 'ui',
            }],
          },
        ],
      },
    },
  },
}
