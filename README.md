# net-playground

## 개발 환경
💡 macOS 또는 Windows 사용자는 Docker 컨테이너 내부에서 실습을 진행하는 것을 권장합니다.  

- Linux (Ubuntu 20.04 이상)
- Docker Desktop (macOS/Windows에서 테스트 시)
- bash 셸

도커 볼륨 마운트 예시:
```bash
docker run -it --rm \
--cap-add=NET_ADMIN \
-v "$(pwd)":/workspace \
ubuntu bash
```

실행 후, 컨테이너 내부에서 다음 명령어로 환경을 구성합니다:
```bash
bash /workspace/scripts/set-up-linux.sh
```

💡 참고: 일부 Docker 환경에서는 기본 DNS 서버(`192.168.x.x`)가 DNS trace를 제대로 처리하지 못할 수 있습니다.  
NetPlayground는 이러한 상황을 고려해 Google DNS(8.8.8.8)를 기본으로 사용합니다.

## 디렉토리 구조 설명
- /scripts: 실습 자동화 스크립트
- /docs: 실습에 대한 해설과 결과 예시
- /output: 사용자가 생성하게 될 로그 파일이나 추적 결과 보관용


## 브랜치 전략

- `main`: 릴리스용 안정 버전, changelog 및 배포 기준
- `dev`: 개발 통합 브랜치
- `feature/*`: 기능 단위 개발 브랜치
- Conventional Commits 방식 사용