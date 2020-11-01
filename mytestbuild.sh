#!/bin/ash

docker run -v /home/xtecuan/Projects/myapi-sample/target/myapi-sample-1.0.0-SNAPSHOT-native-image-source-jar:/project:z \
--env LANG=C --user 1000:1000 \
--rm quay.io/quarkus/ubi-quarkus-native-image:20.2.0-java11 \
-J-DCoordinatorEnvironmentBean.transactionStatusManagerEnable=false \
-J-Dsun.nio.ch.maxUpdateArraySize=100 \
-J-Djava.util.logging.manager=org.jboss.logmanager.LogManager \
-J-Dvertx.logger-delegate-factory-class-name=io.quarkus.vertx.core.runtime.VertxLogDelegateFactory \ 
-J-Dvertx.disableDnsResolver=true -J-Dio.netty.leakDetection.level=DISABLED -J-Dio.netty.allocator.maxOrder=1 \ 
-J-Duser.language=en -J-Dfile.encoding=UTF-8 \
-J-Djavax.net.ssl.trustStore=/home/xtecuan/Projects/myapi-sample/src/main/resources/mykeystore.jks  \
-J-Djavax.net.ssl.trustStorePassword=secret \
--initialize-at-build-time= -H:InitialCollectionPolicy=com.oracle.svm.core.genscavenge.CollectionPolicy\$BySpaceAndTime -H:+JNI \
-jar myapi-sample-1.0.0-SNAPSHOT-runner.jar -H:FallbackThreshold=0 -H:+ReportExceptionStackTraces -H:-AddAllCharsets -H:EnableURLProtocols=http,https \
--enable-all-security-services --no-server -H:-UseServiceLoaderFeature -H:+StackTrace \
myapi-sample-1.0.0-SNAPSHOT-runner
