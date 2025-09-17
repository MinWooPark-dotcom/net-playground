#!/bin/bash

echo "🔧 패키지 목록 갱신 중..."
apt update -y

echo "📦 DNS 및 네트워크 분석 도구 설치 중..."
apt install -y dnsutils tcpdump curl

echo "✅ 설치 완료!"
echo "사용 가능한 명령어:"
echo " - dig example.com"
echo " - tcpdump -n port 53"
echo " - curl http://example.com"
