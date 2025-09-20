import 'package:flutter/foundation.dart';
import '../models/camping_spot.dart';
import '../models/filter_settings.dart';
import '../services/camping_service.dart';

class MapViewModel extends ChangeNotifier {
  final CampingService _campingService;

  MapViewModel({
    required CampingService campingService,
  }) : _campingService = campingService;
  List<CampingSpot> _campingSpots = [];
  FilterSettings _filterSettings = FilterSettings.empty();
  bool _isLoading = false;
  double? _userLatitude;
  double? _userLongitude;

  List<CampingSpot> get campingSpots => _campingSpots;
  FilterSettings get filterSettings => _filterSettings;
  bool get isLoading => _isLoading;
  double? get userLatitude => _userLatitude;
  double? get userLongitude => _userLongitude;

  List<CampingSpot> get filteredSpots {
    if (_filterSettings.campingTypes.isEmpty && _filterSettings.amenities.isEmpty) {
      return _campingSpots;
    }

    return _campingSpots.where((spot) {
      bool typeMatch = _filterSettings.campingTypes.isEmpty ||
          _filterSettings.campingTypes.contains(spot.type);

      bool amenityMatch = _filterSettings.amenities.isEmpty ||
          _filterSettings.amenities.every((amenity) => spot.amenities.contains(amenity));

      return typeMatch && amenityMatch;
    }).toList();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> loadCampingSpots() async {
    _setLoading(true);

    try {
      _campingSpots = await _campingService.getCampingSpots();
    } catch (e) {
      debugPrint('Error loading camping spots: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      // TODO: 실제 위치 서비스 연동
      await Future.delayed(const Duration(milliseconds: 300));
      _userLatitude = 37.5665;
      _userLongitude = 126.9780;
      notifyListeners();
    } catch (e) {
      debugPrint('Error getting current location: $e');
    }
  }

  void updateFilter(FilterSettings newFilter) {
    _filterSettings = newFilter;
    notifyListeners();
  }

  void toggleCampingType(String type) {
    List<String> updatedTypes = List.from(_filterSettings.campingTypes);

    if (updatedTypes.contains(type)) {
      updatedTypes.remove(type);
    } else {
      updatedTypes.add(type);
    }

    _filterSettings = _filterSettings.copyWith(campingTypes: updatedTypes);
    notifyListeners();
  }

  void toggleAmenity(String amenity) {
    List<String> updatedAmenities = List.from(_filterSettings.amenities);

    if (updatedAmenities.contains(amenity)) {
      updatedAmenities.remove(amenity);
    } else {
      updatedAmenities.add(amenity);
    }

    _filterSettings = _filterSettings.copyWith(amenities: updatedAmenities);
    notifyListeners();
  }

  void clearFilters() {
    _filterSettings = FilterSettings.empty();
    notifyListeners();
  }

  void onSpotTap(CampingSpot spot) {
    // TODO: 스팟 상세 화면으로 이동
  }

  void saveCurrentFilter() {
    // TODO: 필터 설정 저장
  }
}