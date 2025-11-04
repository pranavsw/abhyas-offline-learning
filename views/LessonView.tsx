
import React, { useState } from 'react';
import { Lesson } from '../types';
import { summarizeText, isGeminiAvailable } from '../services/geminiService';

interface LessonViewProps {
  lesson: Lesson;
  onStartQuiz: (lesson: Lesson) => void;
  onBack: () => void;
}

const SummaryModal: React.FC<{ summary: string; onClose: () => void }> = ({ summary, onClose }) => (
    <div className="fixed inset-0 bg-black/70 backdrop-blur-sm flex items-center justify-center p-4 z-50" onClick={onClose}>
        <div className="bg-gray-800 rounded-lg p-6 max-w-md w-full border border-cyan-500/50 shadow-lg shadow-cyan-500/20" onClick={e => e.stopPropagation()}>
            <h3 className="text-xl font-bold text-cyan-400 mb-4">AI Summary</h3>
            <p className="text-gray-300 whitespace-pre-wrap">{summary}</p>
            <button
                onClick={onClose}
                className="mt-6 w-full bg-cyan-500 text-white font-bold py-2 px-4 rounded-lg hover:bg-cyan-600 transition-colors"
            >
                Close
            </button>
        </div>
    </div>
);


const LessonView: React.FC<LessonViewProps> = ({ lesson, onStartQuiz, onBack }) => {
    const [isSummarizing, setIsSummarizing] = useState(false);
    const [summary, setSummary] = useState<string | null>(null);

    const handleSummarize = async () => {
        setIsSummarizing(true);
        const result = await summarizeText(lesson.content);
        setSummary(result);
        setIsSummarizing(false);
    };

  return (
    <div className="flex flex-col h-full">
      <div className="p-4 flex-grow relative pb-24">
        <div className="flex items-center mb-6">
          <button onClick={onBack} className="mr-4 p-2 rounded-full hover:bg-white/10 transition-colors">
             <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><polyline points="15 18 9 12 15 6"></polyline></svg>
          </button>
          <h1 className="text-3xl font-bold">{lesson.title}</h1>
        </div>
        
        <div className="flex gap-2 mb-6">
            <button onClick={() => alert("Text-to-speech not implemented.")} className="flex items-center gap-2 bg-white/10 px-4 py-2 rounded-full text-sm hover:bg-white/20 transition-colors">
                🔊 Read Aloud
            </button>
             <button 
                onClick={handleSummarize} 
                disabled={isSummarizing || !isGeminiAvailable()}
                className="flex items-center gap-2 bg-cyan-500/20 px-4 py-2 rounded-full text-sm hover:bg-cyan-500/40 transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
            >
                {isSummarizing ? '✨ Summarizing...' : '✨ AI Summarize'}
            </button>
        </div>
        
        <article className="prose prose-invert lg:prose-xl text-gray-300 leading-relaxed">
          {lesson.content}
        </article>
      </div>

      <div className="fixed bottom-16 left-0 right-0 p-4 max-w-lg mx-auto bg-gradient-to-t from-[#0a0f1f] to-transparent">
        <button
          onClick={() => onStartQuiz(lesson)}
          className="w-full bg-gradient-to-r from-cyan-500 to-blue-600 text-white font-bold text-lg py-4 px-4 rounded-xl shadow-lg shadow-cyan-500/30 hover:scale-105 transform transition-transform duration-200"
        >
          Take 10-Question Quiz
        </button>
      </div>
      {summary && <SummaryModal summary={summary} onClose={() => setSummary(null)} />}
    </div>
  );
};

export default LessonView;
