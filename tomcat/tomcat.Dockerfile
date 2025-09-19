FROM tomcat:8-jre8-openjdk-slim

ENV MEM_OPTS="-Xmx4g -Xms256m"
ENV GRADLE_OPTS="-server $MEM_OPTS -XX:+UseParallelGC -XX:SoftRefLRUPolicyMSPerMB=1 -XX:MaxHeapFreeRatio=99 -Dorg.gradle.daemon=false"
ENV JAVA_OPTS="$JAVA_OPTS -Dorg.apache.el.parser.SKIP_IDENTIFIER_CHECK=true $MEM_OPTS -XX:+UseParallelGC -XX:SoftRefLRUPolicyMSPerMB=1 -XX:MaxHeapFreeRatio=99"

# Intermine seems to need this to deploy.
RUN cp -avT $CATALINA_HOME/webapps.dist/manager $CATALINA_HOME/webapps/manager

COPY ./configs/* /usr/local/tomcat/conf/
COPY ./configs/web_context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml

# --- New additions ---
# Install netcat and other necessary utilities for the health check script.
RUN apt-get update && apt-get install -y netcat-traditional && rm -rf /var/lib/apt/lists/*

# Copy the custom entrypoint script into the container
COPY docker-entrypoint.sh /usr/local/bin/

# Make the script executable
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Set the new entrypoint
ENTRYPOINT ["docker-entrypoint.sh"]
