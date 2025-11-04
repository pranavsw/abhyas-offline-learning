
import React, { useState, useEffect } from 'react';
import { Lesson, Question } from '../types';
import { MOCK_QUESTIONS } from '../data/mockData';

interface QuizViewProps {
  lesson: Lesson;
  onQuizComplete: (lessonId: string, score: number, total: number) => void;
  onBack: () => void;
}

const QuizView: React.FC<QuizViewProps> = ({ lesson, onQuizComplete, onBack }) => {
  const [questions, setQuestions] = useState<Question[]>([]);
  const [currentQuestionIndex, setCurrentQuestionIndex] = useState(0);
  const [score, setScore] = useState(0);
  const [selectedAnswer, setSelectedAnswer] = useState<number | null>(null);
  const [isAnswered, setIsAnswered] = useState(false);

  useEffect(() => {
    // Select 10 random questions for the lesson
    const lessonQuestions = MOCK_QUESTIONS.filter(q => q.lessonId === lesson.id);
    const shuffled = [...lessonQuestions].sort(() => 0.5 - Math.random());
    setQuestions(shuffled.slice(0, 10));
  }, [lesson.id]);

  const handleAnswerSelect = (index: number) => {
    if (isAnswered) return;
    setSelectedAnswer(index);
    setIsAnswered(true);
    if (index === questions[currentQuestionIndex].correctAnswerIndex) {
      setScore(s => s + 1);
    }
  };

  const handleNext = () => {
    if (currentQuestionIndex < questions.length - 1) {
      setCurrentQuestionIndex(i => i + 1);
      setSelectedAnswer(null);
      setIsAnswered(false);
    } else {
      onQuizComplete(lesson.id, score, questions.length);
    }
  };

  if (questions.length === 0) {
    return (
        <div className="p-4 flex flex-col items-center justify-center h-full">
            <p className="text-xl">No quiz available for this lesson.</p>
            <button onClick={onBack} className="mt-4 bg-cyan-500 text-white font-bold py-2 px-4 rounded-lg">Go Back</button>
        </div>
    );
  }

  const currentQuestion = questions[currentQuestionIndex];
  const progressPercentage = ((currentQuestionIndex + 1) / questions.length) * 100;

  return (
    <div className="p-4 flex flex-col h-full">
      <div className="flex items-center justify-between mb-4">
        <button onClick={onBack} className="p-2 rounded-full hover:bg-white/10 transition-colors">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M18 6 6 18"/><path d="m6 6 12 12"/></svg>
        </button>
        <div className="font-bold text-cyan-400">{`Score: ${score}`}</div>
      </div>
      
      <div className="w-full bg-gray-700 rounded-full h-2.5 mb-6">
        <div className="bg-cyan-500 h-2.5 rounded-full" style={{ width: `${progressPercentage}%` }}></div>
      </div>

      <div className="flex-grow flex flex-col justify-center">
        <h2 className="text-2xl font-semibold mb-8 text-center">{currentQuestion.questionText}</h2>
        <div className="space-y-4">
          {currentQuestion.options.map((option, index) => {
            const isCorrect = index === currentQuestion.correctAnswerIndex;
            let buttonClass = 'bg-gray-800/80 border-white/20 hover:bg-cyan-500/20';
            if (isAnswered) {
              if (index === selectedAnswer) {
                buttonClass = isCorrect ? 'bg-green-500 border-green-400' : 'bg-red-500 border-red-400';
              } else if (isCorrect) {
                 buttonClass = 'bg-green-500/50 border-green-400 animate-pulse';
              }
            }
            return (
              <button
                key={index}
                onClick={() => handleAnswerSelect(index)}
                disabled={isAnswered}
                className={`w-full text-left p-4 rounded-lg border text-lg transition-all duration-300 ${buttonClass}`}
              >
                {option}
              </button>
            );
          })}
        </div>
      </div>

      {isAnswered && (
        <div className="mt-8">
          <button onClick={handleNext} className="w-full bg-gradient-to-r from-cyan-500 to-blue-600 text-white font-bold text-lg py-4 px-4 rounded-xl shadow-lg shadow-cyan-500/30">
            {currentQuestionIndex < questions.length - 1 ? 'Next' : 'Finish Quiz'}
          </button>
        </div>
      )}
    </div>
  );
};

export default QuizView;
