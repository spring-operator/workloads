export SPRING_PROFILES_ACTIVE=Cloud
export VCAP_APPLICATION='{"application_name":demo}'
export VCAP_SERVICES=$(cat src/main/resources/singleNode.json)

# Use these JAva_ARGS to use key-store.p12 which does not have the server's cA certificate
# JAVA_ARGS=" -Djavax.net.ssl.trustStoreType=PKCS12 -Djavax.net.ssl.trustStore=/tmp/docker-test/key-store.p12  -Djavax.net.ssl.trustStorePassword=roboconf"

# Use these Java_ARgs to use trust-store.p12 which does have the server's CA certificate
JAVA_ARGS=" -Djavax.net.ssl.trustStoreType=PKCS12 -Djavax.net.ssl.trustStore=/tmp/docker-test/trust-store.p12  -Djavax.net.ssl.trustStorePassword=roboconf"

java $JAVA_ARGS -jar target/resilient-spring-rabbitmq-0.0.1-SNAPSHOT.jar
