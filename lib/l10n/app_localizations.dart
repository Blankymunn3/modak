import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ko.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ko'),
  ];

  /// 애플리케이션 제목
  ///
  /// In ko, this message translates to:
  /// **'모닥'**
  String get appTitle;

  /// 홈 탭 라벨
  ///
  /// In ko, this message translates to:
  /// **'홈'**
  String get home;

  /// 지도 탭 라벨
  ///
  /// In ko, this message translates to:
  /// **'지도'**
  String get map;

  /// 기록 탭 라벨
  ///
  /// In ko, this message translates to:
  /// **'기록'**
  String get journal;

  /// 커뮤니티 탭 라벨
  ///
  /// In ko, this message translates to:
  /// **'모닥불'**
  String get community;

  /// 프로필 탭 라벨
  ///
  /// In ko, this message translates to:
  /// **'내 정보'**
  String get profile;

  /// 기록 쓰기 버튼
  ///
  /// In ko, this message translates to:
  /// **'기록 쓰기'**
  String get writeJournal;

  /// 스팟 저장 버튼
  ///
  /// In ko, this message translates to:
  /// **'스팟 저장'**
  String get saveSpot;

  /// 인기 캠핑 스팟 섹션 제목
  ///
  /// In ko, this message translates to:
  /// **'🔥 인기 캠핑 스팟'**
  String get popularCampingSpots;

  /// 최근 기록 섹션 제목
  ///
  /// In ko, this message translates to:
  /// **'📝 나의 최근 기록'**
  String get myRecentJournals;

  /// 새 기록 버튼
  ///
  /// In ko, this message translates to:
  /// **'새 기록'**
  String get newJournal;

  /// 지난 여행 버튼
  ///
  /// In ko, this message translates to:
  /// **'지난 여행'**
  String get pastTrips;

  /// 현재 위치로 이동 버튼
  ///
  /// In ko, this message translates to:
  /// **'현재 위치로'**
  String get currentLocation;

  /// 필터 저장 버튼
  ///
  /// In ko, this message translates to:
  /// **'필터 저장'**
  String get saveFilter;

  /// 지도 준비 중 메시지
  ///
  /// In ko, this message translates to:
  /// **'지도 연동 예정'**
  String get mapIntegrationPending;

  /// 필터 설정 제목
  ///
  /// In ko, this message translates to:
  /// **'필터 설정'**
  String get filterSettings;

  /// 캠핑 유형 라벨
  ///
  /// In ko, this message translates to:
  /// **'캠핑 유형'**
  String get campingType;

  /// 편의시설 라벨
  ///
  /// In ko, this message translates to:
  /// **'편의시설'**
  String get amenities;

  /// 적용 버튼
  ///
  /// In ko, this message translates to:
  /// **'적용'**
  String get apply;

  /// 전체 필터
  ///
  /// In ko, this message translates to:
  /// **'전체'**
  String get all;

  /// 노지 캠핑 유형
  ///
  /// In ko, this message translates to:
  /// **'노지'**
  String get wildCamping;

  /// 캠핑장 유형
  ///
  /// In ko, this message translates to:
  /// **'캠핑장'**
  String get campground;

  /// 차박 유형
  ///
  /// In ko, this message translates to:
  /// **'차박'**
  String get carCamping;

  /// 글램핑 유형
  ///
  /// In ko, this message translates to:
  /// **'글램핑'**
  String get glamping;

  /// 백패킹 유형
  ///
  /// In ko, this message translates to:
  /// **'백패킹'**
  String get backpacking;

  /// 화장실 편의시설
  ///
  /// In ko, this message translates to:
  /// **'화장실'**
  String get toilet;

  /// 물 공급 편의시설
  ///
  /// In ko, this message translates to:
  /// **'물 공급'**
  String get waterSupply;

  /// 전기 편의시설
  ///
  /// In ko, this message translates to:
  /// **'전기'**
  String get electricity;

  /// 샤워실 편의시설
  ///
  /// In ko, this message translates to:
  /// **'샤워실'**
  String get shower;

  /// 주차장 편의시설
  ///
  /// In ko, this message translates to:
  /// **'주차장'**
  String get parking;

  /// 날씨 라벨
  ///
  /// In ko, this message translates to:
  /// **'날씨'**
  String get weather;

  /// 온도 라벨
  ///
  /// In ko, this message translates to:
  /// **'온도'**
  String get temperature;

  /// 사진 라벨
  ///
  /// In ko, this message translates to:
  /// **'사진'**
  String get photos;

  /// 사진 개수
  ///
  /// In ko, this message translates to:
  /// **'사진 {count}장'**
  String photoCount(int count);

  /// 여행 기간
  ///
  /// In ko, this message translates to:
  /// **'{nights}박 {days}일'**
  String duration(int nights, int days);

  /// 맑은 날씨
  ///
  /// In ko, this message translates to:
  /// **'맑음'**
  String get weatherSunny;

  /// 흐린 날씨
  ///
  /// In ko, this message translates to:
  /// **'흐림'**
  String get weatherCloudy;

  /// 비 오는 날씨
  ///
  /// In ko, this message translates to:
  /// **'비'**
  String get weatherRainy;

  /// 눈 오는 날씨
  ///
  /// In ko, this message translates to:
  /// **'눈'**
  String get weatherSnowy;

  /// 바람 부는 날씨
  ///
  /// In ko, this message translates to:
  /// **'바람'**
  String get weatherWindy;

  /// 온도 표시 형식
  ///
  /// In ko, this message translates to:
  /// **'{temp}°C'**
  String temperatureFormat(int temp);

  /// 평점 표시
  ///
  /// In ko, this message translates to:
  /// **'⭐ {rating}'**
  String rating(double rating);

  /// 로딩 메시지
  ///
  /// In ko, this message translates to:
  /// **'로딩 중...'**
  String get loading;

  /// 질문하기 버튼
  ///
  /// In ko, this message translates to:
  /// **'질문하기'**
  String get askQuestion;

  /// 장비 태그
  ///
  /// In ko, this message translates to:
  /// **'장비'**
  String get equipment;

  /// 요리 태그
  ///
  /// In ko, this message translates to:
  /// **'요리'**
  String get cooking;

  /// 팁 태그
  ///
  /// In ko, this message translates to:
  /// **'팁'**
  String get tips;

  /// 레시피 태그
  ///
  /// In ko, this message translates to:
  /// **'레시피'**
  String get recipe;

  /// 텐트 장비
  ///
  /// In ko, this message translates to:
  /// **'텐트'**
  String get tent;

  /// 추천 태그
  ///
  /// In ko, this message translates to:
  /// **'추천'**
  String get recommendation;

  /// 겨울캠핑 태그
  ///
  /// In ko, this message translates to:
  /// **'겨울캠핑'**
  String get winterCamping;

  /// 체크리스트
  ///
  /// In ko, this message translates to:
  /// **'체크리스트'**
  String get checklist;

  /// 예약
  ///
  /// In ko, this message translates to:
  /// **'예약'**
  String get reservation;

  /// 비교
  ///
  /// In ko, this message translates to:
  /// **'비교'**
  String get comparison;

  /// 후기
  ///
  /// In ko, this message translates to:
  /// **'후기'**
  String get review;

  /// 매트리스
  ///
  /// In ko, this message translates to:
  /// **'매트리스'**
  String get mattress;

  /// 캠핑러버 타이틀
  ///
  /// In ko, this message translates to:
  /// **'캠핑러버'**
  String get campingLover;

  /// 기록 통계
  ///
  /// In ko, this message translates to:
  /// **'기록'**
  String get records;

  /// 팔로워 수
  ///
  /// In ko, this message translates to:
  /// **'팔로워'**
  String get followers;

  /// 내 글 메뉴
  ///
  /// In ko, this message translates to:
  /// **'내 글'**
  String get myPosts;

  /// 북마크한 글 메뉴
  ///
  /// In ko, this message translates to:
  /// **'북마크한 글'**
  String get bookmarkedPosts;

  /// 설정 메뉴
  ///
  /// In ko, this message translates to:
  /// **'설정'**
  String get settings;

  /// 알림 설정
  ///
  /// In ko, this message translates to:
  /// **'알림'**
  String get notifications;

  /// 고객센터 메뉴
  ///
  /// In ko, this message translates to:
  /// **'고객센터'**
  String get customerService;

  /// 지리산 위치
  ///
  /// In ko, this message translates to:
  /// **'지리산'**
  String get locationJirisan;

  /// 설악산 위치
  ///
  /// In ko, this message translates to:
  /// **'설악산'**
  String get locationSeoraksan;

  /// 한라산 위치
  ///
  /// In ko, this message translates to:
  /// **'한라산'**
  String get locationHallasan;

  /// 북한산 위치
  ///
  /// In ko, this message translates to:
  /// **'북한산'**
  String get locationBukhansan;

  /// 덕유산 위치
  ///
  /// In ko, this message translates to:
  /// **'덕유산'**
  String get locationDeokyusan;

  /// 저장한 스팟
  ///
  /// In ko, this message translates to:
  /// **'저장한 스팟'**
  String get savedSpots;

  /// 내 장비
  ///
  /// In ko, this message translates to:
  /// **'내 장비'**
  String get myEquipment;

  /// 캠핑 통계
  ///
  /// In ko, this message translates to:
  /// **'캠핑 통계'**
  String get campingStats;

  /// 내가 쓴 글
  ///
  /// In ko, this message translates to:
  /// **'내가 쓴 글'**
  String get myWritings;

  /// 댓글 단 글
  ///
  /// In ko, this message translates to:
  /// **'댓글 단 글'**
  String get commentedPosts;

  /// 좋아요 한 글
  ///
  /// In ko, this message translates to:
  /// **'좋아요 한 글'**
  String get likedPosts;

  /// 개인정보 처리방침
  ///
  /// In ko, this message translates to:
  /// **'개인정보 처리방침'**
  String get privacyPolicy;

  /// 앱 정보
  ///
  /// In ko, this message translates to:
  /// **'앱 정보'**
  String get appInfo;

  /// 캠핑 관리 섹션
  ///
  /// In ko, this message translates to:
  /// **'캠핑 관리'**
  String get campingManagement;

  /// 후기 올리기 버튼
  ///
  /// In ko, this message translates to:
  /// **'후기 올리기'**
  String get postReview;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ko'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ko':
      return AppLocalizationsKo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
