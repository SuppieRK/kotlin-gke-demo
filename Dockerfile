# This is a build image - its only purpose is to build the artifact.
FROM gradle as build
# Copy everything ffrom current directory to Docker daemon
COPY . /usr/src/app
# Change workdir for convenience
WORKDIR /usr/src/app
# Build the artifact
RUN gradle build --no-daemon

# This is a result image that we are going to use
FROM openjdk:8-jdk-alpine
# We copy build artifact here
COPY --from=build /usr/src/app/build/libs/*.jar app.jar
# And set our artifact as entrypoint so that Spring app will be launched immediately
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
