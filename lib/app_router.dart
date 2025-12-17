import 'package:go_router/go_router.dart';
import 'package:zadanie_rekrutacyjne/input_page.dart';
import 'package:zadanie_rekrutacyjne/result_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const InputPage()),
    GoRoute(path: '/result', builder: (context, state) => const ResultPage()),
  ],
);
