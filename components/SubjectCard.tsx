
import React from 'react';
import { Subject } from '../types';

interface SubjectCardProps {
  subject: Subject;
  onClick: () => void;
}

const SubjectCard: React.FC<SubjectCardProps> = ({ subject, onClick }) => {
  return (
    <div
      onClick={onClick}
      className={`relative rounded-2xl p-4 cursor-pointer overflow-hidden group transform transition-all duration-300 hover:scale-105 hover:shadow-2xl hover:shadow-cyan-500/30 bg-gradient-to-br ${subject.color}`}
    >
        <div className="absolute inset-0 bg-black/20 group-hover:bg-black/10 transition-colors duration-300"></div>
        <div className="relative z-10 flex flex-col items-start justify-between h-full">
            <div className="text-5xl">{subject.icon}</div>
            <h3 className="mt-8 text-lg font-bold text-white shadow-black/50 text-shadow">{subject.name}</h3>
        </div>
    </div>
  );
};

export default SubjectCard;
