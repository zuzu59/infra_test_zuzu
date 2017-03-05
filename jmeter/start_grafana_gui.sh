#!/bin/bash
#zf161107.1419

/Users/zuzu/jmeter/bin/jmeter -t memento_grafana.jmx -j jmeter1.log &
sleep 3
/Users/zuzu/jmeter/bin/jmeter -t po_grafana.jmx -j jmeter2.log &
sleep 3
/Users/zuzu/jmeter/bin/jmeter -t plan_grafana.jmx -j jmeter3.log &
sleep 3
/Users/zuzu/jmeter/bin/jmeter -t wwwepfl_grafana.jmx -j jmeter4.log &
sleep 3
/Users/zuzu/jmeter/bin/jmeter -t moi_grafana.jmx -j jmeter5.log &
sleep 3
/Users/zuzu/jmeter/bin/jmeter -t media_grafana.jmx -j jmeter6.log &


