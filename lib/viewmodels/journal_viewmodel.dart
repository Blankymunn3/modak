import 'package:flutter/foundation.dart';
import '../models/journal_entry.dart';
import '../services/journal_service.dart';

class JournalViewModel extends ChangeNotifier {
  final JournalService _journalService;

  JournalViewModel({
    required JournalService journalService,
  }) : _journalService = journalService;
  List<JournalEntry> _journalEntries = [];
  bool _isLoading = false;

  List<JournalEntry> get journalEntries => _journalEntries;
  bool get isLoading => _isLoading;

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> loadJournalEntries() async {
    _setLoading(true);

    try {
      _journalEntries = await _journalService.getJournalEntries();
    } catch (e) {
      debugPrint('Error loading journal entries: $e');
    } finally {
      _setLoading(false);
    }
  }

  String getTypeColor(String type) {
    switch (type) {
      case '노지':
        return 'blue';
      case '캠핑장':
        return 'orange';
      case '차박':
        return 'green';
      case '글램핑':
        return 'purple';
      case '백패킹':
        return 'red';
      default:
        return 'blue';
    }
  }

  void createNewJournal() {
    // TODO: 새 기록 작성 화면으로 이동
  }

  void viewPastTrips() {
    // TODO: 지난 여행 목록 화면으로 이동
  }

  void onJournalTap(JournalEntry journal) {
    // TODO: 기록 상세 화면으로 이동
  }

  Future<void> deleteJournal(String journalId) async {
    _setLoading(true);

    try {
      await _journalService.deleteJournal(journalId);
      _journalEntries.removeWhere((entry) => entry.id == journalId);
      notifyListeners();
    } catch (e) {
      debugPrint('Error deleting journal: $e');
    } finally {
      _setLoading(false);
    }
  }
}