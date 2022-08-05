#!/bin/bash

for i in 1 2 3; do
  instance="worker-${i}"
  instance_hostname="k8s_n${i}.local.pl"
  cat > ${instance}-csr.json <<EOF
{
  "CN": "system:node:${instance_hostname}",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "PL",
      "L": "Poland",
      "O": "system:nodes",
      "OU": "Kubernetes The Hard Way",
      "ST": "WLKP"
    }
  ]
}
EOF

internal_ip=$(nslookup k8s_n${i}.local.pl | grep Address | grep -v "#" | cut -d' ' -f2)

  cfssl gencert \
    -ca=ca.pem \
    -ca-key=ca-key.pem \
    -config=ca-config.json \
    -hostname=${instance_hostname},${internal_ip} \
    -profile=kubernetes \
    worker-${i}-csr.json | cfssljson -bare worker-${i}
done