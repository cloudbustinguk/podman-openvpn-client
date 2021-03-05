# OpenVPN Client - using rootful podman

Super simple openvpn pod-based client.

Original idea by [ekristen](https://github.com/ekristen/docker-openvpn-client), 
and he got it from [dperson](https://github.com/dperson/openvpn-client).

I wanted one for podman, and to rework things slightly.

## Running

1. Copy your VPN config into `conf.d` directory as filename `config`.

```
cp /path/to/openvpn/config ./conf.d/config
```

2. Execute:

```
[dsw@box ~]$ ./run_openvpn_pod 
848f223ff86116e841bf6ca8dd8f03aa9b0f3e4968f553cacf4d0f73b721b6d1
13d45e1e2abe0a8cfc76a8a5c62c651a5624aaf8c4f799d777bf35258ab371c5
OpenVPN Pod is Running
=====================================================================================
POD ID        NAME     STATUS   CREATED                 # OF CONTAINERS  INFRA ID
848f223ff861  openvpn  Running  Less than a second ago  2                4ffbb2332db6
=====================================================================================
==== vpn-client log ====
Fri Mar  5 17:03:39 2021 VERIFY OK: depth=1, O=MegaCorp, CN=MGMT.vpn.ca
Fri Mar  5 17:03:39 2021 VERIFY KU OK
Fri Mar  5 17:03:39 2021 Validating certificate extended key usage
Fri Mar  5 17:03:39 2021 ++ Certificate has EKU (str) TLS Web Server Authentication, expects TLS Web Server Authentication
Fri Mar  5 17:03:39 2021 VERIFY EKU OK
Fri Mar  5 17:03:39 2021 VERIFY OK: depth=0, O=MegaCorp, CN=MGMT.vpn.server
Fri Mar  5 17:03:39 2021 Control Channel: TLSv1.2, cipher TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384, 2048 bit RSA
Fri Mar  5 17:03:39 2021 [MGMT.vpn.server] Peer Connection Initiated with [AF_INET]18.123.231.123:443

Start a shell in this pod, for example - to verify your VPN NAT'd IP:
  podman run -it --rm --pod openvpn --name my-vpn-ip centos curl -w '\n' -s https://api.my-ip.io/ip

[dsw@box ~]$
```

3. Now you can create any container inside the VPN-enabled pod, or launch an entire workload inside it, just be sure to include `--pod openvpn`
to `podman run`.

## Stopping

Just execute:

```
[dsw@box ~]$ ./stop_and_remove_pod 
12f189b076fb7476ee2dc62c97bd2e7155f10f63b3fba5a3a177fe08c9544d7f
12f189b076fb7476ee2dc62c97bd2e7155f10f63b3fba5a3a177fe08c9544d7f
OpenVPN Pod is Stopped
[dsw@box ~]$ 
```
