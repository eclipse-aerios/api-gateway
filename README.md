# Getting stated / Use
This repository contains the configuration and installation material of the aeriOS Domain API Gateway, which is based on [KrakenD](https://github.com/krakend/krakend-ce).

There are 2 possible installations

1. Helm Chart (Recommended)
2. Docker 

Should work with other K8s cluster environments with modifications to the KrakenD configuration file, see more in testing.

**Requirement**: Keycloak needs to be previously installed in order to access the protected endpoints.

## How to build, install, or deploy it
This section will cover the 2 ways of installing KrakenD in your deployment. For help creating custom endpoints see the `Values` section. You can also use the file in `helm-chart/` as a template.

#### 1. Helm Chart Installation (Recommended)

Once you have access to the desired K8s cluster, use the command `helm` to install KrakenD. 

**Please note** that you'll need to provide a custom `values.yaml` file. More info on that in the "Endpoints" section down below.

You can install it from the Eclipse aeriOS Helm chart repository by running the following command:

```
helm install api-gateway eclipse-aerios/api-gateway -f <path_to_values.yaml> --debug
```

If you cloned this repository from the root folder of the ``api-gateway`` cloned repo:

```
helm install api-gateway ./helm-chart/ -f <path_to_values.yaml> --debug
```

#### 2. Docker installation

For this installation, please check first the content of the ``krakend.json`` file and then simply execute the `docker compose up -d` command from the root folder of the ``api-gateway`` cloned repo.

**Please note** if you want to enable tls communications uncomment the lines below ``enable TLS`` and comment the lines below ``No TLS``.

## Testing
First, verify the correct installation with the following command:
```
kubectl get all
```
If both the service and deployment are running you can test the deployment by making a petition to Keycloak to retrieve a user token:
```
curl --location --request POST 'https://keycloak.aerios-project.eu/auth/realms/keycloak-realm/protocol/openid-connect/token' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'grant_type=password' \
--data-urlencode 'client_id=CLIENT' \
--data-urlencode 'client_secret=SECRET' \
--data-urlencode 'username=USER' \
--data-urlencode 'password=PASSWORD'
```
**Please note** that you'll have to change the `CURL` command to fit your requirements.
Once you have the user token you'll have to send it as a header to the desired endpoint. A list of the currently enabled endpoints is:

```
/orionld/ngsi-ld/v1/entities/{entityId}/attrs/{attrId}
PATCH
--
/orionld/ngsi-ld/v1/entities/{entityId}
PATCH
--
/orionld/ngsi-ld/v1/entities/{entityId}
DELETE
--
/orionld/ngsi-ld/v1/entities/{entityId}/attrs/{attrId}
DELETE
--
/orionld/ngsi-ld/v1/subscriptions/{subscriptionId}
DELETE
--
/hlo_fe/services/{service_id}
GET
--
/hlo_fe/services/{service_id}
POST
--
/hlo_fe/services/{service_id}
DELETE
--
/hlo_fe/services/{service_id}/purge
DELETE
--
/hlo_fe/services/{service_id}
PUT
--
/hlo_al/services/{service_id}
POST
--
/hlo_al/services/{service_id}/overlay
DELETE
--
/hlo_al/services/{service_id}/service_components/{service_component_id}/
PUT
--
/hlo_al/services/{service_id}/service_components/{service_component_id}/
GET
--
/hlo_al/services/{service_id}/service_components/{service_component_id}/
DELETE
--
/orionld/ngsi-ld/v1/entities
GET
--
/orionld/ngsi-ld/v1/entities/{entityId}
GET
--
/entities
GET
--
/entityOperations/create
POST
--
/entityOperations/merge
POST
--
/jsonldContexts
GET
--
/jsonldContexts
POST
--
/entities/{entityId}/attrs/{attrId}
DELETE
--
/entities/{entityId}/attrs/{attrId}
PATCH
--
/entities/{entityId}/attrs/{attrId}
PUT
--
/csourceSubscriptions
GET
--
/csourceSubscriptions
POST
--
/entityOperations/upsert
POST
--
/types/{type}
GET
--
/entityOperations/query
POST
--
/csourceSubscriptions/{subscriptionId}
DELETE
--
/csourceSubscriptions/{subscriptionId}
GET
--
/csourceSubscriptions/{subscriptionId}
PATCH
--
/entityOperations/delete
POST
--
/entityOperations/update
POST
--
/jsonldContexts/{contextId}
DELETE
--
/jsonldContexts/{contextId}
GET
--
/subscriptions
POST
--
/subscriptions
GET
--
/csourceRegistrations
GET
--
/csourceRegistrations
POST
--
/subscriptions/{subscriptionId}
DELETE
--
/subscriptions/{subscriptionId}
GET
--
/subscriptions/{subscriptionId}
PATCH
--
/attributes/{attrId}
GET
--
/entities
POST
--
/entities/{entityId}
PATCH
--
/entities/{entityId}
PUT
--
/entities
DELETE
--
/entities/{entityId}
DELETE
--
/entities/{entityId}
GET
--
/entities/{entityId}/attrs
POST
--
/attributes
GET
--
/types
GET
--
/csourceRegistrations/{registrationId}
DELETE
--
/csourceRegistrations/{registrationId}
GET
--
/csourceRegistrations/{registrationId}
PATCH
--
/orionld/ex/v1/notify
POST
--
/orionld/ex/v1/notification/{subscriptionId}
POST
--
/federator/health
GET
--
/federator/v1/domains
GET
--
/federator/v1/domains
POST
--
/federator/v1/domains/local
GET
--
/federator/v1/domains/local
DELETE
--
/federator/v1/domains/{domainName}
DELETE
--
/iota_api
POST
--
/dataProducts
GET
--
/dataProducts/{dataProductId}
GET
--
/dataProducts
DELETE
--
/dataProducts/{dataProductId}
DELETE
--
/dataProducts
POST
--
/dataCatalog
POST
--
/dataCatalog/{dataProductId}
DELETE
```

Some additional endpoints can be configured for each domain's Infrastructure Element as long as the internal IP of the IEs can be reached by the IE that runs KrakenD.

Self-API endpoints:

```
/{ieShortID}/{selfModule}...
{METHOD}
```

For instance:

```
/fa163e5e25ef/security/events
GET
```

or 

```
/fa163e5e25ef/orchestrator/rules
POST
```

To run IE CPU or network Benchmarks:

```
/{ieShortID}/benchmark/v1/{benchmarkType}
POST
```

For instance:

```
/fa163e5e25ef/benchmark/v1/cpu
POST
```

## Tutorial

This section will cover how to manually add new endpoints to your deployment, as well as how to edit the configuration without breaking anything. We will be using the `helm` installation as a template, but the basis applies to all three installations. 

**Please note** we will not cover the entire `helm` deployment and its configuration or all of its fields such as the `ingress` section. You can enable the default Ingress from the `values.yaml` file by enabling it in the `ingress` section, however we feel like this is too much a private part of the pilots deployment to cover it reliably. 

The two relevant files for the Helm installation are `./helm/values.yaml` and `./helm/templates/_endpoints.tpl`.

#### Values 

This file contains all variables that are used in the deployment, the five relevant sections are:

```yaml
krakend:
...
  service:
    type: NodePort
    ports:
    api:
      port: 8080
      targetPort: 8080
      containerPort: 8080
      nodePort: ""
      protocol: TCP
  
  config:
    benchmarkPort: 3000
    disableHealthEndpoint: false
    federatorUrl: http://federator.default.svc.cluster.local:8050
    hloAllocatorUrl: http://hlo-allocator-service.default.svc.cluster.local:8082
    hloFeUrl: http://hlo-fe-service.default.svc.cluster.local:8081
    keycloakUrl: https://keycloak.aerios-project.eu
    keycloakRealm: keycloak-openldap
    logLevel: DEBUG
    orionCacheDuration: 3600
    orionUrl: http://orion-ld-broker.default.svc.cluster.local:1026
    selfApiPort: 8600
    sharedCacheDuration: 900
    iotaAPIUrl: http://iota-api:6000
    dataProductManagerUrl: http://data-fabric-data-product-manager.default.svc.cluster.local:8000
    dataCatalogManagerUrl: http://data-fabric-data-catalog-service.default.svc.cluster.local:8080
  
  additionalEndpoints: []

  infrastructureElements: []
  
  tls:
    enabled: false
    existingSecret: ""
    certs:
      cert: <cert.pem>
      key: <key.pem>

```

**service** is where the ports that will be used by KrakenD are set up for Kubernetes.

**config** is where the predetermined values for some of the configuration will be set up. For example you may want to change the Orion URL to the one that fits your deployment, or you may want to set up several custom lists for the allowed roles and headers. Everything here must follow the parameters of Helm.

**additionalEndpoints** is where every new endpoint you wish to add must be located, all new endpoints must follow the structure set by the example explained below:

<pre>
- endpoint:  - <b>The exact string resource URL you want to expose</b>
  method - <b>The method supported by this endpoint</b>
  roles: - <b>Array: only tokens matching one of the roles here will be allowed through (Optional)</b>
  queryStrings: - <b>Array: only query strings listed here will be allowed though into the backend (To allow all query strings add a single "*" element -wildcard- in the array)</b>
  inputHeaders: - <b>Array: only headers listed here will be allowed though into the backend (To allow all headers add a single "*" element -wildcard- in the array)</b>
  backend:
    url: - <b>The path inside the service (no protocol, no host, no method)</b>
    method: - <b>The method supported by the backend</b>
    host - <b>The host that will be receiving the petitions</b>
</pre>

For instance:

```yaml
- endpoint: /test/information
  method: GET
  roles:
    - DomainAdministrator1
    - CustomRole2
  queryStrings:
    - "*"
  backend:
    url: /placeholder/custom/backend
    method: GET
    host: http://192.168.250.1:8080
  inputHeaders:
    - Accept
    - Authorization
- endpoint: /test/anotherendpoint
  method: POST
  roles:
    - DomainAdministrator
    - VerticalDeployer
  queryStrings:
    - q
    - testq
  backend:
    url: /placeholder/custom/backend
    method: PATCH
    host: https://orion-broker-url:1026
  inputHeaders:
    - X-Auth-Token
    - Authorization
    - Content-Type
```

**infrastructureElements** is where Infrastructure Elements can be manually configured to redirect some predefined endpoints (e.g. Benchmarking, Self-API...) to APIs exposed in the target IE. The mandatory requirement is that **the internal IP of the IEs must be reachable by the IE that runs KrakenD**. All the configured IEs must follow this structure:

<pre>
- id:  - <b>the unique part of the IE entity ID</b>, for instance, if the entity ID is *urn:ngsi-ld:InfrastructureElement:CloudFerro:fa163e5e25ef*, the value of the *id* would be *fa163e5e25ef*
  internalIp: - <b>Internal IP of the Infrastructure Element</b>
</pre>

For instance:

```yaml
- id: fa163e5e256ef
  internalIp: 10.0.0.152
- id: fa163e24c6ee
  internalIp: 10.0.0.218
```

**tls** enables the option to make https requests to the api-gateway without the need for an intermediate proxy. It uses self-signed certificates by default through kubernetes secrets and supports local certificates.

<pre>
- enabled: <b>false/true for enabling tls requests</b>
- existingSecret: <b>If you already have your own secret with your local certificates put their name in this field and it will overwrite to the default certificates </b>
- certs: <b>Another way to overwrite the default self-signed certificates are putting the <i>cert.pem</i> and <i>key.pem</i> encoded in base64 format in the cert and key fields, respectively. (example: <i>cat key.pem | base64</i>) </b>
</pre>
