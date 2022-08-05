#!/bin/bash

KUBERNETES_HOSTNAMES=kubernetes,kubernetes.default,kubernetes.default.svc,kubernetes.default.svc.cluster,kubernetes.svc.cluster.local

cat > kubernetes-csr.json <<EOF
{
  "CN": "kubernetes",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "PL",
      "L": "Poland",
      "O": "Kubernetes",
      "OU": "Kubernetes The Hard Way",
      "ST": "WLKP"
    }
  ]
}
EOF

for i in 1 2 3
do
    hostnames=k8s_n${i}.local.pl" "${hostnames}
    hostips=$(nslookup k8s_n${i}.local.pl 192.168.50.51 | grep Address | grep -v "#" | cut -d' ' -f2)" "${hostips}

done

hostnames=$(echo ${hostnames} | tr ' ' ,)
hostips=$(echo ${hostips} | tr ' ' ,)

cfssl gencert \
  -ca=ca.pem \
  -ca-key=ca-key.pem \
  -config=ca-config.json \
  -hostname=${hostnames},${hostips},${KUBERNETES_HOSTNAMES},127.0.0.1 \
  -profile=kubernetes \
  kubernetes-csr.json | cfssljson -bare kubernetes