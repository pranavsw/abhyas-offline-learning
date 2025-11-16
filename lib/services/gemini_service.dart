import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class GeminiService {
  static const String _baseUrl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash-exp:generateContent';
  
  String? _apiKey;
  
  GeminiService({String? apiKey}) {
    _apiKey = apiKey;
  }

  bool isAvailable() {
    return _apiKey != null && _apiKey!.isNotEmpty;
  }

  Future<String> summarizeText(String text) async {
    if (!isAvailable()) {
      return 'AI summarization is not available. Please configure your Gemini API key.';
    }

    try {
      final prompt = 'Summarize the following text for a student in 5-10 key sentences. Keep the language simple and clear:\n\n$text';
      
      final response = await http.post(
        Uri.parse('$_baseUrl?key=$_apiKey'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'contents': [
            {
              'parts': [
                {'text': prompt}
              ]
            }
          ],
          'generationConfig': {
            'temperature': 0.7,
            'topK': 40,
            'topP': 0.95,
            'maxOutputTokens': 1024,
          }
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['candidates'] != null && data['candidates'].isNotEmpty) {
          final content = data['candidates'][0]['content'];
          if (content['parts'] != null && content['parts'].isNotEmpty) {
            return content['parts'][0]['text'] ?? 'No summary generated.';
          }
        }
        return 'Unable to generate summary. Please try again.';
      } else {
        debugPrint('Gemini API error: ${response.statusCode} - ${response.body}');
        return 'Error generating summary. Status code: ${response.statusCode}';
      }
    } catch (e) {
      debugPrint('Error calling Gemini API: $e');
      return 'Failed to generate summary. Please check your internet connection and try again.';
    }
  }

  Future<String> getChatResponse(String message) async {
    if (!isAvailable()) {
      return 'I\'m sorry, but AI features are not available right now. Please configure your Gemini API key to enable AI assistance.';
    }

    try {
      final prompt = 'You are a friendly AI study assistant helping a student (grades 6-12). Answer their question helpfully and clearly. Keep your response conversational and encouraging.\n\nStudent question: $message';
      
      final response = await http.post(
        Uri.parse('$_baseUrl?key=$_apiKey'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'contents': [
            {
              'parts': [
                {'text': prompt}
              ]
            }
          ],
          'generationConfig': {
            'temperature': 0.8,
            'topK': 40,
            'topP': 0.95,
            'maxOutputTokens': 512,
          }
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['candidates'] != null && data['candidates'].isNotEmpty) {
          final content = data['candidates'][0]['content'];
          if (content['parts'] != null && content['parts'].isNotEmpty) {
            return content['parts'][0]['text'] ?? 'I\'m not sure how to respond to that.';
          }
        }
        return 'I\'m having trouble understanding. Could you rephrase your question?';
      } else {
        debugPrint('Gemini API error: ${response.statusCode} - ${response.body}');
        return 'I\'m having technical difficulties right now. Please try again in a moment.';
      }
    } catch (e) {
      debugPrint('Error calling Gemini API: $e');
      return 'I\'m having trouble connecting right now. Please check your internet connection.';
    }
  }
}
