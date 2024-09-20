import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_notes/data/services/local_storage_service.dart';
import 'package:gem_notes/ui/bloc/notes/notes_cubit.dart';
import 'package:gem_notes/ui/routes.dart';
import 'package:gem_notes/ui/screens/chat/chat_page.dart';
import 'package:gem_notes/ui/screens/home/home_page.dart';
import 'package:gem_notes/ui/screens/splash/splash_page.dart';
import 'package:gem_notes/ui/theme/app_theme.dart';
import 'package:langchain_google/langchain_google.dart';
import 'package:path_provider/path_provider.dart';

import 'data/services/ai_chat_service.dart';
import 'data/stores/objectbox.g.dart';
import 'data/stores/vector_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storeDir = await getApplicationDocumentsDirectory();
  final store = await openStore(directory: storeDir.path);
  const geminiApiKey = String.fromEnvironment('GEMINI_API_KEY');
  final chatModel = ChatGoogleGenerativeAI(apiKey: geminiApiKey);
  final embeddingModel = GoogleGenerativeAIEmbeddings(apiKey: geminiApiKey);
  final vectorStore = NotesVectorStore(
    embeddings: embeddingModel,
    store: store,
  );
  final localStorageService = LocalStorageService(
    store: store,
    vectorStore: vectorStore,
  );
  final aiChatService = AiChatService(
    chatModel: chatModel,
    vectorStore: vectorStore,
  );

  runApp(
    MyApp(
      localStorageService: localStorageService,
      aiChatService: aiChatService,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.localStorageService,
    required this.aiChatService,
  });

  final LocalStorageService localStorageService;
  final AiChatService aiChatService;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(localStorageService)..init(),
      child: MaterialApp(
        title: 'Notas con AI',
        theme: buildMaterial3Theme(),
        routes: {
          Routes.splash.name: (_) => const SplashPage(),
          Routes.home.name: (_) => const HomePage(),
          Routes.chat.name: (_) => ChatPage(aiChatService: aiChatService),
        },
        initialRoute: Routes.splash.name,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
