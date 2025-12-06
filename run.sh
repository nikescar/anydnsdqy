#!/usr/bin/env bash

# RUST_LOG=debug cargo run -- @1.1.1.1 -b 127.0.0.1:25454
# RUST_LOG=debug cargo run -- @https://cloudflare-dns.com/dns-query --doh -b 127.0.0.1:25454

# dnsmasq --no-daemon --dnssec-debug --domain-needed --bogus-priv --dnssec --dnssec-check-unsigned \
#   --bind-interfaces --no-hosts --cache-size=1000 --no-negcache --local-service --dns-loop-detect --log-queries --log-dhcp \
#   --filterwin2k --strict-order --no-resolv --no-poll --trust-anchor=.,19036,8,2,49AAC11D7B6F6446702E54A1607371607A1A41855200FD2CE1CDDE32F24E8FB5 \
#   --trust-anchor=.,20326,8,2,E06D44B80B8F1D39A95C0B0D7C65D08458E880409BBC683457104237C7F8EC8D \
#   --server=127.0.0.1#25454 --listen-address=127.0.0.1 --port=25353 &
#   # server=1.1.1.1


echo "=== Basic Record Types ==="

echo "A test"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace cloudflare.com

echo "AAAA test"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace -t AAAA cloudflare.com

echo "NS test"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace -t NS cloudflare.com

echo "SOA test"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace -t SOA cloudflare.com

echo "MX test"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace -t MX gmail.com

echo "TXT test"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace -t TXT cloudflare.com

echo "HINFO test"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace -t HINFO hinfo.example.com

echo "SRV test"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace -t SRV _xmpp-server._tcp.jabber.org

echo "LOC test"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace -t LOC cambridge-net.example.com

echo "NAPTR test"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace -t NAPTR 4.4.4.4.2.3.3.2.4.4.1.e164.arpa

echo "=== DNSSEC Record Types ==="

echo "DNSKEY test"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace -t DNSKEY cloudflare.com

echo "RRSIG test"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace -t RRSIG google.com

echo "NSEC test"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace -t NSEC nonexistent.cloudflare.com

echo "CDS test"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace -t CDS cloudflare.com

echo "CDNSKEY test"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace -t CDNSKEY cloudflare.com

echo "=== Security/Encryption Record Types ==="

echo "SSHFP test--"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace -t SSHFP github.com

echo "TLSA test--"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace -t TLSA _443._tcp.www.huque.com

echo "OPENPGPKEY test" # https://blog.ari.lt/b/openpgpkey-records-are-cool/
dig @127.0.0.1 -p 25454 d2efaa6dd6ae6136c19944fae329efd3fb2babe1e6eec26982a422aa._openpgpkey.ari.lt. OPENPGPKEY

echo "SMIMEA test--"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace -t SMIMEA _smimecert.example.com

echo "=== Advanced/Special Record Types ==="

echo "CAA test"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace -t CAA cloudflare.com

echo "URI test"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace -t URI uri.example.com

echo "HIP test"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace -t HIP hip.example.com

echo "SVCB test"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace -t SVCB _1234._bar.example.com

echo "HTTPS test"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace -t HTTPS cloudflare.com

echo "KX test--"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace -t KX kx.example.com

echo "IPSECKEY test--"
delv @127.0.0.1 -p 25454 +yaml +rtrace +vtrace -t IPSECKEY ipseckey.example.com




