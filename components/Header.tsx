
import React from 'react';

const Header: React.FC = () => {
  return (
    <header className="p-4 flex justify-between items-center">
        <h1 className="text-2xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-cyan-400 to-blue-500">Abhyas</h1>
        <div className="text-right">
            <p className="text-lg font-semibold text-gray-300">Hi, Priya</p>
        </div>
    </header>
  );
};

export default Header;
