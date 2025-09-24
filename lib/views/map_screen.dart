import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
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
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: Text(AppLocalizations.of(context).map),
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
              body: mapViewModel.isLoading
                  ? _buildSkeletonUI()
                  : Stack(
                      children: [
                        Container(
                          color: Colors.grey.shade200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.map, size: 80, color: Colors.grey),
                                const SizedBox(height: 16),
                                Text(
                                  AppLocalizations.of(context).mapIntegrationPending,
                                  style: const TextStyle(
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
                                  label: Text(AppLocalizations.of(context).currentLocation),
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
                                label: Text(AppLocalizations.of(context).saveFilter),
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
                                  AppLocalizations.of(context).all,
                                  mapViewModel.filterSettings.campingTypes.isEmpty &&
                                  mapViewModel.filterSettings.amenities.isEmpty,
                                  () => mapViewModel.clearFilters()
                                ),
                                _buildFilterChip(
                                  AppLocalizations.of(context).wildCamping,
                                  mapViewModel.filterSettings.campingTypes.contains('노지'),
                                  () => mapViewModel.toggleCampingType('노지')
                                ),
                                _buildFilterChip(
                                  AppLocalizations.of(context).campground,
                                  mapViewModel.filterSettings.campingTypes.contains('캠핑장'),
                                  () => mapViewModel.toggleCampingType('캠핑장')
                                ),
                                _buildFilterChip(
                                  AppLocalizations.of(context).carCamping,
                                  mapViewModel.filterSettings.campingTypes.contains('차박'),
                                  () => mapViewModel.toggleCampingType('차박')
                                ),
                                _buildFilterChip(
                                  AppLocalizations.of(context).waterSupply,
                                  mapViewModel.filterSettings.amenities.contains('물 공급'),
                                  () => mapViewModel.toggleAmenity('물 공급')
                                ),
                                _buildFilterChip(
                                  AppLocalizations.of(context).toilet,
                                  mapViewModel.filterSettings.amenities.contains('화장실'),
                                  () => mapViewModel.toggleAmenity('화장실')
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            if (mapViewModel.isLoading)
              Container(
                color: Colors.black54,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildSkeletonUI() {
    return Stack(
      children: [
        Container(
          color: Colors.grey.shade300,
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 100,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(8),
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
              children: List.generate(6, (index) => Container(
                margin: const EdgeInsets.only(right: 8),
                child: Container(
                  width: 80,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              )),
            ),
          ),
        ),
      ],
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
            Text(
              AppLocalizations.of(context).filterSettings,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(AppLocalizations.of(context).campingType),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                _buildFilterChip(
                  AppLocalizations.of(context).wildCamping,
                  mapViewModel.filterSettings.campingTypes.contains('노지'),
                  () => mapViewModel.toggleCampingType('노지')
                ),
                _buildFilterChip(
                  AppLocalizations.of(context).campground,
                  mapViewModel.filterSettings.campingTypes.contains('캠핑장'),
                  () => mapViewModel.toggleCampingType('캠핑장')
                ),
                _buildFilterChip(
                  AppLocalizations.of(context).carCamping,
                  mapViewModel.filterSettings.campingTypes.contains('차박'),
                  () => mapViewModel.toggleCampingType('차박')
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(AppLocalizations.of(context).amenities),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                _buildFilterChip(
                  AppLocalizations.of(context).toilet,
                  mapViewModel.filterSettings.amenities.contains('화장실'),
                  () => mapViewModel.toggleAmenity('화장실')
                ),
                _buildFilterChip(
                  AppLocalizations.of(context).waterSupply,
                  mapViewModel.filterSettings.amenities.contains('물 공급'),
                  () => mapViewModel.toggleAmenity('물 공급')
                ),
                _buildFilterChip(
                  AppLocalizations.of(context).electricity,
                  mapViewModel.filterSettings.amenities.contains('전기'),
                  () => mapViewModel.toggleAmenity('전기')
                ),
                _buildFilterChip(
                  AppLocalizations.of(context).shower,
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
                child: Text(AppLocalizations.of(context).apply),
              ),
            ),
          ],
        ),
      ),
    );
  }
}