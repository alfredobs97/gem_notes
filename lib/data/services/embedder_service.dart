import 'package:langchain_google/langchain_google.dart';

class EmbedderService {
  static const _apiKey = String.fromEnvironment('GEMINI_API_KEY');

  final GoogleGenerativeAIEmbeddings embedder = GoogleGenerativeAIEmbeddings(
    apiKey: _apiKey,
  );

  Future<List<double>> embed(String content) async {
    final result = await embedder.embedQuery(content);
    return result;
  }
}
