# GemNotes: Chat with your Notes using Gemini AI & RAG

**Unlock the power of your personal knowledge base with GemNotes!** This Flutter application leverages the cutting-edge capabilities of Google Gemini and LangChain to let you interact with your notes in a conversational manner. Ask questions, gain insights, and rediscover the hidden gems within your own data.

## Features

* **Chat with your Notes:** Ask Gemini AI questions based on the content of your notes.
* **Powered by Google Gemini:** Utilizes Gemini, a powerful large language model, for intelligent and informative responses.
* **RAG (Retrieval Augmented Generation):**  Efficiently retrieves relevant information from your notes using advanced embedding techniques.
* **LangChain Integration:** Simplifies development with the LangChain framework, enabling seamless communication with Gemini and managing RAG pipelines.
* **ObjectBox Database:** Ensures fast and efficient storage and retrieval of notes and embeddings on your device.
* **Intuitive UI:** Clean and user-friendly interface for note-taking and chat interactions.

## How it Works

GemNotes uses a sophisticated Retrieval Augmented Generation (RAG) system to connect your notes with Gemini AI. 

1. **Note Storage & Embedding:** When you create a note, it's stored locally using ObjectBox. LangChain then divides the note into smaller chunks and generates embeddings (mathematical representations of the text) for each chunk. These embeddings are stored alongside the note.
2. **Question Processing:** When you ask a question, LangChain generates an embedding for your question.
3. **Relevant Note Retrieval:** The question's embedding is compared to the embeddings of your notes. Notes with similar embeddings are deemed relevant and retrieved.
4. **Gemini Interaction:** The relevant notes, along with your question, are sent to Gemini AI via the LangChain pipeline.
5. **Answer Generation:** Gemini processes the context from your notes and your question to generate an insightful and accurate response.

## Architecture

GemNotes is built with a modular architecture using Flutter and the BLoC pattern for state management. Key components include:

* **AiChatService:** Manages communication with Gemini and orchestrates the RAG pipeline using `langchain_dart`.
* **LocalStorageService:** Handles note storage and retrieval using ObjectBox.
* **NotesVectorStore:**  Extends `BaseObjectBoxVectorStore` and manages the persistence of embeddings.
* **Note:** Data model representing a single note.
* **NotesCubit:** BLoC component managing the state of notes.
* **ChatPage:** UI for interacting with Gemini via chat.
* **HomePage:** Main entry point displaying the list of notes.

## Getting Started

1. **Clone the repository:** `git clone https://github.com/alfredobs97/gem_notes`
2. **Install dependencies:** `flutter pub get`
3. **Get a Gemini API Key:** Visit `https://aistudio.google.com` to obtain your API key.
4. **Configure API Key:** Update the API key in the application's configuration.
5. **Run the app:** `flutter run`

## Contributing

Contributions are welcome! Feel free to open issues, submit pull requests, or join the LangChain Dart community for discussions and support.

## Author

Alfredo Bautista - [@alfredobs97](https://twitter.com/alfredobs97)

