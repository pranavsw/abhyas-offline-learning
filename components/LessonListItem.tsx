
import React from 'react';
import { Lesson, QuizAttempt } from '../types';

interface LessonListItemProps {
  lesson: Lesson;
  onSelect: () => void;
  attempt?: QuizAttempt;
}

const DownloadStatus: React.FC<{ status: number }> = ({ status }) => {
  if (status === 100) {
    return <div className="text-green-400">✓ Downloaded</div>;
  }
  return <div className="text-yellow-400">{status}%</div>;
};

const ContentTypeIcons: React.FC<{ types: ('text' | 'video' | 'image')[] }> = ({ types }) => (
  <div className="flex gap-2 text-gray-400">
    {types.includes('text') && <span title="Text">📝</span>}
    {types.includes('video') && <span title="Video">▶️</span>}
    {types.includes('image') && <span title="Image">🖼️</span>}
  </div>
);

const LessonListItem: React.FC<LessonListItemProps> = ({ lesson, onSelect, attempt }) => {
  return (
    <li
      onClick={onSelect}
      className="flex items-center justify-between p-4 bg-gray-800/50 dark:bg-black/30 backdrop-blur-sm rounded-lg my-2 cursor-pointer border border-white/10 hover:bg-cyan-500/10 transition-all duration-200"
    >
      <div className="flex-grow">
        <h3 className="font-semibold text-lg">{lesson.title}</h3>
        <div className="flex items-center gap-4 mt-1 text-sm text-gray-400">
          <ContentTypeIcons types={lesson.contentType} />
          <DownloadStatus status={lesson.downloadStatus} />
        </div>
      </div>
      {attempt && (
        <div className="text-right ml-4">
          <p className="font-bold text-lg">{`${attempt.score}/${attempt.total}`}</p>
          <p className="text-xs text-gray-500">Best Score</p>
        </div>
      )}
    </li>
  );
};

export default LessonListItem;
