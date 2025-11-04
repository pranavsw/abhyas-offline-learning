
import React, { useState, useEffect } from 'react';
import { Subject } from '../types';
import { MOCK_SUBJECTS } from '../data/mockData';
import Header from '../components/Header';
import SubjectCard from '../components/SubjectCard';

interface HomeViewProps {
  onSelectSubject: (subject: Subject) => void;
}

const HomeView: React.FC<HomeViewProps> = ({ onSelectSubject }) => {
  const [syncStatus, setSyncStatus] = useState<'offline' | 'syncing' | 'synced'>('offline');
  
  useEffect(() => {
    // Simulate connectivity check
    const timer = setTimeout(() => setSyncStatus('syncing'), 2000);
    const timer2 = setTimeout(() => setSyncStatus('synced'), 5000);
    return () => {
        clearTimeout(timer);
        clearTimeout(timer2);
    };
  }, []);

  const getStatusMessage = () => {
    switch (syncStatus) {
      case 'offline': return "☁️ Offline. Last synced: 2 days ago.";
      case 'syncing': return "🔄 Syncing...";
      case 'synced': return "✅ Synced just now.";
    }
  };

  return (
    <div className="flex flex-col h-full">
      <Header />
      <div className="p-4 flex-grow">
        <h2 className="text-xl font-bold mb-4 text-gray-300">Your Subjects</h2>
        <div className="grid grid-cols-2 gap-4">
          {MOCK_SUBJECTS.map((subject) => (
            <SubjectCard key={subject.id} subject={subject} onClick={() => onSelectSubject(subject)} />
          ))}
        </div>
      </div>
      <footer className="sticky bottom-0 left-0 right-0 p-2 text-center text-xs text-gray-400 bg-gray-900/50 dark:bg-black/30 backdrop-blur-sm">
        {getStatusMessage()}
      </footer>
    </div>
  );
};

export default HomeView;
