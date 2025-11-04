
import React from 'react';
import { View } from '../types';
import { HomeIcon } from './icons/HomeIcon';
import { ProgressIcon } from './icons/ProgressIcon';
import { AiFriendIcon } from './icons/AiFriendIcon';
import { SettingsIcon } from './icons/SettingsIcon';

interface BottomNavProps {
  currentView: View;
  setCurrentView: (view: View) => void;
  onResetNavigation: () => void;
}

const BottomNav: React.FC<BottomNavProps> = ({ currentView, setCurrentView, onResetNavigation }) => {
  const navItems: { view: View; label: string; icon: React.ReactNode }[] = [
    { view: 'home', label: 'Home', icon: <HomeIcon /> },
    { view: 'progress', label: 'Progress', icon: <ProgressIcon /> },
    { view: 'aiFriend', label: 'AI Friend', icon: <AiFriendIcon /> },
    { view: 'settings', label: 'Settings', icon: <SettingsIcon /> },
  ];

  const handleNavClick = (view: View) => {
    onResetNavigation();
    setCurrentView(view);
  }

  return (
    <nav className="fixed bottom-0 left-0 right-0 max-w-lg mx-auto h-16 bg-gray-900/80 dark:bg-black/50 backdrop-blur-lg border-t border-white/10">
      <div className="flex justify-around items-center h-full">
        {navItems.map(({ view, label, icon }) => {
          const isActive = currentView === view;
          return (
            <button
              key={view}
              onClick={() => handleNavClick(view)}
              className={`flex flex-col items-center justify-center w-full h-full transition-colors duration-200 ${isActive ? 'text-cyan-400' : 'text-gray-400 hover:text-white'}`}
            >
              <div className={`w-6 h-6 mb-1 ${isActive ? 'scale-110' : ''} transition-transform`}>{icon}</div>
              <span className="text-xs font-medium">{label}</span>
            </button>
          );
        })}
      </div>
    </nav>
  );
};

export default BottomNav;
