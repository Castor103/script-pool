#!/bin/bash

# [1. 잠자기 완전 비활성화 (배터리 & 전원 어댑터 둘 다 적용)]
sudo pmset -a sleep 0           # -a 옵션은 배터리 및 전원 연결 상태 모두 적용
sudo pmset -a disablesleep 1    # disablesleep 1로 완전히 잠자기 방지
sudo pmset -a hibernatemode 0   # hibernatemode 0은 최대 절전 모드 방지

# [2. 디스플레이 및 하드디스크 절전 방지]
sudo pmset -a displaysleep 0    # 화면이 꺼지지 않도록 설정
sudo pmset -a disksleep 0       # 하드디스크가 절전 모드로 들어가지 않도록 설정

# [3. AC 전원 상태에서만 동작하는 설정 (테스트 환경이 유선 전원이라면 적용)]
#   -c 옵션은 AC 전원 상태에서만 적용됨
sudo pmset -c sleep 0
sudo pmset -c displaysleep 0
sudo pmset -c disksleep 0

# [4. 자동 로그아웃 방지]
#   시스템 설정에서 자동 로그아웃이 활성화되어 있으면, 일정 시간 후 세션이 종료될 수 있어.
#   설정을 비활성화하려면:
#   시스템 설정 → 보안 및 개인정보 보호 → 고급 설정 → "비활성 상태 시 자동 로그아웃" 해제

# [5. 터미널에서 caffeinate 명령어 실행 (추가 보완용)]
caffeinate -d -i -s -u &
# -d : 디스플레이 꺼짐 방지
# -i : 시스템 잠자기 방지
# -s : 시스템이 절대 잠자기 모드로 가지 않음
# -u : 사용자 활동 유지
