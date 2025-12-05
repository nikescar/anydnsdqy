#!/usr/bin/env bash

RUST_LOG=debug cargo run -- @1.1.1.1 -b 127.0.0.1:25454 &

dnsmasq --no-daemon --dnssec-debug --domain-needed --bogus-priv --dnssec --dnssec-check-unsigned \
  --bind-interfaces --no-hosts --cache-size=1000 --no-negcache --local-service --dns-loop-detect --log-queries --log-dhcp \
  --filterwin2k --strict-order --no-resolv --no-poll --trust-anchor=.,19036,8,2,49AAC11D7B6F6446702E54A1607371607A1A41855200FD2CE1CDDE32F24E8FB5 \
  --trust-anchor=.,20326,8,2,E06D44B80B8F1D39A95C0B0D7C65D08458E880409BBC683457104237C7F8EC8D \
  --server=127.0.0.1#25454 --listen-address=127.0.0.1 --port=25353 &
  # server=1.1.1.1
