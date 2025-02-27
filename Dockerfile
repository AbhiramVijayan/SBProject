FROM maven:3.5.2-jdk-8-alpine AS MAVEN_BUILD
COPY pom.xml /build/
COPY src /build/src/
WORKDIR /build/
RUN mvn package
FROM openjdk:16-jdk-alpine
WORKDIR /app
CMD cd /app
# COPY --from=MAVEN_BUILD /build/target/docker-boot-intro-0.1.0.jar /app/
# ENTRYPOINT ["java", "-jar", "docker-boot-intro-0.1.0.jar"]