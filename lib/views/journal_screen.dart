import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/journal_viewmodel.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<JournalViewModel>().loadJournalEntries();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<JournalViewModel>(
      builder: (context, journalViewModel, child) {
        if (journalViewModel.isLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('기록'),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: journalViewModel.createNewJournal,
                        icon: const Icon(Icons.add),
                        label: const Text('새 기록'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: journalViewModel.viewPastTrips,
                        icon: const Icon(Icons.history),
                        label: const Text('지난 여행'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: journalViewModel.journalEntries.length,
                  itemBuilder: (context, index) {
                    final journal = journalViewModel.journalEntries[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: InkWell(
                        onTap: () => journalViewModel.onJournalTap(journal),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _getTypeColor(journal.type),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      journal.type,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${journal.date.year}.${journal.date.month.toString().padLeft(2, '0')}.${journal.date.day.toString().padLeft(2, '0')}',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                journal.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '날씨: ${journal.weather} · 온도: ${journal.temperature.toInt()}°C',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(
                                    Icons.photo_camera,
                                    size: 16,
                                    color: Colors.grey.shade600,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '사진 ${journal.photos.length}장',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Icon(
                                    Icons.access_time,
                                    size: 16,
                                    color: Colors.grey.shade600,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${journal.duration}박 ${journal.duration + 1}일',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: journalViewModel.createNewJournal,
            backgroundColor: Colors.green,
            child: const Icon(Icons.edit, color: Colors.white),
          ),
        );
      },
    );
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case '노지':
        return Colors.blue;
      case '캠핑장':
        return Colors.orange;
      case '차박':
        return Colors.green;
      case '글램핑':
        return Colors.purple;
      case '백패킹':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }
}