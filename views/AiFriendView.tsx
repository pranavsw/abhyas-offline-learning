
import React, { useState, useRef, useEffect } from 'react';
import { Lesson } from '../types';
import { MOCK_LESSONS } from '../data/mockData';

interface AiFriendViewProps {
  onSelectLesson: (lesson: Lesson) => void;
}

interface Message {
    text: string | React.ReactNode;
    sender: 'user' | 'ai';
}

const AiFriendView: React.FC<AiFriendViewProps> = ({ onSelectLesson }) => {
    const [messages, setMessages] = useState<Message[]>([
        { sender: 'ai', text: 'Hello Priya! Ask me anything about your subjects, and I\'ll find the answer in your downloaded lessons.' },
    ]);
    const [input, setInput] = useState('');
    const [isTyping, setIsTyping] = useState(false);
    const messagesEndRef = useRef<HTMLDivElement>(null);

    const scrollToBottom = () => {
        messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' });
    };

    useEffect(scrollToBottom, [messages]);

    const getAiResponse = (query: string): React.ReactNode => {
        const lowerQuery = query.toLowerCase();
        if (lowerQuery.includes('photosynthesis')) {
            return (
                <span>
                    Photosynthesis is how plants make food. I found a lesson about it. 
                    <button onClick={() => onSelectLesson(MOCK_LESSONS['sci1'])} className="text-cyan-400 underline ml-1">
                        View Lesson
                    </button>
                </span>
            );
        }
        if (lowerQuery.includes('gravity')) {
            return (
                <span>
                    Isaac Newton's Law of Gravity explains why things fall down. I have a lesson on it.
                    <button onClick={() => onSelectLesson(MOCK_LESSONS['sci2'])} className="text-cyan-400 underline ml-1">
                        View Lesson
                    </button>
                </span>
            );
        }
        if (lowerQuery.includes('triangle') || lowerQuery.includes('pythagorean')) {
             return (
                <span>
                    The Pythagorean theorem (a² + b² = c²) is used for right-angled triangles. Here's the lesson.
                    <button onClick={() => onSelectLesson(MOCK_LESSONS['math1'])} className="text-cyan-400 underline ml-1">
                        View Lesson
                    </button>
                </span>
            );
        }
        return "I'm sorry, I couldn't find information about that in your downloaded content. Try asking about a specific topic like 'gravity' or 'algebra'.";
    };

    const handleSend = () => {
        if (input.trim() === '') return;
        
        const userMessage: Message = { sender: 'user', text: input };
        setMessages(prev => [...prev, userMessage]);
        setInput('');
        setIsTyping(true);

        setTimeout(() => {
            const aiResponseText = getAiResponse(input);
            const aiMessage: Message = { sender: 'ai', text: aiResponseText };
            setMessages(prev => [...prev, aiMessage]);
            setIsTyping(false);
        }, 1500);
    };

    return (
        <div className="p-4 flex flex-col h-full">
            <h1 className="text-3xl font-bold mb-6 text-gray-200">AI Friend</h1>
            <div className="flex-grow space-y-4 overflow-y-auto no-scrollbar pb-4">
                {messages.map((msg, index) => (
                    <div key={index} className={`flex ${msg.sender === 'user' ? 'justify-end' : 'justify-start'}`}>
                        <div className={`max-w-xs md:max-w-md px-4 py-2 rounded-2xl ${msg.sender === 'user' ? 'bg-blue-600 text-white rounded-br-none' : 'bg-gray-700 text-gray-200 rounded-bl-none'}`}>
                            {msg.text}
                        </div>
                    </div>
                ))}
                {isTyping && (
                    <div className="flex justify-start">
                         <div className="max-w-xs md:max-w-md px-4 py-2 rounded-2xl bg-gray-700 text-gray-200 rounded-bl-none">
                            <div className="flex items-center space-x-1">
                                <span className="w-2 h-2 bg-gray-400 rounded-full animate-pulse delay-0"></span>
                                <span className="w-2 h-2 bg-gray-400 rounded-full animate-pulse delay-200"></span>
                                <span className="w-2 h-2 bg-gray-400 rounded-full animate-pulse delay-400"></span>
                            </div>
                        </div>
                    </div>
                )}
                <div ref={messagesEndRef} />
            </div>
            <div className="mt-4 flex gap-2">
                <input
                    type="text"
                    value={input}
                    onChange={(e) => setInput(e.target.value)}
                    onKeyPress={(e) => e.key === 'Enter' && handleSend()}
                    placeholder="Ask a question..."
                    className="flex-grow bg-gray-800 border border-gray-600 rounded-full py-2 px-4 focus:outline-none focus:ring-2 focus:ring-cyan-500"
                />
                <button onClick={handleSend} className="bg-cyan-500 rounded-full w-10 h-10 flex items-center justify-center text-white flex-shrink-0">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><line x1="22" y1="2" x2="11" y2="13"></line><polygon points="22 2 15 22 11 13 2 9 22 2"></polygon></svg>
                </button>
            </div>
        </div>
    );
};

export default AiFriendView;
