#!/bin/bash

# 실행된 위치를 찾아 절대 경로를 정의합니다.
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
PROJECT_ROOT=$(realpath "$SCRIPT_DIR/..")

if [ "$EUID" -ne 0 ]; then
  echo "❌ 이 스크립트는 관리자 권한으로 실행되어야 합니다. 'sudo'를 사용하여 다시 시도해주세요."
  exit 1
fi

echo "🛠️ 시스템 패키지 목록을 갱신합니다..."
if ! apt update -y; then
  echo "❌ 패키지 목록 갱신에 실패했습니다. 네트워크 연결을 확인해 주세요."
  exit 1
fi

echo "🛠️ 실습에 필요한 네트워크 도구들을 설치합니다: dnsutils, tcpdump, curl"
if ! apt install -y dnsutils tcpdump curl; then
  echo "❌ 필수 패키지 설치에 실패했습니다. 오류 로그를 확인해 주세요."
  exit 1
fi
echo "✅ 패키지 설치가 완료되었습니다!"

echo "🛠️ 모든 실습 스크립트에 실행 권한을 부여합니다..."
if ! chmod +x "$PROJECT_ROOT"/scripts/*.sh; then
  echo "❌ 스크립트 실행 권한 부여에 실패했습니다."
  echo "⚠️ 경로를 다시 확인하거나, 스크립트 파일이 존재하는지 확인해 주세요."
  exit 1
fi
echo "✅ 실행 권한 부여 완료!"