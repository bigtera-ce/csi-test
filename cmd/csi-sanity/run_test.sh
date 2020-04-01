#!/bin/bash
csitype=$1
pod=$2
container=csi-${csitype}plugin

files="csi-sanity $csitype.sec $csitype.param"

for f in $files; do
	kubectl cp $f $pod:/tmp/ -c $container
done

kubectl exec $pod -c $container -- /tmp/csi-sanity --csi.endpoint=unix:///csi/csi.sock --ginkgo.v --ginkgo.failFast -ginkgo.trace --csi.secrets=/tmp/${csitype}.sec --csi.testvolumeparameters=/tmp/${csitype}.param
kubectl logs $pod -c $container > test-${csitype}.log
