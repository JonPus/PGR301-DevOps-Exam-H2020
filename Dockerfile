FROM maven:3.6-jdk-11 as builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn package -DskipTests

FROM openjdk:8-jdk-alpine
COPY --from=builder /app/target/*.jar /app/pgr301-exam-monsters.jar/
ENTRYPOINT ["java","-jar","/app/pgr301-exam-monsters.jar"]