#!/bin/bash
test $(curl 192.168.56.20:8765/sum?a=1\&b=2) -eq 3
