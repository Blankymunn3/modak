import '../models/journal_entry.dart';

abstract class JournalService {
  Future<List<JournalEntry>> getJournalEntries();
  Future<JournalEntry?> getJournalById(String id);
  Future<void> createJournal(JournalEntry entry);
  Future<void> updateJournal(JournalEntry entry);
  Future<void> deleteJournal(String id);
}

class JournalServiceImpl implements JournalService {
  final List<JournalEntry> _mockData = [
    JournalEntry(
      id: '1',
      title: '지리산 캠핑',
      location: '지리산',
      date: DateTime(2024, 9, 20),
      type: '노지',
      weather: '맑음',
      temperature: 20.0,
      duration: 1,
      photos: ['photo1.jpg', 'photo2.jpg', 'photo3.jpg'],
      content: '멋진 지리산 캠핑 경험',
      createdAt: DateTime(2024, 9, 20),
    ),
    JournalEntry(
      id: '2',
      title: '설악산 캠핑',
      location: '설악산',
      date: DateTime(2024, 9, 19),
      type: '캠핑장',
      weather: '흐림',
      temperature: 16.0,
      duration: 2,
      photos: ['photo4.jpg', 'photo5.jpg', 'photo6.jpg', 'photo7.jpg'],
      content: '설악산의 아름다운 자연',
      createdAt: DateTime(2024, 9, 19),
    ),
    JournalEntry(
      id: '3',
      title: '한라산 캠핑',
      location: '한라산',
      date: DateTime(2024, 9, 18),
      type: '차박',
      weather: '비',
      temperature: 17.0,
      duration: 3,
      photos: ['photo8.jpg', 'photo9.jpg', 'photo10.jpg', 'photo11.jpg', 'photo12.jpg'],
      content: '한라산 차박 체험',
      createdAt: DateTime(2024, 9, 18),
    ),
    JournalEntry(
      id: '4',
      title: '북한산 캠핑',
      location: '북한산',
      date: DateTime(2024, 9, 17),
      type: '글램핑',
      weather: '눈',
      temperature: 18.0,
      duration: 4,
      photos: ['photo13.jpg', 'photo14.jpg', 'photo15.jpg', 'photo16.jpg', 'photo17.jpg', 'photo18.jpg'],
      content: '편안한 글램핑',
      createdAt: DateTime(2024, 9, 17),
    ),
    JournalEntry(
      id: '5',
      title: '덕유산 캠핑',
      location: '덕유산',
      date: DateTime(2024, 9, 16),
      type: '백패킹',
      weather: '바람',
      temperature: 19.0,
      duration: 5,
      photos: ['photo19.jpg', 'photo20.jpg', 'photo21.jpg'],
      content: '덕유산 백패킹 도전',
      createdAt: DateTime(2024, 9, 16),
    ),
  ];

  @override
  Future<List<JournalEntry>> getJournalEntries() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return List.from(_mockData);
  }

  @override
  Future<JournalEntry?> getJournalById(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    try {
      return _mockData.firstWhere((entry) => entry.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> createJournal(JournalEntry entry) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _mockData.add(entry);
  }

  @override
  Future<void> updateJournal(JournalEntry entry) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _mockData.indexWhere((e) => e.id == entry.id);
    if (index != -1) {
      _mockData[index] = entry;
    }
  }

  @override
  Future<void> deleteJournal(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _mockData.removeWhere((entry) => entry.id == id);
  }
}