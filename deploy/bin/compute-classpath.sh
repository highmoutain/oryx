#!/usr/bin/env bash

# Copyright (c) 2014, Cloudera, Inc. All Rights Reserved.
#
# Cloudera, Inc. licenses this file to you under the Apache License,
# Version 2.0 (the "License"). You may not use this file except in
# compliance with the License. You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# This software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for
# the specific language governing permissions and limitations under the
# License.

# This is a hacky means to plug in to the versions of libraries used on the cluster
# rather than ship a particular version with the binaries.
# TODO: we need a better solution to dependencies

# CDH specific classpath config

function printLatest() {
  ls -1 /home/hadoop/spark-2.1.1-bin-hadoop2.7/jars/$1 2>/dev/null | grep -vE "(tests|sources).jar$" | tail -1
}

# This only supports the Serving Layer, which needs Hadoop, Kafka, and ZK dependencies
printLatest "scala-library-*.jar"
printLatest "scala-parser-*.jar"
printLatest "kafka_*.jar" 
printLatest "kafka-clients*.jar" 
printLatest "metrics-core*.jar" 
printLatest "zkclient-*.jar" 
printLatest "zookeeper-*.jar"
printLatest "hadoop-auth-*.jar"
printLatest "hadoop-common-*.jar"
printLatest "hadoop-hdfs-2*.jar"
printLatest "commons-cli-1*.jar"
printLatest "commons-collections-*.jar"
printLatest "commons-configuration-*.jar"
printLatest "protobuf-java-*.jar"
printLatest "snappy-java-*.jar"

# These are needed for submitting the serving layer in YARN mode
printLatest "hadoop-yarn-applications-distributedshell-*.jar"
