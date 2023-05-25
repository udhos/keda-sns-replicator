#!/bin/bash

helm repo add sqs-to-sns https://udhos.github.io/sqs-to-sns

helm repo update

cat config/queues.txt | while read i; do
    set -- $i
    queue=$1
    topic=$2
    echo queue=$queue topic=$topic
    sed -e "s/{{queue}}/$queue/g" -e "s/{{topic}}/$topic/g" < config/values.yaml > tmp-values-$queue.yaml
    helm upgrade sqs-to-sns-$queue sqs-to-sns/sqs-to-sns --install --values tmp-values-$queue.yaml
done
