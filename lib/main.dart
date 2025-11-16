import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'utils/app_state.dart';
import 'utils/theme.dart';
import 'views/home_view.dart';
import 'views/progress_view.dart';
import 'views/ai_friend_view.dart';
import 'views/settings_view.dart';
import 'views/lesson_list_view.dart';
import 'views/lesson_view.dart';
import 'views/quiz_view.dart';
import 'widgets/bottom_nav.dart';
import 'services/gemini_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set status bar style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: Consumer<AppState>(
        builder: (context, appState, _) {
          return MaterialApp(
            title: 'Abhyas: Offline Learning',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.darkTheme,
            home: const MainScreen(),
          );
        },
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late GeminiService _geminiService;

  @override
  void initState() {
    super.initState();
    // Initialize Gemini service with API key from environment
    const apiKey = String.fromEnvironment('GEMINI_API_KEY', defaultValue: '');
    _geminiService = GeminiService(apiKey: apiKey);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Reset navigation when switching tabs
    Provider.of<AppState>(context, listen: false).resetNavigation();
  }

  Widget _getBody() {
    final appState = Provider.of<AppState>(context);

    // Check if we're in hierarchical navigation (lesson list or lesson view)
    if (appState.selectedLesson != null) {
      return LessonView(geminiService: _geminiService);
    } else if (appState.selectedSubject != null) {
      return const LessonListView();
    }

    // Main tab navigation
    switch (_selectedIndex) {
      case 0:
        return const HomeView();
      case 1:
        return const ProgressView();
      case 2:
        return AiFriendView(geminiService: _geminiService);
      case 3:
        return const SettingsView();
      default:
        return const HomeView();
    }
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final inHierarchicalNav = appState.selectedSubject != null;

    return Scaffold(
      body: _getBody(),
      bottomNavigationBar: inHierarchicalNav
          ? null
          : BottomNav(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
    );
  }
}
