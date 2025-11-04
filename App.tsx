
import React, { useState, useEffect } from 'react';
import { Theme, View, Subject, Lesson, QuizAttempt } from './types';
import { MOCK_SUBJECTS, MOCK_LESSONS, MOCK_QUIZ_ATTEMPTS } from './data/mockData';
import BottomNav from './components/BottomNav';
import HomeView from './views/HomeView';
import LessonListView from './views/LessonListView';
import LessonView from './views/LessonView';
import QuizView from './views/QuizView';
import ProgressView from './views/ProgressView';
import AiFriendView from './views/AiFriendView';
import SettingsView from './views/SettingsView';

const App: React.FC = () => {
  const [theme, setTheme] = useState<Theme>('dark');
  const [currentView, setCurrentView] = useState<View>('home');
  
  // Navigation state
  const [selectedSubject, setSelectedSubject] = useState<Subject | null>(null);
  const [selectedLesson, setSelectedLesson] = useState<Lesson | null>(null);
  const [activeQuiz, setActiveQuiz] = useState<Lesson | null>(null);

  const [quizAttempts, setQuizAttempts] = useState<QuizAttempt[]>(MOCK_QUIZ_ATTEMPTS);

  useEffect(() => {
    const root = window.document.documentElement;
    root.classList.remove(theme === 'light' ? 'dark' : 'light');
    root.classList.add(theme);
    if (theme === 'dark') {
      document.body.style.backgroundColor = '#0a0f1f';
    } else {
      document.body.style.backgroundColor = '#f3f4f6';
    }
  }, [theme]);

  const handleSelectSubject = (subject: Subject) => {
    setSelectedSubject(subject);
  };

  const handleSelectLesson = (lesson: Lesson) => {
    setSelectedLesson(lesson);
  };

  const handleStartQuiz = (lesson: Lesson) => {
    setActiveQuiz(lesson);
  };

  const handleQuizComplete = (lessonId: string, score: number, total: number) => {
    const newAttempt: QuizAttempt = {
      id: `qa${Date.now()}`,
      lessonId,
      score,
      total,
      timestamp: new Date().toISOString(),
    };
    setQuizAttempts(prev => [newAttempt, ...prev]);
    setActiveQuiz(null);
    setSelectedLesson(MOCK_LESSONS[lessonId]); // Go back to lesson view
  };

  const handleBack = () => {
    if (activeQuiz) {
        setActiveQuiz(null);
        setSelectedLesson(MOCK_LESSONS[activeQuiz.id]);
    } else if (selectedLesson) {
        setSelectedLesson(null);
        setSelectedSubject(MOCK_SUBJECTS.find(s => s.id === MOCK_LESSONS[selectedLesson.id].subjectId) || null);
    } else if (selectedSubject) {
        setSelectedSubject(null);
        setCurrentView('home');
    }
  };

  const renderContent = () => {
    if (activeQuiz) {
      return <QuizView lesson={activeQuiz} onQuizComplete={handleQuizComplete} onBack={handleBack} />;
    }
    if (selectedLesson) {
      return <LessonView lesson={selectedLesson} onStartQuiz={handleStartQuiz} onBack={handleBack} />;
    }
    if (selectedSubject) {
      return <LessonListView subject={selectedSubject} onSelectLesson={handleSelectLesson} onBack={handleBack} quizAttempts={quizAttempts} />;
    }
    
    switch (currentView) {
      case 'home':
        return <HomeView onSelectSubject={handleSelectSubject} />;
      case 'progress':
        return <ProgressView quizAttempts={quizAttempts} />;
      case 'aiFriend':
        return <AiFriendView onSelectLesson={handleSelectLesson} />;
      case 'settings':
        return <SettingsView theme={theme} onThemeChange={setTheme} />;
      default:
        return <HomeView onSelectSubject={handleSelectSubject} />;
    }
  };

  return (
    <div className={`${theme} min-h-screen font-sans text-sm md:text-base`}>
      <div className={`flex flex-col h-screen max-w-lg mx-auto ${theme === 'dark' ? 'bg-[#0a0f1f] text-gray-200' : 'bg-gray-100 text-gray-800'}`}>
        <main className="flex-grow overflow-y-auto no-scrollbar pb-20">
          {renderContent()}
        </main>
        <BottomNav currentView={currentView} setCurrentView={setCurrentView} onResetNavigation={() => {
            setSelectedSubject(null);
            setSelectedLesson(null);
            setActiveQuiz(null);
        }} />
      </div>
    </div>
  );
};

export default App;
