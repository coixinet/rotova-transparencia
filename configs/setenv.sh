CATALINA_OPTS="$CATALINA_OPTS -server -Dfile.encoding=UTF8 -Xms4096m -Xmx4096m -Xms1g -Xmx4g -XX:NewSize=200m -XX:MaxNewSize=200m -XX:-UseGCOverheadLimit -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -XX:SurvivorRatio=20 -XX:ParallelGCThreads=2 -Djava.net.preferIPv4Stack=true"
JAVA_OPTS="-Xms4096m -Xmx4096m"
