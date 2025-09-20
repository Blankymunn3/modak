import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/map_viewmodel.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final mapViewModel = context.read<MapViewModel>();
      mapViewModel.loadCampingSpots();
      mapViewModel.getCurrentLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MapViewModel>(
      builder: (context, mapViewModel, child) {
        if (mapViewModel.isLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('지도'),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () {
                  _showFilterBottomSheet(context, mapViewModel);
                },
              ),
            ],
          ),
          body: Stack(
            children: [
              Container(
                color: Colors.grey.shade200,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.map, size: 80, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        '지도 연동 예정',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: mapViewModel.getCurrentLocation,
                        icon: const Icon(Icons.my_location),
                        label: const Text('현재 위치로'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      onPressed: mapViewModel.saveCurrentFilter,
                      icon: const Icon(Icons.bookmark),
                      label: const Text('필터 저장'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10,
                left: 16,
                right: 16,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildFilterChip(
                        '전체',
                        mapViewModel.filterSettings.campingTypes.isEmpty &&
                        mapViewModel.filterSettings.amenities.isEmpty,
                        () => mapViewModel.clearFilters()
                      ),
                      _buildFilterChip(
                        '노지',
                        mapViewModel.filterSettings.campingTypes.contains('노지'),
                        () => mapViewModel.toggleCampingType('노지')
                      ),
                      _buildFilterChip(
                        '캠핑장',
                        mapViewModel.filterSettings.campingTypes.contains('캠핑장'),
                        () => mapViewModel.toggleCampingType('캠핑장')
                      ),
                      _buildFilterChip(
                        '차박',
                        mapViewModel.filterSettings.campingTypes.contains('차박'),
                        () => mapViewModel.toggleCampingType('차박')
                      ),
                      _buildFilterChip(
                        '물 공급',
                        mapViewModel.filterSettings.amenities.contains('물 공급'),
                        () => mapViewModel.toggleAmenity('물 공급')
                      ),
                      _buildFilterChip(
                        '화장실',
                        mapViewModel.filterSettings.amenities.contains('화장실'),
                        () => mapViewModel.toggleAmenity('화장실')
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilterChip(String label, bool isSelected, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (_) => onTap(),
        backgroundColor: Colors.white,
        selectedColor: Colors.blue.shade100,
        checkmarkColor: Colors.blue,
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context, MapViewModel mapViewModel) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '필터 설정',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text('캠핑 유형'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                _buildFilterChip(
                  '노지',
                  mapViewModel.filterSettings.campingTypes.contains('노지'),
                  () => mapViewModel.toggleCampingType('노지')
                ),
                _buildFilterChip(
                  '캠핑장',
                  mapViewModel.filterSettings.campingTypes.contains('캠핑장'),
                  () => mapViewModel.toggleCampingType('캠핑장')
                ),
                _buildFilterChip(
                  '차박',
                  mapViewModel.filterSettings.campingTypes.contains('차박'),
                  () => mapViewModel.toggleCampingType('차박')
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text('편의시설'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                _buildFilterChip(
                  '화장실',
                  mapViewModel.filterSettings.amenities.contains('화장실'),
                  () => mapViewModel.toggleAmenity('화장실')
                ),
                _buildFilterChip(
                  '물 공급',
                  mapViewModel.filterSettings.amenities.contains('물 공급'),
                  () => mapViewModel.toggleAmenity('물 공급')
                ),
                _buildFilterChip(
                  '전기',
                  mapViewModel.filterSettings.amenities.contains('전기'),
                  () => mapViewModel.toggleAmenity('전기')
                ),
                _buildFilterChip(
                  '샤워실',
                  mapViewModel.filterSettings.amenities.contains('샤워실'),
                  () => mapViewModel.toggleAmenity('샤워실')
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('적용'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}