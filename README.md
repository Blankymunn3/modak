# 모닥 (Modak) - 캠핑 앱

Flutter로 개발된 캠핑 애호가들을 위한 앱입니다. MVVM 아키텍처 패턴을 사용하여 구조화되었습니다.

## 프로젝트 구조

### MVVM 아키텍처
이 프로젝트는 MVVM(Model-View-ViewModel) 패턴을 적용하여 관심사의 분리와 테스트 가능성을 높였습니다.

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
├── services/         # 데이터 서비스 (API, 로컬 저장소)
│   ├── camping_service.dart
│   └── journal_service.dart
└── main.dart         # 앱 진입점 및 의존성 주입 설정
```

### 주요 기능
- **홈**: 인기 캠핑 스팟 및 최근 기록 보기
- **지도**: 캠핑 스팟 지도 표시 및 필터링
- **기록**: 캠핑 기록 작성 및 관리
- **모닥불**: 커뮤니티 기능 (준비 중)
- **내 정보**: 사용자 프로필 관리 (준비 중)

### 사용된 기술 스택
- **Flutter**: UI 프레임워크
- **Provider**: 상태 관리
- **MVVM Pattern**: 아키텍처 패턴
- **Dependency Injection**: 의존성 주입

### 의존성 관리
앱은 Provider를 사용하여 의존성 주입을 구현합니다:
- Service Layer: 데이터 로직 담당
- ViewModel Layer: 비즈니스 로직 및 상태 관리
- View Layer: UI 렌더링

## 개발 환경 설정

### 요구사항
- Flutter SDK (3.9.2 이상)
- Dart SDK
- Android Studio 또는 VS Code

### 설치 및 실행
```bash
# 프로젝트 클론
git clone [repository-url]
cd modak

# 의존성 설치
flutter pub get

# 앱 실행 (디버그 모드)
flutter run

# 빌드 (릴리스 모드)
flutter build apk --release
```

### 코드 분석
```bash
# 코드 품질 검사
flutter analyze

# 테스트 실행
flutter test
```

## MVVM 패턴 가이드

### Model
데이터 구조를 정의합니다. JSON 직렬화/역직렬화를 포함합니다.

### ViewModel
- `ChangeNotifier`를 상속받아 상태 변화를 알립니다
- 비즈니스 로직을 처리합니다
- Service를 통해 데이터를 가져옵니다

### View
- `Consumer` 위젯을 사용하여 ViewModel의 상태를 구독합니다
- UI 이벤트를 ViewModel 메서드로 전달합니다

### Service
- 데이터 접근 로직을 담당합니다
- API 호출, 로컬 저장소 접근 등을 처리합니다
