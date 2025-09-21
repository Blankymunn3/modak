// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '모닥';

  @override
  String get home => '홈';

  @override
  String get map => '지도';

  @override
  String get journal => '기록';

  @override
  String get community => '모닥불';

  @override
  String get profile => '내 정보';

  @override
  String get writeJournal => '기록 쓰기';

  @override
  String get saveSpot => '스팟 저장';

  @override
  String get popularCampingSpots => '🔥 인기 캠핑 스팟';

  @override
  String get myRecentJournals => '📝 나의 최근 기록';

  @override
  String get newJournal => '새 기록';

  @override
  String get pastTrips => '지난 여행';

  @override
  String get currentLocation => '현재 위치로';

  @override
  String get saveFilter => '필터 저장';

  @override
  String get mapIntegrationPending => '지도 연동 예정';

  @override
  String get filterSettings => '필터 설정';

  @override
  String get campingType => '캠핑 유형';

  @override
  String get amenities => '편의시설';

  @override
  String get apply => '적용';

  @override
  String get all => '전체';

  @override
  String get wildCamping => '노지';

  @override
  String get campground => '캠핑장';

  @override
  String get carCamping => '차박';

  @override
  String get glamping => '글램핑';

  @override
  String get backpacking => '백패킹';

  @override
  String get toilet => '화장실';

  @override
  String get waterSupply => '물 공급';

  @override
  String get electricity => '전기';

  @override
  String get shower => '샤워실';

  @override
  String get parking => '주차장';

  @override
  String get weather => '날씨';

  @override
  String get temperature => '온도';

  @override
  String get photos => '사진';

  @override
  String photoCount(int count) {
    return '사진 $count장';
  }

  @override
  String duration(int nights, int days) {
    return '$nights박 $days일';
  }

  @override
  String get weatherSunny => '맑음';

  @override
  String get weatherCloudy => '흐림';

  @override
  String get weatherRainy => '비';

  @override
  String get weatherSnowy => '눈';

  @override
  String get weatherWindy => '바람';

  @override
  String temperatureFormat(int temp) {
    return '$temp°C';
  }

  @override
  String rating(double rating) {
    return '⭐ $rating';
  }

  @override
  String get loading => '로딩 중...';

  @override
  String get askQuestion => '질문하기';

  @override
  String get equipment => '장비';

  @override
  String get cooking => '요리';

  @override
  String get tips => '팁';

  @override
  String get recipe => '레시피';

  @override
  String get tent => '텐트';

  @override
  String get recommendation => '추천';

  @override
  String get winterCamping => '겨울캠핑';

  @override
  String get checklist => '체크리스트';

  @override
  String get reservation => '예약';

  @override
  String get comparison => '비교';

  @override
  String get review => '후기';

  @override
  String get mattress => '매트리스';

  @override
  String get campingLover => '캠핑러버';

  @override
  String get records => '기록';

  @override
  String get followers => '팔로워';

  @override
  String get myPosts => '내 글';

  @override
  String get bookmarkedPosts => '북마크한 글';

  @override
  String get settings => '설정';

  @override
  String get notifications => '알림';

  @override
  String get customerService => '고객센터';

  @override
  String get locationJirisan => '지리산';

  @override
  String get locationSeoraksan => '설악산';

  @override
  String get locationHallasan => '한라산';

  @override
  String get locationBukhansan => '북한산';

  @override
  String get locationDeokyusan => '덕유산';

  @override
  String get savedSpots => '저장한 스팟';

  @override
  String get myEquipment => '내 장비';

  @override
  String get campingStats => '캠핑 통계';

  @override
  String get myWritings => '내가 쓴 글';

  @override
  String get commentedPosts => '댓글 단 글';

  @override
  String get likedPosts => '좋아요 한 글';

  @override
  String get privacyPolicy => '개인정보 처리방침';

  @override
  String get appInfo => '앱 정보';

  @override
  String get campingManagement => '캠핑 관리';

  @override
  String get postReview => '후기 올리기';
}
