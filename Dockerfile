# The goal of this image is provide access to sbt as building tool for cfpb scala projects.
# It includes jdk 1.8, sbt 0.13.13 and git software packages

FROM java:8

ENV SBT_VERSION  0.13.13

RUN \
  curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt && \
  sbt

VOLUME [ "/io" ]

RUN apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Define working directory
WORKDIR /io

ENTRYPOINT ["sbt"]