package com.mycompany.app;

import software.constructs.Construct;
import org.cdk8s.App;
import org.cdk8s.Chart;
import org.cdk8s.ChartProps;
import imports.k8s.Container;
import imports.k8s.ContainerPort;
import imports.k8s.DeploymentSpec;
import imports.k8s.KubeDeployment;
import imports.k8s.KubeDeploymentProps;
import imports.k8s.LabelSelector;
import imports.k8s.ObjectMeta;
import imports.k8s.PodSpec;
import imports.k8s.PodTemplateSpec;
import org.apache.commons.lang3.math.Fraction;

import java.util.Collections;
import java.util.List;
import java.util.Map;

public class Main extends Chart {

    public Main(final Construct scope, final String id, final String appLabel) {
        this(scope, id, null, appLabel);
    }

    public Main(final Construct scope, final String id, final ChartProps props, final String appLabel) {
        super(scope, id, props);

        System.out.println(Fraction.FOUR_FIFTHS);

        Map<String, String> label = Collections.singletonMap("app", appLabel);

        new KubeDeployment(this, "my-deployment", KubeDeploymentProps.builder()
                .spec(DeploymentSpec.builder()
                        .replicas(1)
                        .selector(LabelSelector.builder()
                                .matchLabels(label)
                                .build())
                        .template(PodTemplateSpec.builder()
                                .metadata(ObjectMeta.builder().labels(label)
                                        .build())
                                .spec(PodSpec.builder()
                                        .containers(List.of(Container.builder()
                                                .name("app-container-test")
                                                .image("nginx:1.19.10")
                                                .ports(List.of(ContainerPort.builder()
                                                        .containerPort(80)
                                                        .build()))
                                                .build()))
                                        .build())
                                .build())
                        .build())
                .build());
    }

    public static void main(String[] args) {
        final App app = new App();
        new Main(app, "getting-started", "my-app");
        app.synth();
    }
}
