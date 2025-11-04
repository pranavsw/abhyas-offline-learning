
export type Theme = 'light' | 'dark';
export type View = 'home' | 'progress' | 'aiFriend' | 'settings';

export interface Subject {
  id: string;
  name: string;
  icon: string; // Emoji or SVG string
  color: string; // Tailwind color class
}

export interface Lesson {
  id: string;
  subjectId: string;
  title: string;
  content: string; // Long text content
  contentType: ('text' | 'video' | 'image')[];
  downloadStatus: number; // 0 to 100
}

export interface Question {
  id: string;
  lessonId: string;
  questionText: string;
  options: string[];
  correctAnswerIndex: number;
}

export interface QuizAttempt {
  id: string;
  lessonId: string;
  score: number;
  total: number;
  timestamp: string;
}
