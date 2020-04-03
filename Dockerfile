#
# Dockerfile to create a jmeter-server image.
#
# Usage:
#  docker run -d \
#             -p 0.0.0.0:port-on-host:1099 \
#             -p 0.0.0.0:some-other-port-on-host:60000 \
#             -v /some/local/path:/logs \
#             -v /some/other/local/path:/input-data \
#             ssankara/jmeter-server
#
# TODO - Currently exposed ports are hard-coded to use values that are in the jmeter.properties.
#        It would be nice to be able to parameterize the port numbers.
#
FROM ordnancesurvey/jmeter-base:v2.0
MAINTAINER mark.meany@os.uk

ADD jmeter.properties /var/lib/apache-jmeter-$JMETER_VERSION/bin/

# Expose access to logs & data files
VOLUME [ "/logs" ]
VOLUME [ "/input-data" ]

# Expose jmeter-server's port (values dicated by those specified in jmeter.properties.
# EXPOSE 1099 60000

# Run jmeter-server
ENTRYPOINT [ "/var/lib/apache-jmeter/bin/jmeter-server" ]
