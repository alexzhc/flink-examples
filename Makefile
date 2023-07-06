local-up:
	docker compose up -d

local-down:
	docker compose down -d

operator-up:
	helm upgrade --install flink-kubernetes-operator \
		./operator \
		--namespace flink --create-namespace \
		--set image.repository=docker.m.daocloud.io/apache/flink-kubernetes-operator \
		--set image.tag=1.4.0 \
		--set watchNamespaces={flink}

operator-down:
	helm uninstall -n flink flink-operator

build:
	docker build . -t daocloud.io/daocloud/flink-examples:1.17.0; \
	docker push $$_