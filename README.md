# Abhyas — Offline Learning Platform

<div align="center">

**A modern, AI-powered offline-first learning application built with React, TypeScript, and Vite**

[Quick Start](#quick-start) • [Architecture](#architecture) • [API Integration](#api-integration) • [Development](#development)

</div>

---

## Overview

Abhyas is a progressive web application designed for offline learning. It provides:

- **Subject & Lesson Management**: Browse structured subjects with lessons organized hierarchically
- **Interactive Reading Experience**: Built-in lesson reader with content type support (text, video, image)
- **AI-Powered Summarization**: Optional Google Gemini API integration for intelligent text summarization
- **Quiz System**: Quick quizzes with instant feedback to reinforce learning
- **Progress Tracking**: Dashboard to monitor learning progress and quiz attempts
- **AI Study Assistant**: AI Friend feature for personalized learning support
- **Offline-First Design**: Core functionality works offline; AI features gracefully degrade
- **Theme Support**: Dark and light mode for comfortable learning at any time

---

## Tech Stack

| Layer               | Technology                            |
| ------------------- | ------------------------------------- |
| **UI Framework**    | React 19.2.0                          |
| **Language**        | TypeScript 5.8.2                      |
| **Build Tool**      | Vite 6.2.0                            |
| **AI/ML**           | Google GenAI (`@google/genai` 1.28.0) |
| **Node Version**    | 14+                                   |
| **Package Manager** | npm                                   |

---

## Project Structure

```
abhyas/
├── App.tsx                    # Main app component & routing logic
├── index.tsx                  # React DOM entry point
├── index.html                 # HTML template
├── types.ts                   # TypeScript type definitions
├── metadata.json              # App metadata & configuration
├── package.json               # Dependencies & npm scripts
├── tsconfig.json              # TypeScript compiler configuration
├── vite.config.ts             # Vite build configuration
│
├── components/                # Reusable UI components
│   ├── BottomNav.tsx          # Navigation bar component
│   ├── Header.tsx             # Header component
│   ├── LessonListItem.tsx      # Lesson list item component
│   ├── SubjectCard.tsx         # Subject card component
│   └── icons/                 # Icon components (SVG/React)
│       ├── HomeIcon.tsx
│       ├── ProgressIcon.tsx
│       ├── AiFriendIcon.tsx
│       └── SettingsIcon.tsx
│
├── views/                     # Page/screen components
│   ├── HomeView.tsx           # Home dashboard
│   ├── LessonListView.tsx      # Subject's lesson list
│   ├── LessonView.tsx          # Lesson reader with AI summarization
│   ├── QuizView.tsx            # Quiz taking interface
│   ├── ProgressView.tsx        # Progress/analytics dashboard
│   ├── AiFriendView.tsx        # AI assistant interface
│   └── SettingsView.tsx        # App settings & preferences
│
├── services/                  # Business logic & external services
│   └── geminiService.ts        # Google Gemini API integration
│
└── data/                      # Mock data & fixtures
    └── mockData.ts            # Sample subjects, lessons, quiz attempts
```

---

## Type System

The app uses TypeScript with strict type checking. Core types are defined in `types.ts`:

### Core Interfaces

```typescript
Theme: 'light' | 'dark'
View: 'home' | 'progress' | 'aiFriend' | 'settings'

Subject {
  id: string
  name: string
  icon: string                    // Emoji or SVG
  color: string                   // Tailwind color class
}

Lesson {
  id: string
  subjectId: string
  title: string
  content: string                 // Long text content
  contentType: ('text'|'video'|'image')[]
  downloadStatus: number          // 0-100 (offline download progress)
}

Question {
  id: string
  lessonId: string
  questionText: string
  options: string[]
  correctAnswerIndex: number
}

QuizAttempt {
  id: string
  lessonId: string
  score: number
  total: number
  timestamp: string
}
```

---

## Quick Start

### Prerequisites

- **Node.js** 14.0 or higher
- **npm** 6.0 or higher
- **Google Gemini API Key** (optional, for AI summarization features)

### Installation & Setup

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd abhyas
   ```

2. **Install dependencies**

   ```bash
   npm install
   ```

3. **Configure API Key** (optional)
   Create a `.env.local` file in the project root:

   ```env
   GEMINI_API_KEY=your_api_key_here
   ```

   Get your API key from [Google AI Studio](https://aistudio.google.com/)

4. **Start development server**

   ```bash
   npm run dev
   ```

   The app runs on `http://localhost:3000`

5. **Build for production**

   ```bash
   npm run build
   ```

6. **Preview production build**
   ```bash
   npm run preview
   ```

---

## Architecture

### State Management

The app uses React's built-in `useState` and `useContext` for state management:

- **Global State** (`App.tsx`): Theme, current view, selected subject/lesson, quiz attempts
- **Local State**: Component-level state for forms, animations, UI interactions

### Navigation Flow

```
Home → Select Subject → Select Lesson → Lesson View
                                      ↓
                            Summarize (AI) / Read Aloud
                                      ↓
                                  Start Quiz
                                      ↓
                              Quiz Results → Progress
```

### Component Hierarchy

```
<App>
  ├── <Header>
  ├── {CurrentView}
  │   ├── <HomeView>
  │   ├── <LessonListView>
  │   │   └── <LessonListItem> (repeated)
  │   ├── <LessonView>
  │   ├── <QuizView>
  │   ├── <ProgressView>
  │   ├── <AiFriendView>
  │   └── <SettingsView>
  └── <BottomNav>
```

---

## API Integration

### Google Gemini API

The app integrates with Google's Gemini API for AI-powered text summarization.

**Service**: `services/geminiService.ts`

#### Key Functions

**`summarizeText(text: string): Promise<string>`**

- Takes lesson content and returns a student-friendly 5-10 sentence summary
- Uses `gemini-2.5-flash` model for fast, efficient summarization
- Returns error message if API unavailable or request fails

```typescript
const summary = await summarizeText(lessonContent);
```

**`isGeminiAvailable(): boolean`**

- Checks if Gemini API is configured and ready
- Used to conditionally enable/disable summarization UI
- Returns `true` if `GEMINI_API_KEY` is set, `false` otherwise

```typescript
if (isGeminiAvailable()) {
  // Show "Summarize" button
}
```

### Error Handling

- Missing API key: Feature gracefully disabled with console warning
- Network errors: User-friendly error message displayed
- Rate limiting: Handled by Google GenAI SDK

---

## Configuration

### Build Configuration (`vite.config.ts`)

```typescript
// Development server runs on port 3000
server: { port: 3000, host: '0.0.0.0' }

// Environment variables exposed to app
define: {
  'process.env.GEMINI_API_KEY': JSON.stringify(env.GEMINI_API_KEY)
}

// Path alias for imports
resolve.alias: { '@': path.resolve(__dirname, '.') }
```

### TypeScript Configuration (`tsconfig.json`)

- **Target**: ES2022
- **Module**: ESNext
- **JSX**: react-jsx (React 17+ automatic JSX runtime)
- **Strict Mode**: Enabled for type safety
- **Path Alias**: `@/*` resolves to project root

---

## Development

### Adding a New Lesson

1. Add data to `data/mockData.ts`:

   ```typescript
   const MOCK_LESSONS: Lesson[] = [
     {
       id: "lesson-1",
       subjectId: "math",
       title: "Algebra Basics",
       content: "...",
       contentType: ["text", "video"],
       downloadStatus: 100,
     },
   ];
   ```

2. Reference in your view component using the type-safe `Lesson` interface

### Adding a New Component

1. Create component in `components/` or `components/icons/`
2. Use TypeScript + React hooks
3. Import and use in parent component

Example:

```typescript
// components/NewFeature.tsx
import React from "react";

const NewFeature: React.FC = () => {
  return <div>Feature</div>;
};

export default NewFeature;
```

### Adding a New View

1. Create component in `views/`
2. Add to `App.tsx` view enum and switch statement
3. Wire up navigation in `BottomNav.tsx`

### Running Tests

Currently, no test suite is configured. To add testing:

```bash
npm install --save-dev vitest @testing-library/react @testing-library/jest-dom
```

Then create `.test.tsx` files and run:

```bash
npm run test
```

---

## Environment Variables

| Variable         | Required | Purpose                                      |
| ---------------- | -------- | -------------------------------------------- |
| `GEMINI_API_KEY` | No       | Google Gemini API key for text summarization |

**.env.local** (Git-ignored, local only):

```env
GEMINI_API_KEY=sk-...
```

---

## Performance Considerations

- **Code Splitting**: Vite automatically chunks routes for optimal loading
- **Tree Shaking**: Unused code eliminated during build
- **Lazy Loading**: Consider lazy-loading views as app grows
- **Image Optimization**: Use lightweight formats for lesson images
- **Caching**: Service workers can be added for offline support

---

## Browser Support

- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+

---

## Common Issues & Troubleshooting

| Issue                                    | Solution                                                                |
| ---------------------------------------- | ----------------------------------------------------------------------- |
| Port 3000 already in use                 | Change `vite.config.ts` server port or kill process                     |
| API key not working                      | Verify key in `.env.local` and check API quotas in Google Cloud Console |
| React components not rendering           | Clear browser cache, restart dev server                                 |
| TypeScript errors                        | Run `npm run build` to check for errors                                 |
| Hot Module Replacement (HMR) not working | Check Vite config and browser console for errors                        |

---

## Security Best Practices

1. **Never commit `.env.local`** — Add to `.gitignore`
2. **API Keys in environment variables** — Never hardcode in source
3. **Validate user input** — Sanitize quiz answers and lesson content
4. **CORS**: Configure Vite to proxy API calls if needed
5. **Content Security Policy**: Implement CSP headers for production

---

## Future Enhancements

- [ ] Offline data persistence with IndexedDB
- [ ] Service Worker for true offline support
- [ ] User authentication & cloud sync
- [ ] Advanced analytics & learning metrics
- [ ] Video lesson support with streaming
- [ ] Multi-language support
- [ ] Accessibility improvements (ARIA labels)
- [ ] Dark mode toggle persistence
- [ ] Push notifications for lesson reminders
- [ ] Export/import user progress

---

## Contributing

1. Create a new branch: `git checkout -b feature/my-feature`
2. Make changes and commit: `git commit -m "Add new feature"`
3. Push and open a Pull Request
4. Ensure code is TypeScript-safe and follows project structure

---

## License

MIT License — feel free to use for personal or commercial projects.

---

## Support & Documentation

- **React Docs**: https://react.dev
- **Vite Docs**: https://vite.dev
- **TypeScript Docs**: https://www.typescriptlang.org
- **Google GenAI SDK**: https://www.npmjs.com/package/@google/genai
- **Tailwind CSS**: https://tailwindcss.com (if used for styling)

---

## Contact & Feedback

For questions or suggestions, please open an issue or contact the development team.
