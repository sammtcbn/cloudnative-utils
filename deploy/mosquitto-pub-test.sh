#!/bin/bash
mosquitto_pub -h 127.0.0.1 -p 8080 -t mytopic -d -m hello
