local grafanaDeploy = import '../../lib/grafana/deployment.libsonnet';
local grafanaSvc = import '../../lib/grafana/service.libsonnet';

local promDeploy = import '../../lib/prometheus/deployment.libsonnet';
local promSvc = import '../../lib/prometheus/service.libsonnet';

{
  // Grafana
  grafana: {
    deployment: grafanaDeploy,
    service: grafanaSvc,
  },

  // Prometheus
  prometheus: {
    deployment: promDeploy + {
      spec+: {
        replicas: 1,
      },
    },
    service: promSvc,
  },
}
