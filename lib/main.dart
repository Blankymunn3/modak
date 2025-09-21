import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'views/home_screen.dart';
import 'views/map_screen.dart';
import 'views/journal_screen.dart';
import 'views/community_screen.dart';
import 'views/profile_screen.dart';
import 'viewmodels/main_viewmodel.dart';
import 'viewmodels/home_viewmodel.dart';
import 'viewmodels/map_viewmodel.dart';
import 'viewmodels/journal_viewmodel.dart';
import 'services/camping_service.dart';
import 'services/journal_service.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const ModakApp());
}

class ModakApp extends StatelessWidget {
  const ModakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CampingService>(create: (_) => CampingServiceImpl()),
        Provider<JournalService>(create: (_) => JournalServiceImpl()),
        ChangeNotifierProvider(create: (_) => MainViewModel()),
        ChangeNotifierProxyProvider2<CampingService, JournalService, HomeViewModel>(
          create: (context) => HomeViewModel(
            campingService: context.read<CampingService>(),
            journalService: context.read<JournalService>(),
          ),
          update: (context, campingService, journalService, previous) => HomeViewModel(
            campingService: campingService,
            journalService: journalService,
          ),
        ),
        ChangeNotifierProxyProvider<CampingService, MapViewModel>(
          create: (context) => MapViewModel(
            campingService: context.read<CampingService>(),
          ),
          update: (context, campingService, previous) => MapViewModel(
            campingService: campingService,
          ),
        ),
        ChangeNotifierProxyProvider<JournalService, JournalViewModel>(
          create: (context) => JournalViewModel(
            journalService: context.read<JournalService>(),
          ),
          update: (context, journalService, previous) => JournalViewModel(
            journalService: journalService,
          ),
        ),
      ],
      child: MaterialApp(
        onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ko'),
          Locale('en'),
        ],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Colors.black87),
          ),
        ),
        home: const MainTabView(),
      ),
    );
  }
}

class MainTabView extends StatelessWidget {
  const MainTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainViewModel>(
      builder: (context, mainViewModel, child) {
        final screens = [
          const HomeScreen(),
          const MapScreen(),
          const JournalScreen(),
          const CommunityScreen(),
          const ProfileScreen(),
        ];

        return Scaffold(
          body: screens[mainViewModel.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: mainViewModel.selectedIndex,
            onTap: mainViewModel.changeTab,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 12,
            ),
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: AppLocalizations.of(context).home,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.map),
                label: AppLocalizations.of(context).map,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.edit_note),
                label: AppLocalizations.of(context).journal,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.forum),
                label: AppLocalizations.of(context).community,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: AppLocalizations.of(context).profile,
              ),
            ],
          ),
        );
      },
    );
  }
}
