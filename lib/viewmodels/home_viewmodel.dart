import 'package:flutter/foundation.dart';
import '../models/camping_spot.dart';
import '../models/journal_entry.dart';
import '../services/camping_service.dart';
import '../services/journal_service.dart';

class HomeViewModel extends ChangeNotifier {
  final CampingService _campingService;
  final JournalService _journalService;

  HomeViewModel({
    required CampingService campingService,
    required JournalService journalService,
  }) : _campingService = campingService,
       _journalService = journalService;
  List<CampingSpot> _popularSpots = [];
  List<JournalEntry> _recentJournals = [];
  bool _isLoading = false;

  List<CampingSpot> get popularSpots => _popularSpots;
  List<JournalEntry> get recentJournals => _recentJournals;
  bool get isLoading => _isLoading;

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> loadHomeData() async {
    _setLoading(true);

    try {
      await Future.wait([
        _loadPopularSpots(),
        _loadRecentJournals(),
      ]);
    } catch (e) {
      debugPrint('Error loading home data: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _loadPopularSpots() async {
    _popularSpots = await _campingService.getCampingSpots();
  }

  Future<void> _loadRecentJournals() async {
    final allJournals = await _journalService.getJournalEntries();
    _recentJournals = allJournals.take(2).toList();
  }

  void navigateToJournalWrite() {
    // TODO: 기록 쓰기 화면으로 이동
  }

  void navigateToSpotSave() {
    // TODO: 스팟 저장 화면으로 이동
  }

  void onSpotTap(CampingSpot spot) {
    // TODO: 스팟 상세 화면으로 이동
  }

  void onJournalTap(JournalEntry journal) {
    // TODO: 기록 상세 화면으로 이동
  }
}