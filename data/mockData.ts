
import { Subject, Lesson, Question, QuizAttempt } from '../types';

export const MOCK_SUBJECTS: Subject[] = [
  { id: 'sci', name: 'Science', icon: '🧪', color: 'from-blue-500 to-cyan-400' },
  { id: 'math', name: 'Math', icon: '📐', color: 'from-orange-500 to-yellow-400' },
  { id: 'hist', name: 'History', icon: '📜', color: 'from-amber-600 to-yellow-500' },
  { id: 'geo', name: 'Geography', icon: '🌍', color: 'from-green-500 to-teal-400' },
  { id: 'eng', name: 'English', icon: '📚', color: 'from-indigo-500 to-purple-400' },
  { id: 'cs', name: 'Computers', icon: '💻', color: 'from-slate-600 to-gray-500' },
];

export const MOCK_LESSONS_ARRAY: Lesson[] = [
  // Science
  { id: 'sci1', subjectId: 'sci', title: 'Photosynthesis', content: 'Photosynthesis is a process used by plants and other organisms to convert light energy into chemical energy, through a cellular process that creates oxygen and glucose. This process is crucial for life on Earth as it provides most of the oxygen in the atmosphere. The main components required are sunlight, water, and carbon dioxide.', contentType: ['text', 'image'], downloadStatus: 100 },
  { id: 'sci2', subjectId: 'sci', title: 'The Law of Gravity', content: 'The law of universal gravitation, formulated by Isaac Newton, states that every particle attracts every other particle in the universe with a force which is directly proportional to the product of their masses and inversely proportional to the square of the distance between their centers. It explains why planets orbit the sun and why objects fall to the ground.', contentType: ['text', 'video'], downloadStatus: 75 },
  { id: 'sci3', subjectId: 'sci', title: 'Magnetism', content: 'Magnetism is a class of physical phenomena that are mediated by magnetic fields. Electric currents and the magnetic moments of elementary particles give rise to a magnetic field, which acts on other currents and magnetic moments. Every material is influenced to some extent by a magnetic field.', contentType: ['text'], downloadStatus: 100 },
  // Math
  { id: 'math1', subjectId: 'math', title: 'Pythagorean Theorem', content: 'In a right-angled triangle, the square of the hypotenuse side is equal to the sum of squares of the other two sides. This is represented by the formula a² + b² = c², where c is the hypotenuse. The theorem is fundamental to Euclidean geometry.', contentType: ['text', 'image'], downloadStatus: 100 },
  { id: 'math2', subjectId: 'math', title: 'Basic Algebra', content: 'Algebra is a branch of mathematics that substitutes letters for numbers. An algebraic equation represents a scale, what is done on one side of the scale with a number is also done to the other side of the scale. The letters are called variables or unknowns.', contentType: ['text'], downloadStatus: 50 },
  // History
  { id: 'hist1', subjectId: 'hist', title: 'The Indus Valley Civilization', content: 'The Indus Valley Civilization was a Bronze Age civilization in the northwestern regions of South Asia, lasting from 3300 BCE to 1300 BCE. It was one of three early civilizations of the Near East and South Asia, and of the three, the most widespread. Its cities were noted for their urban planning and advanced water management systems.', contentType: ['text', 'image'], downloadStatus: 100 },
];

export const MOCK_LESSONS: { [key: string]: Lesson } = MOCK_LESSONS_ARRAY.reduce((acc, lesson) => {
    acc[lesson.id] = lesson;
    return acc;
}, {} as { [key: string]: Lesson });


export const MOCK_QUESTIONS: Question[] = [
  // Photosynthesis
  { id: 'q1s1', lessonId: 'sci1', questionText: 'What is the primary source of energy for photosynthesis?', options: ['Water', 'Sunlight', 'Carbon Dioxide', 'Oxygen'], correctAnswerIndex: 1 },
  { id: 'q2s1', lessonId: 'sci1', questionText: 'Which gas is a byproduct of photosynthesis?', options: ['Nitrogen', 'Carbon Monoxide', 'Oxygen', 'Hydrogen'], correctAnswerIndex: 2 },
  { id: 'q3s1', lessonId: 'sci1', questionText: 'What are the main inputs for photosynthesis?', options: ['Sunlight, Water, Carbon Dioxide', 'Oxygen, Sugar, Water', 'Sunlight, Oxygen, Nitrogen', 'Water, Soil, Oxygen'], correctAnswerIndex: 0 },
  // Gravity
  { id: 'q1s2', lessonId: 'sci2', questionText: 'Who formulated the law of universal gravitation?', options: ['Albert Einstein', 'Galileo Galilei', 'Isaac Newton', 'Nikola Tesla'], correctAnswerIndex: 2 },
  { id: 'q2s2', lessonId: 'sci2', questionText: 'Gravity is inversely proportional to the square of what?', options: ['Mass', 'Speed', 'Distance', 'Time'], correctAnswerIndex: 2 },
  // Pythagorean Theorem
  { id: 'q1m1', lessonId: 'math1', questionText: 'The Pythagorean theorem applies to which type of triangle?', options: ['Acute', 'Obtuse', 'Scalene', 'Right-angled'], correctAnswerIndex: 3 },
  { id: 'q2m1', lessonId: 'math1', questionText: 'In a² + b² = c², what does "c" represent?', options: ['The shortest side', 'The area', 'The hypotenuse', 'The angle'], correctAnswerIndex: 2 },
  // More questions for a 10-question quiz
  { id: 'q4s1', lessonId: 'sci1', questionText: 'What sugar is produced during photosynthesis?', options: ['Fructose', 'Sucrose', 'Glucose', 'Lactose'], correctAnswerIndex: 2 },
  { id: 'q5s1', lessonId: 'sci1', questionText: 'Where in the plant cell does photosynthesis occur?', options: ['Nucleus', 'Mitochondria', 'Ribosome', 'Chloroplasts'], correctAnswerIndex: 3 },
  { id: 'q6s1', lessonId: 'sci1', questionText: 'What is the role of chlorophyll?', options: ['Absorb light energy', 'Store water', 'Release oxygen', 'Create CO2'], correctAnswerIndex: 0 },
  { id: 'q7s1', lessonId: 'sci1', questionText: 'Which of these is NOT required for photosynthesis?', options: ['Water', 'Light', 'Nitrogen', 'Carbon Dioxide'], correctAnswerIndex: 2 },
  { id: 'q8s1', lessonId: 'sci1', questionText: 'The chemical formula for glucose is?', options: ['H2O', 'CO2', 'O2', 'C6H12O6'], correctAnswerIndex: 3 },
  { id: 'q9s1', lessonId: 'sci1', questionText: 'What is the opposite process of photosynthesis?', options: ['Respiration', 'Transpiration', 'Evaporation', 'Digestion'], correctAnswerIndex: 0 },
  { id: 'q10s1', lessonId: 'sci1', questionText: 'Plants are considered:', options: ['Consumers', 'Producers', 'Decomposers', 'Scavengers'], correctAnswerIndex: 1 },
];

export const MOCK_QUIZ_ATTEMPTS: QuizAttempt[] = [
    { id: 'qa1', lessonId: 'sci3', score: 7, total: 10, timestamp: new Date(Date.now() - 86400000).toISOString() }, // 1 day ago
    { id: 'qa2', lessonId: 'math1', score: 9, total: 10, timestamp: new Date(Date.now() - 172800000).toISOString() }, // 2 days ago
];
