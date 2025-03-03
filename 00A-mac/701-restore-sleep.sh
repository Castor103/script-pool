#!/bin/bash

# [1. 잠자기 설정 원래대로 복원]
sudo pmset -a sleep 1       # 시스템 절전 활성화
sudo pmset -a disablesleep 0 # 잠자기 차단 해제
sudo pmset -a hibernatemode 3 # 최대 절전 모드 기본값 (Mac 기본 설정)

# [2. 디스플레이 및 하드디스크 절전 기본값 복원]
sudo pmset -a displaysleep 10  # 10분 후 디스플레이 절전
sudo pmset -a disksleep 10     # 10분 후 하드디스크 절전

# [3. AC 전원 상태에서 기본값 복원]
sudo pmset -c sleep 1          # AC 전원 연결 시 절전 허용
sudo pmset -c displaysleep 10  # AC 전원 연결 시 10분 후 화면 꺼짐
sudo pmset -c disksleep 10     # AC 전원 연결 시 10분 후 하드디스크 절전

# [4. 자동 로그아웃 설정 수동 확인 필요]
echo "⚠️ 자동 로그아웃 설정은 시스템 환경설정에서 직접 확인하세요."
echo "  시스템 설정 → 보안 및 개인정보 보호 → 고급 설정"

# [5. caffeinate 프로세스 종료]
pkill caffeinate

echo "✅ Mac 절전 설정이 기본값으로 복원되었습니다."
