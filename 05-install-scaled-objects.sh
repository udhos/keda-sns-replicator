#!/bin/bash

cat config/queues.txt | while read i; do
    set -- $i
    queue=$1
    topic=$2
    echo queue=$queue topic=$topic
    sed -e "s/{{queue}}/$queue/g" -e "s/{{topic}}/$topic/g" < config/scaled-object.yaml > tmp-scaled-object-$queue.yaml
    kubectl apply -f tmp-scaled-object-$queue.yaml
done
