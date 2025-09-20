import '../models/camping_spot.dart';

abstract class CampingService {
  Future<List<CampingSpot>> getCampingSpots();
  Future<CampingSpot?> getCampingSpotById(String id);
}

class CampingServiceImpl implements CampingService {
  @override
  Future<List<CampingSpot>> getCampingSpots() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      CampingSpot(
        id: '1',
        name: '지리산 캠핑장',
        latitude: 35.3362,
        longitude: 127.7311,
        type: '캠핑장',
        rating: 4.5,
        amenities: ['화장실', '물 공급', '전기'],
        description: '지리산 국립공원 내 캠핑장',
        imageUrls: [],
      ),
      CampingSpot(
        id: '2',
        name: '설악산 노지',
        latitude: 38.1197,
        longitude: 128.4656,
        type: '노지',
        rating: 4.3,
        amenities: ['화장실'],
        description: '자연 그대로의 노지',
        imageUrls: [],
      ),
      CampingSpot(
        id: '3',
        name: '한라산 차박장',
        latitude: 33.3616,
        longitude: 126.5292,
        type: '차박',
        rating: 4.7,
        amenities: ['주차장', '화장실'],
        description: '차박하기 좋은 장소',
        imageUrls: [],
      ),
    ];
  }

  @override
  Future<CampingSpot?> getCampingSpotById(String id) async {
    final spots = await getCampingSpots();
    try {
      return spots.firstWhere((spot) => spot.id == id);
    } catch (e) {
      return null;
    }
  }
}