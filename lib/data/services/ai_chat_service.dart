import 'package:langchain/langchain.dart';
import 'package:langchain_google/langchain_google.dart';

import '../stores/vector_store.dart';

class AiChatService {
  AiChatService({
    required ChatGoogleGenerativeAI chatModel,
    required NotesVectorStore vectorStore,
  }) : _history = [] {
    _chatRagPipeline = _buildChatRagPipeline(chatModel, vectorStore);
  }

  late final RunnableSequence<String, String> _chatRagPipeline;
  final List<ChatMessage> _history;

  RunnableSequence<String, String> _buildChatRagPipeline(
    ChatGoogleGenerativeAI chatModel,
    NotesVectorStore vectorStore,
  ) {
    final retriever = vectorStore.asRetriever();

    // 1. We retrieve the most relevant documents and combine them into a single string
    final retrievalChain = retriever //
        .pipe(Runnable.mapInput((docs) => docs
            .map((d) => ''
                '<note id="${d.metadata['note_id']}">\n'
                '${d.pageContent}\n'
                '</note>')
            .join('\n')));

    // 2. We generate a response to the user question using the retrieved context
    final qaPrompt = ChatPromptTemplate.fromTemplates(const [
      (
        ChatMessageType.system,
        '''
You are an assistant for question-answering tasks.

Use the following pieces of retrieved context to answer the user question.
If you don't know the answer, just say that you don't know. 
Use three sentences maximum and keep the answer concise.

Respond in the language of the user's query.

Context:
{context}
'''
      ),
      (ChatMessageType.messagesPlaceholder, 'history'),
      (ChatMessageType.human, '{question}'),
    ]);
    final qaChain = Runnable.fromMap<String>({
      'context': retrievalChain,
      'history': Runnable.mapInput((question) {
        final history = [..._history];
        _history.add(ChatMessage.humanText(question));
        return history;
      }),
      'question': Runnable.passthrough(),
    }).pipe(qaPrompt).pipe(chatModel).pipe(Runnable.mapInput((result) {
      final outputMsg = result.output;
      _history.add(outputMsg);
      return outputMsg.content;
    }));

    return qaChain;
  }

  Stream<String> askQuestion(final String question) {
    return _chatRagPipeline.stream(question);
  }

  void clearHistory() {
    _history.clear();
  }
}
