
import { GoogleGenAI } from "@google/genai";

const API_KEY = process.env.API_KEY;

if (!API_KEY) {
  // In a real app, you'd handle this more gracefully.
  // For this demo, we'll log a warning. The UI will handle the disabled state.
  console.warn("Gemini API key not found. Summarizer feature will be disabled.");
}

const ai = API_KEY ? new GoogleGenAI({ apiKey: API_KEY }) : null;

export const summarizeText = async (text: string): Promise<string> => {
  if (!ai) {
    return "AI Summarizer is unavailable. Please configure your API key.";
  }
  
  try {
    const prompt = `Summarize the following text for a student in 5-10 key sentences. Keep the language simple and clear:\n\n---\n\n${text}`;
    const response = await ai.models.generateContent({
      model: 'gemini-2.5-flash',
      contents: prompt,
    });
    return response.text;
  } catch (error) {
    console.error("Error summarizing text with Gemini API:", error);
    return "Could not generate summary. An error occurred.";
  }
};

export const isGeminiAvailable = (): boolean => !!ai;
