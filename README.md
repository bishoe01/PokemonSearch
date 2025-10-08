# designPattern

AppleAcademy@Postech Challenge5 - 포켓몬 검색 앱

## 프로젝트 개요
포켓몬 API를 활용한 간단한 검색 앱입니다. 포켓몬 이름으로 검색하면 기본 정보와 이미지, 소리를 확인할 수 있습니다.

## 주요 기능
- 포켓몬 이름으로 검색
- 포켓몬 정보 표시 (이름, ID, 타입, 이미지)
- 포켓몬 울음소리 재생

## 기술 스택
- SwiftUI
- MVVM 아키텍처
- URLSession 네트워킹
- AVFoundation 오디오 재생

## 프로젝트 구조
```
c5/
├── App/           # 앱 진입점 및 코디네이터
├── Models/        # 도메인 모델 및 DTO
├── Networking/    # API 통신
├── ViewModel/     # 비즈니스 로직
├── Views/         # UI 컴포넌트
└── Services/      # 오디오 관리 서비스
```
