
import React from 'react';
import { QuizAttempt } from '../types';
import { MOCK_LESSONS } from '../data/mockData';

interface ProgressViewProps {
  quizAttempts: QuizAttempt[];
}

const ProgressView: React.FC<ProgressViewProps> = ({ quizAttempts }) => {
  const sortedAttempts = [...quizAttempts].sort((a, b) => new Date(b.timestamp).getTime() - new Date(a.timestamp).getTime());

  return (
    <div className="p-4">
      <h1 className="text-3xl font-bold mb-6 text-gray-200">My Progress</h1>
      {sortedAttempts.length === 0 ? (
        <p className="text-gray-400 text-center mt-8">You haven't completed any quizzes yet. Keep learning!</p>
      ) : (
        <ul className="space-y-3">
          {sortedAttempts.map(attempt => {
            const lesson = MOCK_LESSONS[attempt.lessonId];
            if (!lesson) return null;

            const scoreColor = attempt.score / attempt.total >= 0.8 ? 'text-green-400' : attempt.score / attempt.total >= 0.5 ? 'text-yellow-400' : 'text-red-400';

            return (
              <li key={attempt.id} className="bg-gray-800/50 dark:bg-black/30 backdrop-blur-sm rounded-lg p-4 flex justify-between items-center border border-white/10">
                <div>
                  <h3 className="font-semibold text-lg">{lesson.title}</h3>
                  <p className="text-sm text-gray-400">{new Date(attempt.timestamp).toLocaleDateString()}</p>
                </div>
                <div className={`text-2xl font-bold ${scoreColor}`}>
                  {attempt.score}/{attempt.total}
                </div>
              </li>
            );
          })}
        </ul>
      )}
    </div>
  );
};

export default ProgressView;
