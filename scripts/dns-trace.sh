#!/bin/bash

source "$(dirname "$0")/common.sh"

DOMAIN=${1:-example.com}
SCRIPT_DIR=$(dirname "$0")
PROJECT_ROOT=$(realpath "$SCRIPT_DIR/..")
OUTPUT_DIR="$PROJECT_ROOT/output"
mkdir -p "$OUTPUT_DIR"

OUTPUT="$OUTPUT_DIR/dns-trace-$(date +%Y%m%d%H%M%S).log"

echo "🛠️ DNS trace 실습 시작: $DOMAIN"
echo "💾 출력 결과는 $(basename "$OUTPUT") 에 저장됩니다."
echo

# 실행 및 결과 코드 저장
DIG_TRACE "$DOMAIN" | tee "$OUTPUT"
EXIT_CODE=${PIPESTATUS[0]}  # dig 결과 코드 확인

echo

# 성공 여부 분기 처리
if [ "$EXIT_CODE" -eq 0 ]; then
  echo "✅ 실습 완료: $DOMAIN 의 DNS 질의 흐름이 성공적으로 추적되었습니다."
else
  echo "❌ 실습 실패: $DOMAIN 의 DNS 질의 중 오류가 발생했습니다."
  echo "📄 출력 로그: $OUTPUT"
fi
