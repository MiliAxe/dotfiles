#!/bin/bash

sensors | sed -rn 's/.*Package id 0:\s+([^ ]+).*/\1/p'
