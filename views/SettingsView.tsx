
import React from 'react';
import { Theme } from '../types';

interface SettingsViewProps {
  theme: Theme;
  onThemeChange: (theme: Theme) => void;
}

const SettingsView: React.FC<SettingsViewProps> = ({ theme, onThemeChange }) => {
  const toggleTheme = () => {
    onThemeChange(theme === 'dark' ? 'light' : 'dark');
  };

  return (
    <div className="p-4">
      <h1 className="text-3xl font-bold mb-6 text-gray-200 dark:text-gray-200">Settings</h1>
      
      <div className="bg-gray-800/50 dark:bg-black/30 backdrop-blur-sm rounded-lg p-4 border border-white/10">
        <h2 className="text-xl font-semibold mb-4 text-gray-300 dark:text-gray-300">Appearance</h2>
        <div className="flex justify-between items-center">
          <span className="text-gray-300 dark:text-gray-300">Dark Mode</span>
          <button
            onClick={toggleTheme}
            className={`relative inline-flex items-center h-6 rounded-full w-11 transition-colors ${
              theme === 'dark' ? 'bg-cyan-500' : 'bg-gray-600'
            }`}
          >
            <span
              className={`inline-block w-4 h-4 transform bg-white rounded-full transition-transform ${
                theme === 'dark' ? 'translate-x-6' : 'translate-x-1'
              }`}
            />
          </button>
        </div>
      </div>

      <div className="mt-6 bg-gray-800/50 dark:bg-black/30 backdrop-blur-sm rounded-lg p-4 border border-white/10">
        <h2 className="text-xl font-semibold mb-4 text-gray-300 dark:text-gray-300">Data & Sync</h2>
        <div className="flex justify-between items-center mb-4">
          <span className="text-gray-400 dark:text-gray-400">Last Synced</span>
          <span className="font-medium text-gray-300 dark:text-gray-300">Today at 10:30 AM</span>
        </div>
        <button
          onClick={() => alert("Syncing not implemented.")}
          className="w-full bg-cyan-500/80 text-white font-bold py-3 px-4 rounded-lg hover:bg-cyan-500 transition-colors"
        >
          Sync Now
        </button>
      </div>

       <div className="mt-6 bg-gray-800/50 dark:bg-black/30 backdrop-blur-sm rounded-lg p-4 border border-white/10">
        <h2 className="text-xl font-semibold mb-4 text-gray-300 dark:text-gray-300">Account</h2>
        <div className="flex justify-between items-center mb-4">
          <span className="text-gray-400 dark:text-gray-400">Logged in as</span>
          <span className="font-medium text-gray-300 dark:text-gray-300">priya@example.com</span>
        </div>
        <button className="w-full bg-red-500/80 text-white font-bold py-3 px-4 rounded-lg hover:bg-red-500 transition-colors">
          Log Out
        </button>
      </div>
    </div>
  );
};

export default SettingsView;
