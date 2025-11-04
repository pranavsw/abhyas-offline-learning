
import React from 'react';
import { Subject, Lesson, QuizAttempt } from '../types';
import { MOCK_LESSONS_ARRAY } from '../data/mockData';
import LessonListItem from '../components/LessonListItem';

interface LessonListViewProps {
  subject: Subject;
  onSelectLesson: (lesson: Lesson) => void;
  onBack: () => void;
  quizAttempts: QuizAttempt[];
}

const LessonListView: React.FC<LessonListViewProps> = ({ subject, onSelectLesson, onBack, quizAttempts }) => {
  const lessons = MOCK_LESSONS_ARRAY.filter(l => l.subjectId === subject.id);
  
  const getBestAttempt = (lessonId: string) => {
    return quizAttempts
      .filter(qa => qa.lessonId === lessonId)
      .sort((a, b) => b.score - a.score)[0];
  };

  return (
    <div className="p-4">
      <div className="flex items-center mb-6">
        <button onClick={onBack} className="mr-4 p-2 rounded-full hover:bg-white/10 transition-colors">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><polyline points="15 18 9 12 15 6"></polyline></svg>
        </button>
        <h1 className="text-3xl font-bold">{subject.icon} {subject.name}</h1>
      </div>
      <ul>
        {lessons.map(lesson => (
          <LessonListItem 
            key={lesson.id} 
            lesson={lesson} 
            onSelect={() => onSelectLesson(lesson)} 
            attempt={getBestAttempt(lesson.id)}
          />
        ))}
      </ul>
    </div>
  );
};

export default LessonListView;
