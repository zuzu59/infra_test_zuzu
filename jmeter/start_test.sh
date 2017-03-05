#!/bin/bash
#zf161028.1819

jmeter -t memento_20161028_1611.jmx
rm -R memento_20161028_1611.csv toto
jmeter -n -t memento_20161028_1611.jmx -l memento_20161028_1611.csv -e -o ./toto
