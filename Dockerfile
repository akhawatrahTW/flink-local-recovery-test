FROM akhawatrahtw/apache-flink:1.15-SN
RUN mkdir -p $FLINK_HOME/usrlib
RUN cp /opt/flink/examples/streaming/StateMachineExample.jar $FLINK_HOME/usrlib/StateMachineExample.jar
RUN mkdir /opt/flink/plugins/s3-fs-presto && \
    cp /opt/flink/opt/flink-s3-fs-presto-1.15-SNAPSHOT.jar /opt/flink/plugins/s3-fs-presto/
