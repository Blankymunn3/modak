# 모닥 (Modak) - 캠핑 기록 앱

**캠핑 애호가들을 위한 종합 캠핑 관리 애플리케이션**

Flutter와 MVVM 아키텍처를 기반으로 개발된 캠핑 스팟 탐색, 기록 관리, 커뮤니티 기능을 제공하는 앱입니다.

## ✨ 주요 기능

### 🏠 홈
- 인기 캠핑 스팟 추천
- 최근 캠핑 기록 조회
- 빠른 액션 (기록 작성, 스팟 저장)

### 🗺️ 지도
- 캠핑 스팟 지도 표시
- 필터링 기능 (캠핑 타입, 편의시설)
- 현재 위치 기반 탐색

### 📝 기록
- 캠핑 기록 작성 및 관리
- 사진, 날씨, 온도 정보 저장
- 캠핑 유형별 분류 (노지, 캠핑장, 차박, 글램핑, 백패킹)

### 🔥 모닥불
- 캠핑 커뮤니티 기능 (개발 예정)

### 👤 내 정보
- 사용자 프로필 관리 (개발 예정)

## 🏗️ 프로젝트 구조

### MVVM 아키텍처
관심사 분리와 테스트 가능성을 위해 MVVM 패턴을 적용했습니다.

```
lib/
├── models/           # 데이터 모델
│   ├── camping_spot.dart
│   ├── journal_entry.dart
│   ├── user.dart
│   └── filter_settings.dart
├── viewmodels/       # 비즈니스 로직 및 상태 관리
│   ├── main_viewmodel.dart
│   ├── home_viewmodel.dart
│   ├── map_viewmodel.dart
│   └── journal_viewmodel.dart
├── views/            # UI 화면
│   ├── home_screen.dart
│   ├── map_screen.dart
│   ├── journal_screen.dart
│   ├── community_screen.dart
│   └── profile_screen.dart
├── services/         # 데이터 서비스
│   ├── camping_service.dart
│   └── journal_service.dart
├── l10n/            # 다국어 지원
│   ├── app_localizations.dart
│   ├── app_localizations_ko.dart
│   └── app_localizations_en.dart
├── di_container.dart # 의존성 주입 설정
└── main.dart         # 앱 진입점
```

## 🛠️ 기술 스택

- **Flutter** (SDK 3.9.2+) - 크로스플랫폼 UI 프레임워크
- **Provider** - 상태 관리 및 의존성 주입
- **GetIt** - 서비스 로케이터 패턴
- **Flutter Localizations** - 다국어 지원 (한국어/영어)
- **MVVM Pattern** - 아키텍처 패턴

## 🚀 개발 환경 설정

### 요구사항
- Flutter SDK 3.9.2 이상
- Dart SDK
- Android Studio 또는 VS Code

### 설치 및 실행

```bash
# 저장소 클론
git clone https://github.com/Blankymunn3/modak.git
cd modak

# 의존성 설치
flutter pub get

# 앱 실행 (디버그 모드)
flutter run

# 릴리스 빌드
flutter build apk --release
```

### 개발 도구

```bash
# 코드 분석
flutter analyze

# 테스트 실행
flutter test

# 앱 아이콘 생성
flutter packages pub run flutter_launcher_icons:main
```

## 📱 UX/UI 특징

### 스켈레톤 UI
- 로딩 중에도 화면 구조 유지
- 향상된 사용자 경험 제공

### 다국어 지원
- 한국어/영어 지원
- Flutter Localizations 활용

### 반응형 디자인
- Material Design 3 준수
- 다양한 화면 크기 대응

## 🏛️ 아키텍처 가이드

### Model
- 데이터 구조 정의
- JSON 직렬화/역직렬화 지원

### ViewModel
- `ChangeNotifier` 기반 상태 관리
- 비즈니스 로직 처리
- Service 계층과의 데이터 통신

### View
- `Consumer` 위젯으로 ViewModel 구독
- 이벤트를 ViewModel로 전달
- 순수 UI 렌더링만 담당

### Service
- 데이터 접근 계층
- API 통신, 로컬 저장소 관리
- 비즈니스 로직과 분리

### 의존성 주입
- GetIt + Provider 조합
- 테스트 가능한 구조
- 느슨한 결합도 유지

## 📈 개발 상태

- ✅ 기본 앱 구조 및 MVVM 아키텍처 적용
- ✅ 홈, 지도, 기록 화면 구현
- ✅ 다국어 지원 (한국어/영어)
- ✅ 스켈레톤 UI 및 로딩 상태 개선
- 🚧 지도 API 통합
- 🚧 커뮤니티 기능
- 📋 사용자 인증 및 프로필 관리

## 📄 라이선스

이 프로젝트는 개인 프로젝트로 개발되었습니다.
