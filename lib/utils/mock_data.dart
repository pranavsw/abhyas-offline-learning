import '../models/subject.dart';
import '../models/lesson.dart';
import '../models/question.dart';
import '../models/quiz_attempt.dart';

// Subjects
final List<Subject> mockSubjects = [
  const Subject(
    id: 'science',
    name: 'Science',
    icon: '🧪',
    gradientColors: [0xFF06B6D4, 0xFF3B82F6], // Cyan to Blue
  ),
  const Subject(
    id: 'math',
    name: 'Mathematics',
    icon: '📐',
    gradientColors: [0xFF8B5CF6, 0xFFEC4899], // Purple to Pink
  ),
  const Subject(
    id: 'history',
    name: 'History',
    icon: '📚',
    gradientColors: [0xFFF59E0B, 0xFFEF4444], // Amber to Red
  ),
  const Subject(
    id: 'english',
    name: 'English',
    icon: '📖',
    gradientColors: [0xFF10B981, 0xFF06B6D4], // Green to Cyan
  ),
];

// Lessons
final List<Lesson> mockLessons = [
  // Science Lessons
  const Lesson(
    id: 'sci_001',
    title: 'Introduction to Cells',
    subjectId: 'science',
    content: '''Cells are the basic building blocks of all living things. The human body is composed of trillions of cells. They provide structure for the body, take in nutrients from food, convert those nutrients into energy, and carry out specialized functions.

Cells also contain the body's hereditary material and can make copies of themselves. Cells have many parts, each with a different function. Some of these parts, called organelles, are specialized structures that perform certain tasks within the cell.

The two main types of cells are prokaryotic cells and eukaryotic cells. Prokaryotic cells are simpler and do not have a nucleus. Bacteria are prokaryotic cells. Eukaryotic cells are more complex and have a nucleus. Animals, plants, and fungi are made of eukaryotic cells.

The cell membrane is the outer boundary of the cell. It controls what enters and leaves the cell. The nucleus is the control center of the cell. It contains DNA, which holds the instructions for making proteins and other important molecules.

Mitochondria are the powerhouses of the cell. They convert nutrients into energy that the cell can use. Ribosomes are the protein factories of the cell. They read the instructions in DNA and use them to make proteins.

Understanding cells is fundamental to understanding biology. Every living organism, from the smallest bacterium to the largest whale, is made of cells. By studying cells, we learn how life works at its most basic level.''',
    contentTypes: ['text', 'image'],
    downloadStatus: 100,
    imageUrls: ['https://example.com/cell-diagram.jpg'],
  ),
  const Lesson(
    id: 'sci_002',
    title: 'The Water Cycle',
    subjectId: 'science',
    content: '''The water cycle describes how water evaporates from the surface of the earth, rises into the atmosphere, cools and condenses into rain or snow in clouds, and falls again to the surface as precipitation. The water that falls to Earth as precipitation either evaporates, is stored in various bodies of water, or infiltrates into the ground.

Evaporation is the process by which water changes from a liquid to a gas or vapor. This is the primary pathway by which water moves from the liquid state back into the water cycle as atmospheric water vapor. Studies have shown that the oceans, seas, lakes, and rivers provide nearly 90% of the moisture in our atmosphere via evaporation.

Condensation is the process by which water vapor in the air is changed into liquid water. Condensation is crucial to the water cycle because it is responsible for the formation of clouds. These clouds may produce precipitation, which is the primary route for water to return to the Earth's surface.

Precipitation is water released from clouds in the form of rain, freezing rain, sleet, snow, or hail. It is the primary connection in the water cycle that provides for the delivery of atmospheric water to the Earth. Most precipitation falls as rain.

The water cycle is powered by the sun. The sun drives the entire process by heating the water in Earth's oceans, rivers, and lakes. This heat causes the water to evaporate, rising up into the atmosphere and beginning the cycle again.''',
    contentTypes: ['text', 'video', 'image'],
    downloadStatus: 100,
    videoUrl: 'https://example.com/water-cycle.mp4',
    imageUrls: ['https://example.com/water-cycle-diagram.jpg'],
  ),
  const Lesson(
    id: 'sci_003',
    title: 'Forces and Motion',
    subjectId: 'science',
    content: '''Force is a push or pull upon an object resulting from the object's interaction with another object. Whenever there is an interaction between two objects, there is a force upon each of the objects. When the interaction ceases, the two objects no longer experience the force.

Newton's First Law states that an object at rest stays at rest and an object in motion stays in motion with the same speed and in the same direction unless acted upon by an unbalanced force. This is also known as the law of inertia.

Newton's Second Law states that the acceleration of an object depends on the mass of the object and the amount of force applied. This can be expressed with the formula F = ma, where F is force, m is mass, and a is acceleration.

Newton's Third Law states that for every action, there is an equal and opposite reaction. This means that in every interaction, there is a pair of forces acting on the two interacting objects. The size of the forces on the first object equals the size of the force on the second object.

Friction is a force that opposes motion between two surfaces that are in contact. There are different types of friction including static friction, sliding friction, rolling friction, and fluid friction. Understanding friction helps us understand why we need to apply force to keep objects moving.

Gravity is a force that attracts objects toward each other. The Earth's gravity pulls everything toward the center of the Earth. This is why objects fall down when dropped and why we stay on the ground instead of floating away.''',
    contentTypes: ['text', 'image'],
    downloadStatus: 100,
    imageUrls: ['https://example.com/forces-diagram.jpg'],
  ),
  const Lesson(
    id: 'sci_004',
    title: 'Photosynthesis',
    subjectId: 'science',
    content: '''Photosynthesis is the process by which plants use sunlight, water, and carbon dioxide to create oxygen and energy in the form of sugar. This process is fundamental to life on Earth as it provides the oxygen we breathe and forms the base of most food chains.

The process occurs primarily in the leaves of plants, specifically in cellular structures called chloroplasts. Chloroplasts contain a green pigment called chlorophyll, which absorbs light energy from the sun. This energy is then used to convert carbon dioxide and water into glucose and oxygen.

The overall equation for photosynthesis is: 6CO2 + 6H2O + light energy → C6H12O6 + 6O2. This means that six molecules of carbon dioxide and six molecules of water, using light energy, produce one molecule of glucose and six molecules of oxygen.

Photosynthesis occurs in two stages: the light-dependent reactions and the light-independent reactions (also called the Calvin cycle). The light-dependent reactions occur in the thylakoid membranes of chloroplasts and require direct light energy. These reactions produce ATP and NADPH, which are then used in the light-independent reactions.

The light-independent reactions occur in the stroma of chloroplasts. They use the ATP and NADPH from the light-dependent reactions, along with carbon dioxide, to produce glucose. This process does not require direct light but depends on the products of the light-dependent reactions.

Without photosynthesis, there would be no oxygen in Earth's atmosphere, and most life forms would not exist. Plants, algae, and some bacteria perform photosynthesis, making them the foundation of most ecosystems.''',
    contentTypes: ['text', 'image'],
    downloadStatus: 100,
    imageUrls: ['https://example.com/photosynthesis-diagram.jpg'],
  ),
  const Lesson(
    id: 'sci_005',
    title: 'States of Matter',
    subjectId: 'science',
    content: '''Matter exists in different states, commonly known as solid, liquid, and gas. These states are determined by the arrangement and movement of particles (atoms or molecules) that make up the matter. The state of matter depends on the temperature and pressure conditions.

In a solid, particles are tightly packed together in a fixed arrangement. They vibrate in place but don't move around. This gives solids a definite shape and volume. Examples include ice, wood, and metal. Solids maintain their shape unless a force is applied to them.

In a liquid, particles are still close together but can move past one another. This allows liquids to flow and take the shape of their container, while still maintaining a definite volume. Examples include water, oil, and juice. Liquids can be poured and will fill the bottom of any container.

In a gas, particles are far apart and move freely at high speeds. Gases have no definite shape or volume and will expand to fill any container completely. Examples include oxygen, nitrogen, and carbon dioxide. Gases can be compressed because there is so much space between particles.

There is also a fourth state of matter called plasma, which consists of highly charged particles. Plasma is found in stars, lightning, and fluorescent lights. It is the most common state of matter in the universe, though it's rare on Earth.

Changes between states of matter are called phase changes. Melting is the change from solid to liquid, freezing is the change from liquid to solid, evaporation is the change from liquid to gas, and condensation is the change from gas to liquid. Sublimation is when a solid changes directly to a gas without becoming a liquid first.''',
    contentTypes: ['text', 'image'],
    downloadStatus: 100,
    imageUrls: ['https://example.com/states-of-matter.jpg'],
  ),

  // Math Lessons
  const Lesson(
    id: 'math_001',
    title: 'Introduction to Algebra',
    subjectId: 'math',
    content: '''Algebra is a branch of mathematics that uses letters and symbols to represent numbers and quantities in formulas and equations. The letters, called variables, stand for unknown values that we want to find. Algebra helps us solve problems and understand relationships between quantities.

Variables are symbols, usually letters like x, y, or z, that represent unknown or changing values. For example, in the equation x + 5 = 12, x is a variable that represents the unknown number we need to find. By solving the equation, we discover that x = 7.

An expression is a combination of numbers, variables, and operations. For example, 3x + 2 is an algebraic expression. Expressions don't have an equals sign. When we add an equals sign and set an expression equal to something, we create an equation.

An equation is a mathematical statement that two expressions are equal. For example, 2x + 3 = 11 is an equation. To solve an equation means to find the value of the variable that makes the equation true. In this case, x = 4 because 2(4) + 3 = 11.

The order of operations is important in algebra. We use PEMDAS to remember the correct order: Parentheses, Exponents, Multiplication and Division (from left to right), Addition and Subtraction (from left to right). Following this order ensures we get the correct answer.

Algebra has many real-world applications. We use it to calculate distances, determine costs, predict trends, and solve countless practical problems. Understanding algebra is essential for advanced mathematics and many careers in science, technology, engineering, and business.''',
    contentTypes: ['text'],
    downloadStatus: 100,
  ),
  const Lesson(
    id: 'math_002',
    title: 'Fractions and Decimals',
    subjectId: 'math',
    content: '''Fractions and decimals are two ways to represent parts of a whole or numbers that are not whole numbers. Understanding how to work with fractions and decimals is essential for many mathematical operations and real-world applications.

A fraction consists of two parts: a numerator (top number) and a denominator (bottom number). The numerator tells us how many parts we have, and the denominator tells us how many equal parts make up a whole. For example, in the fraction 3/4, we have 3 parts out of 4 equal parts that make up the whole.

To add or subtract fractions, they must have the same denominator (called a common denominator). If the denominators are different, we need to find equivalent fractions with a common denominator. For example, to add 1/2 + 1/3, we convert them to 3/6 + 2/6 = 5/6.

To multiply fractions, we multiply the numerators together and multiply the denominators together. For example, 2/3 × 3/4 = (2×3)/(3×4) = 6/12 = 1/2 (simplified). To divide fractions, we multiply by the reciprocal of the second fraction.

Decimals are another way to represent parts of a whole, using a decimal point. The digits to the right of the decimal point represent tenths, hundredths, thousandths, and so on. For example, 0.5 means 5 tenths, which is equivalent to the fraction 1/2.

Converting between fractions and decimals is a useful skill. To convert a fraction to a decimal, divide the numerator by the denominator. For example, 3/4 = 3 ÷ 4 = 0.75. To convert a decimal to a fraction, use the place value. For example, 0.25 = 25/100 = 1/4 (simplified).

Both fractions and decimals are used extensively in everyday life, from cooking and measuring to handling money and understanding statistics. Mastering these concepts opens the door to more advanced mathematical topics.''',
    contentTypes: ['text', 'image'],
    downloadStatus: 100,
    imageUrls: ['https://example.com/fractions-visual.jpg'],
  ),
  const Lesson(
    id: 'math_003',
    title: 'Geometry Basics',
    subjectId: 'math',
    content: '''Geometry is the branch of mathematics that deals with shapes, sizes, positions, and properties of space. It helps us understand and describe the physical world around us, from the smallest objects to the largest structures.

Points, lines, and planes are the fundamental building blocks of geometry. A point is a location in space with no size. A line is a straight path that extends infinitely in both directions. A plane is a flat surface that extends infinitely in all directions.

Angles are formed when two rays meet at a common endpoint called a vertex. Angles are measured in degrees. A right angle measures 90 degrees, an acute angle measures less than 90 degrees, and an obtuse angle measures more than 90 degrees but less than 180 degrees.

Triangles are three-sided polygons. The sum of the angles in any triangle always equals 180 degrees. There are different types of triangles: equilateral triangles have all sides equal, isosceles triangles have two sides equal, and scalene triangles have all sides different lengths.

Quadrilaterals are four-sided polygons. Common quadrilaterals include squares (all sides equal, all angles 90 degrees), rectangles (opposite sides equal, all angles 90 degrees), parallelograms (opposite sides parallel and equal), and trapezoids (one pair of parallel sides).

Circles are special shapes where every point is the same distance from the center. The distance from the center to any point on the circle is called the radius. The distance across the circle through the center is called the diameter, which is always twice the radius. The distance around the circle is called the circumference.

Perimeter is the distance around a shape. Area is the amount of space inside a shape. Volume is the amount of space inside a three-dimensional object. These measurements are used in countless practical applications, from construction to design.''',
    contentTypes: ['text', 'image'],
    downloadStatus: 100,
    imageUrls: ['https://example.com/geometry-shapes.jpg'],
  ),
  const Lesson(
    id: 'math_004',
    title: 'Ratios and Proportions',
    subjectId: 'math',
    content: '''A ratio is a comparison of two quantities by division. Ratios can be written in several ways: using a colon (3:4), as a fraction (3/4), or with the word "to" (3 to 4). All three forms mean the same thing: for every 3 of one thing, there are 4 of another.

Ratios are everywhere in daily life. In cooking, we use ratios to mix ingredients. In map reading, we use scale ratios to understand distances. In sports, we use ratios to compare statistics. Understanding ratios helps us make fair comparisons and accurate calculations.

Equivalent ratios are ratios that represent the same relationship. For example, 2:3, 4:6, and 8:12 are all equivalent ratios. We can find equivalent ratios by multiplying or dividing both parts of the ratio by the same number, just like finding equivalent fractions.

A proportion is an equation stating that two ratios are equal. For example, 2/3 = 4/6 is a proportion. Proportions are useful for solving problems where we know three values and need to find a fourth. This is called cross-multiplication.

To solve a proportion using cross-multiplication, we multiply the numerator of one ratio by the denominator of the other ratio. For example, if 2/3 = x/12, we cross-multiply: 2 × 12 = 3 × x, which gives us 24 = 3x, so x = 8.

Unit rates are special ratios that compare a quantity to one unit of another quantity. For example, if a car travels 240 miles in 4 hours, the unit rate is 60 miles per hour. Unit rates help us compare different options and make informed decisions, like comparing prices per unit when shopping.

Proportional relationships appear frequently in real life: recipes, currency exchange, scale models, and many other situations. Understanding ratios and proportions enables us to scale things up or down while maintaining the same relationships between quantities.''',
    contentTypes: ['text'],
    downloadStatus: 100,
  ),
  const Lesson(
    id: 'math_005',
    title: 'Probability and Statistics',
    subjectId: 'math',
    content: '''Probability is the branch of mathematics that deals with the likelihood of events occurring. It helps us understand and predict uncertain situations, from weather forecasts to game outcomes. Probability is expressed as a number between 0 and 1, or as a percentage between 0% and 100%.

A probability of 0 means an event is impossible, while a probability of 1 (or 100%) means an event is certain. Most events fall somewhere in between. For example, when flipping a fair coin, the probability of getting heads is 0.5 or 50% because there are two equally likely outcomes.

To calculate basic probability, we divide the number of favorable outcomes by the total number of possible outcomes. For example, when rolling a standard die, the probability of rolling a 3 is 1/6 because there is one favorable outcome (rolling a 3) out of six possible outcomes (1, 2, 3, 4, 5, or 6).

Statistics is the science of collecting, organizing, analyzing, and interpreting data. We use statistics to understand patterns, make predictions, and draw conclusions from information. Data can be represented in various ways, including tables, graphs, and charts.

The mean (or average) is found by adding all values and dividing by the number of values. The median is the middle value when data is arranged in order. The mode is the value that appears most frequently. These measures help us understand the central tendency of data.

Range is the difference between the largest and smallest values in a data set. It gives us an idea of how spread out the data is. For example, if test scores range from 60 to 95, the range is 35 points, showing significant variation in performance.

Graphs and charts make data easier to understand. Bar graphs compare categories, line graphs show changes over time, pie charts show parts of a whole, and scatter plots show relationships between two variables. Choosing the right type of graph helps communicate information clearly.''',
    contentTypes: ['text', 'image'],
    downloadStatus: 100,
    imageUrls: ['https://example.com/statistics-charts.jpg'],
  ),

  // History Lessons
  const Lesson(
    id: 'hist_001',
    title: 'Ancient Civilizations',
    subjectId: 'history',
    content: '''Ancient civilizations were complex societies that developed thousands of years ago. They created the foundations of modern culture, including writing systems, laws, architecture, and art. Studying ancient civilizations helps us understand how human society evolved.

Mesopotamia, located in the region between the Tigris and Euphrates rivers (modern-day Iraq), is often called the "Cradle of Civilization." The Sumerians, who lived in Mesopotamia around 4000 BCE, developed one of the first writing systems called cuneiform. They also invented the wheel, developed advanced mathematics, and created some of the first cities.

Ancient Egypt flourished along the Nile River for over 3,000 years. The Egyptians are famous for building the pyramids, massive stone structures that served as tombs for pharaohs. They developed hieroglyphics, a system of writing using pictures and symbols. Egyptian civilization made advances in medicine, mathematics, and engineering.

The Indus Valley Civilization emerged around 2500 BCE in what is now Pakistan and northwest India. This civilization had well-planned cities with advanced drainage systems, standardized weights and measures, and impressive architecture. Although we have found many artifacts, their writing system remains undeciphered.

Ancient China developed along the Yellow River around 2000 BCE. The Chinese invented paper, gunpowder, printing, and the compass. They built the Great Wall to protect against invasions and developed a sophisticated system of government. Chinese philosophy, including Confucianism and Taoism, influenced East Asian culture for millennia.

Ancient Greece, flourishing from around 800 BCE to 146 BCE, is known for its contributions to democracy, philosophy, science, and the arts. Greek philosophers like Socrates, Plato, and Aristotle shaped Western thought. The Greeks excelled in architecture, creating beautiful temples like the Parthenon.

The Roman Empire, at its height, controlled much of Europe, North Africa, and the Middle East. Romans were excellent engineers, building roads, aqueducts, and buildings that still stand today. They developed a complex legal system and spread Latin, which became the basis for many modern languages.''',
    contentTypes: ['text', 'image'],
    downloadStatus: 100,
    imageUrls: ['https://example.com/ancient-civilizations-map.jpg'],
  ),
  const Lesson(
    id: 'hist_002',
    title: 'The Middle Ages',
    subjectId: 'history',
    content: '''The Middle Ages, also called the Medieval Period, lasted from approximately 500 CE to 1500 CE in Europe. This thousand-year period saw the fall of the Roman Empire, the rise of Christianity, and the development of feudal societies. It was a time of both great achievements and significant challenges.

After the fall of Rome, Europe entered a period sometimes called the Dark Ages. Central authority collapsed, leading to instability and frequent invasions. However, this period also saw the preservation of knowledge by monks in monasteries, who copied ancient texts and maintained libraries.

Feudalism was the dominant social and economic system in medieval Europe. Society was organized in a hierarchy: at the top was the king, who granted land to nobles in exchange for military service. Knights served the nobles, and peasants (serfs) worked the land. Everyone had specific roles and obligations.

Castles were important features of medieval life. These fortified structures served as homes for nobles and provided protection during attacks. Castles had thick walls, towers, moats, and drawbridges. Life in a castle was busy, with servants, soldiers, and craftspeople all working together.

The Catholic Church was extremely powerful during the Middle Ages. It influenced every aspect of life, from daily routines to government decisions. Monasteries and convents were centers of learning and art. The Church also organized the Crusades, military expeditions to reclaim the Holy Land from Muslim control.

Medieval towns and trade grew during the later Middle Ages. Guilds, associations of craftsmen and merchants, controlled various trades. Markets and fairs brought people together to buy and sell goods. This period saw the rise of a middle class of merchants and artisans.

The Black Death, a devastating plague, swept through Europe in the 14th century, killing about one-third of the population. This catastrophe had profound effects on European society, economy, and culture, contributing to the end of the feudal system and paving the way for the Renaissance.''',
    contentTypes: ['text', 'image'],
    downloadStatus: 100,
    imageUrls: ['https://example.com/medieval-castle.jpg'],
  ),
  const Lesson(
    id: 'hist_003',
    title: 'The Renaissance',
    subjectId: 'history',
    content: '''The Renaissance, meaning "rebirth," was a period of great cultural and intellectual change that began in Italy in the 14th century and spread throughout Europe. It marked the transition from the Middle Ages to the modern world, characterized by renewed interest in classical learning, art, and humanism.

The Renaissance began in Italy, particularly in the wealthy city-states of Florence, Venice, and Rome. Italian merchants and bankers had accumulated great wealth through trade, and they became patrons of artists and scholars. The Medici family of Florence was especially important in supporting Renaissance art and learning.

Humanism was a key philosophy of the Renaissance. Humanists believed in the potential and worth of human beings. They studied classical Greek and Roman texts and emphasized education, reason, and individual achievement. This represented a shift from the medieval focus on religion and the afterlife.

Renaissance art revolutionized how people depicted the world. Artists like Leonardo da Vinci, Michelangelo, and Raphael created masterpieces that showed realistic human figures, used perspective to create depth, and demonstrated technical skill. Leonardo's "Mona Lisa" and Michelangelo's painting of the Sistine Chapel ceiling are iconic Renaissance works.

The printing press, invented by Johannes Gutenberg around 1440, was one of the most important inventions of the Renaissance. It allowed books to be produced quickly and cheaply, making knowledge accessible to more people. The printing press helped spread Renaissance ideas throughout Europe.

Renaissance scientists challenged traditional beliefs and made important discoveries. Nicolaus Copernicus proposed that the Earth revolves around the Sun, contradicting the prevailing belief that Earth was the center of the universe. Galileo Galilei used the telescope to make astronomical observations that supported Copernicus's theory.

Renaissance writers like William Shakespeare in England and Dante Alighieri in Italy created literary works that are still celebrated today. They wrote in vernacular languages (the languages people actually spoke) rather than Latin, making literature more accessible. The Renaissance celebration of human achievement and creativity continues to influence our world today.''',
    contentTypes: ['text', 'image'],
    downloadStatus: 100,
    imageUrls: ['https://example.com/renaissance-art.jpg'],
  ),
  const Lesson(
    id: 'hist_004',
    title: 'The Industrial Revolution',
    subjectId: 'history',
    content: '''The Industrial Revolution was a period of major industrialization and innovation that began in Britain in the late 18th century and spread to other parts of the world. It transformed economies based on agriculture and handcrafted goods into economies based on large-scale industry, mechanized manufacturing, and the factory system.

The revolution began in Britain for several reasons: abundant natural resources like coal and iron, a stable political system, a large workforce, and colonial trade that provided capital and markets. The textile industry was the first to be transformed, with inventions like the spinning jenny and power loom dramatically increasing production.

The steam engine, improved by James Watt in 1769, was crucial to the Industrial Revolution. Steam power could drive machinery, pumps, and locomotives, replacing human and animal power. Factories no longer needed to be located near rivers for water power, and could be built anywhere with access to coal.

Railroads revolutionized transportation. The first passenger railway opened in Britain in 1825. Railroads made it possible to move goods and people quickly and cheaply over long distances. This connected markets, reduced costs, and stimulated economic growth. Railroad construction also created many jobs and required vast amounts of iron and steel.

The Industrial Revolution led to urbanization. People moved from rural areas to cities to work in factories. Cities grew rapidly, often without adequate housing, sanitation, or clean water. Living conditions for many workers were harsh, with long hours, low wages, dangerous working conditions, and crowded, unsanitary housing.

Child labor was common during the Industrial Revolution. Children as young as five or six worked in factories, mines, and mills for long hours. They were preferred by some employers because they could be paid less than adults and could fit into small spaces. Reform movements eventually led to laws protecting child workers.

The Industrial Revolution had lasting effects. It increased productivity and wealth, created new social classes (industrial workers and factory owners), spurred technological innovation, and changed how people lived and worked. It also had environmental consequences, including pollution and resource depletion, issues we still face today.''',
    contentTypes: ['text', 'image'],
    downloadStatus: 100,
    imageUrls: ['https://example.com/industrial-revolution.jpg'],
  ),
  const Lesson(
    id: 'hist_005',
    title: 'World War II',
    subjectId: 'history',
    content: '''World War II was a global conflict that lasted from 1939 to 1945. It involved most of the world's nations, including all great powers, and was the deadliest conflict in human history. The war resulted in an estimated 70-85 million fatalities and reshaped the political, economic, and social structure of the world.

The war began when Nazi Germany, led by Adolf Hitler, invaded Poland on September 1, 1939. Britain and France declared war on Germany two days later. Hitler's aggressive expansionist policies, along with Japan's militarism in Asia and Italy's ambitions under Benito Mussolini, created a climate of international tension.

The Axis Powers consisted primarily of Germany, Italy, and Japan. They sought to expand their territories and influence. The Allied Powers, including Britain, the Soviet Union (after 1941), the United States (after 1941), France, and China, opposed them. The war was fought on multiple fronts across Europe, Africa, Asia, and the Pacific.

The Holocaust was one of the darkest chapters of World War II. Nazi Germany systematically murdered approximately six million Jews, along with millions of others including Roma people, disabled individuals, political dissidents, and others deemed "undesirable." Concentration camps and death camps were established across German-occupied territory.

The United States entered the war after Japan attacked Pearl Harbor, a U.S. naval base in Hawaii, on December 7, 1941. This surprise attack killed over 2,400 Americans and damaged or destroyed numerous ships and aircraft. The next day, the United States declared war on Japan, and Germany and Italy then declared war on the United States.

D-Day, June 6, 1944, was the largest amphibious invasion in history. Allied forces landed on the beaches of Normandy, France, beginning the liberation of Western Europe from Nazi control. This operation involved careful planning, massive resources, and tremendous courage from soldiers who faced heavily fortified German defenses.

The war in Europe ended on May 8, 1945, when Germany surrendered. The war in the Pacific ended on September 2, 1945, after the United States dropped atomic bombs on the Japanese cities of Hiroshima and Nagasaki in August. Japan surrendered shortly after, bringing World War II to an end and beginning the atomic age.''',
    contentTypes: ['text', 'image'],
    downloadStatus: 100,
    imageUrls: ['https://example.com/wwii-map.jpg'],
  ),

  // English Lessons
  const Lesson(
    id: 'eng_001',
    title: 'Parts of Speech',
    subjectId: 'english',
    content: '''Parts of speech are categories of words that have similar grammatical properties. Understanding parts of speech is fundamental to understanding how language works. Every word in English belongs to one or more parts of speech, depending on how it's used in a sentence.

Nouns are words that name people, places, things, or ideas. Common nouns refer to general items (cat, city, book), while proper nouns name specific items and are capitalized (Maria, London, The Great Gatsby). Nouns can be singular or plural, and they can be the subject or object in a sentence.

Pronouns replace nouns to avoid repetition. Personal pronouns include I, you, he, she, it, we, and they. Other types include possessive pronouns (mine, yours, hers), reflexive pronouns (myself, yourself), and relative pronouns (who, which, that). Using pronouns correctly makes writing more fluid and less repetitive.

Verbs express actions, occurrences, or states of being. Action verbs describe what someone or something does (run, write, think). Linking verbs connect the subject to additional information (is, seems, become). Helping verbs work with main verbs to show tense or mood (has gone, will eat, might try).

Adjectives describe or modify nouns and pronouns. They tell us what kind, which one, how many, or how much. For example, in "the beautiful, tall tree," both "beautiful" and "tall" are adjectives describing the tree. Adjectives help create vivid, specific descriptions.

Adverbs modify verbs, adjectives, or other adverbs. They often end in -ly and tell how, when, where, or to what extent. For example, in "She ran quickly," the word "quickly" is an adverb modifying the verb "ran." Adverbs add detail and precision to our communication.

Prepositions show relationships between nouns or pronouns and other words in a sentence. Common prepositions include in, on, at, by, for, with, about, and between. For example, in "The book is on the table," the preposition "on" shows the relationship between the book and the table.

Conjunctions connect words, phrases, or clauses. Coordinating conjunctions (and, but, or, nor, for, yet, so) connect equal elements. Subordinating conjunctions (because, although, when, if) connect dependent clauses to independent clauses. Conjunctions help create complex, sophisticated sentences.

Interjections express strong emotion or surprise and are often followed by an exclamation point. Examples include Oh!, Wow!, and Ouch! While they add emphasis and emotion, interjections should be used sparingly in formal writing.''',
    contentTypes: ['text'],
    downloadStatus: 100,
  ),
  const Lesson(
    id: 'eng_002',
    title: 'Writing Paragraphs',
    subjectId: 'english',
    content: '''A paragraph is a group of sentences that develop a single main idea. Well-written paragraphs are the building blocks of effective writing. Understanding how to construct clear, coherent paragraphs is essential for communicating ideas successfully in any form of writing.

Every paragraph should begin with a topic sentence that states the main idea. The topic sentence tells readers what the paragraph will be about and helps organize your thoughts. It should be clear, specific, and interesting enough to engage readers. For example, "Regular exercise provides numerous health benefits" is a strong topic sentence.

Supporting sentences develop the main idea presented in the topic sentence. They provide details, examples, facts, statistics, reasons, or explanations that elaborate on the main idea. Each supporting sentence should relate directly to the topic sentence and help prove or explain the main point.

Unity means that all sentences in a paragraph relate to and support the main idea. Each sentence should connect logically to the topic sentence and to the sentences around it. Irrelevant information should be removed because it distracts readers and weakens the paragraph's focus.

Coherence means that ideas flow smoothly from one sentence to the next. Use transition words and phrases (first, next, however, therefore, for example) to show relationships between ideas. Repeat key words and use pronouns that clearly refer to previous nouns to help connect sentences.

The concluding sentence wraps up the paragraph and reinforces the main idea. It might summarize the key points, restate the topic sentence in different words, or provide a final thought or implication. A strong concluding sentence gives readers a sense of closure.

Paragraph length varies depending on the purpose and audience. In general, paragraphs should be long enough to fully develop one main idea but not so long that readers lose track of the point. Most paragraphs contain 3-8 sentences, but this can vary.

Different types of paragraphs serve different purposes. Narrative paragraphs tell a story, descriptive paragraphs create vivid images, expository paragraphs explain or inform, and persuasive paragraphs convince readers of a particular viewpoint. The structure remains similar, but the content and style adapt to the purpose.''',
    contentTypes: ['text'],
    downloadStatus: 100,
  ),
  const Lesson(
    id: 'eng_003',
    title: 'Poetry and Literary Devices',
    subjectId: 'english',
    content: '''Poetry is a form of literature that uses aesthetic and rhythmic qualities of language to evoke meanings in addition to, or in place of, ordinary meaning. Poetry allows writers to express emotions, tell stories, and paint pictures with words in ways that prose often cannot.

A metaphor is a figure of speech that describes something by saying it is something else. It makes a comparison between two unlike things without using "like" or "as." For example, "Time is a thief" is a metaphor comparing time to a thief. Metaphors help readers see familiar things in new ways.

A simile is similar to a metaphor but uses "like" or "as" to make the comparison explicit. For example, "Her smile was like sunshine" is a simile. Similes help create vivid images and make abstract concepts more concrete. They're slightly less direct than metaphors but equally powerful.

Personification gives human characteristics to non-human things or abstract ideas. For example, "The wind whispered through the trees" gives the wind the human ability to whisper. Personification makes descriptions more vivid and helps readers connect emotionally with the subject.

Alliteration is the repetition of initial consonant sounds in neighboring words. For example, "Peter Piper picked a peck of pickled peppers" uses alliteration. This device creates rhythm, emphasizes certain words, and makes phrases memorable. It's common in poetry, slogans, and tongue twisters.

Imagery uses descriptive language that appeals to the five senses (sight, sound, smell, taste, touch) to create mental pictures. Good imagery helps readers experience what's being described. For example, "The crisp, golden leaves crunched beneath her feet" appeals to sight, sound, and touch.

Rhyme is the repetition of similar sounds, usually at the ends of lines. Rhyme schemes are patterns of rhymes, labeled with letters (ABAB, AABB, etc.). Rhyme creates musicality and can emphasize important ideas. Not all poetry rhymes, but when used effectively, rhyme enhances the reading experience.

Rhythm in poetry comes from the pattern of stressed and unstressed syllables. Meter is the systematic regularity of rhythm. Different meters create different effects: some sound formal and stately, others sound playful and bouncy. Even free verse, which doesn't follow strict patterns, has rhythm.

A stanza is a group of lines in a poem, similar to a paragraph in prose. Stanzas organize ideas and create structure. Common stanza forms include couplets (2 lines), tercets (3 lines), quatrains (4 lines), and more. The stanza structure affects how the poem looks and sounds.''',
    contentTypes: ['text'],
    downloadStatus: 100,
  ),
  const Lesson(
    id: 'eng_004',
    title: 'Reading Comprehension Strategies',
    subjectId: 'english',
    content: '''Reading comprehension is the ability to understand, interpret, and analyze written text. Strong comprehension skills are essential for academic success and lifelong learning. Effective readers use various strategies to make sense of what they read and to remember important information.

Before reading, preview the text to get an overview. Look at the title, headings, subheadings, pictures, and captions. Skim the first and last paragraphs. This preview activates your prior knowledge and gives you an idea of what to expect, making it easier to understand and remember the content.

Set a purpose for reading. Ask yourself why you're reading this text. Are you reading for information, entertainment, to follow directions, or to form an opinion? Your purpose influences how carefully you read and what you focus on. Having a clear purpose keeps you engaged and directed.

Active reading means interacting with the text as you read. Ask questions, make predictions, visualize scenes, make connections to your own experiences or other texts you've read, and monitor your understanding. If something doesn't make sense, pause and try to figure it out before continuing.

Annotating the text helps you engage with the material. Underline or highlight key ideas, circle unfamiliar words, write notes in the margins, mark confusing parts with question marks, and jot down reactions or connections. These marks create a record of your thinking and make reviewing easier.

Context clues help you figure out the meaning of unfamiliar words without using a dictionary. Look at the words and sentences around the unknown word for hints about its meaning. Types of context clues include definitions, examples, synonyms, antonyms, and general sense of the passage.

Identifying main ideas and supporting details is crucial. The main idea is what the text is mostly about. Supporting details provide evidence, examples, or explanations for the main idea. Being able to distinguish between main ideas and details helps you understand and remember the most important information.

Making inferences means reading between the lines to understand what the author implies but doesn't state directly. Use clues in the text along with your own knowledge and experience to draw conclusions. Strong readers constantly make inferences to fully comprehend text.

Summarizing after reading helps consolidate your understanding. A good summary includes only the most important ideas in your own words, is shorter than the original text, and maintains the author's intended meaning. Regularly summarizing what you read improves comprehension and retention.''',
    contentTypes: ['text'],
    downloadStatus: 100,
  ),
  const Lesson(
    id: 'eng_005',
    title: 'Grammar and Punctuation',
    subjectId: 'english',
    content: '''Grammar is the system and structure of a language, including the rules for how words are formed and combined into sentences. Punctuation marks are symbols that clarify meaning, indicate pauses, and organize writing. Together, grammar and punctuation help writers communicate clearly and effectively.

A sentence is a group of words that expresses a complete thought. Every sentence must have a subject (who or what the sentence is about) and a predicate (what the subject does or is). For example, in "The dog barked," "dog" is the subject and "barked" is the predicate.

There are four types of sentences: declarative sentences make statements and end with periods; interrogative sentences ask questions and end with question marks; imperative sentences give commands and usually end with periods; and exclamatory sentences express strong emotion and end with exclamation points.

A fragment is an incomplete sentence that's missing a subject, verb, or complete thought. Fragments should be avoided in formal writing. For example, "Because I was late" is a fragment. It can be corrected by adding an independent clause: "Because I was late, I missed the bus."

A run-on sentence occurs when two or more independent clauses are joined incorrectly. Run-ons can be corrected by separating the clauses into different sentences, joining them with a comma and coordinating conjunction, joining them with a semicolon, or making one clause dependent.

Commas have many uses. They separate items in a list, separate two independent clauses joined by a coordinating conjunction, set off introductory elements, set off nonessential information, separate coordinate adjectives, and more. Using commas correctly prevents confusion and clarifies meaning.

Apostrophes show possession or form contractions. To show possession, add 's to singular nouns (the cat's toy) and add only an apostrophe to plural nouns ending in s (the cats' toys). Contractions combine two words by replacing letters with an apostrophe (don't, can't, it's).

Quotation marks enclose direct quotes, titles of short works, and sometimes words used in special ways. Commas and periods go inside quotation marks in American English. Semicolons and colons go outside. Question marks and exclamation points go inside if they're part of the quote, outside if they're not.

Subject-verb agreement means the subject and verb must agree in number. Singular subjects take singular verbs; plural subjects take plural verbs. For example, "The dog runs" (singular) but "The dogs run" (plural). This seems simple, but can be tricky with compound subjects or when words separate the subject and verb.''',
    contentTypes: ['text'],
    downloadStatus: 100,
  ),
];

// Questions for each lesson (10 per lesson)
final List<Question> mockQuestions = [
  // Science - Cells
  const Question(
    id: 'q_sci_001_1',
    lessonId: 'sci_001',
    questionText: 'What are the basic building blocks of all living things?',
    options: ['Atoms', 'Cells', 'Molecules', 'Organs'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_sci_001_2',
    lessonId: 'sci_001',
    questionText: 'Which type of cells do NOT have a nucleus?',
    options: ['Eukaryotic cells', 'Animal cells', 'Prokaryotic cells', 'Plant cells'],
    correctAnswerIndex: 2,
  ),
  const Question(
    id: 'q_sci_001_3',
    lessonId: 'sci_001',
    questionText: 'What is the control center of the cell called?',
    options: ['Mitochondria', 'Nucleus', 'Cell membrane', 'Ribosome'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_sci_001_4',
    lessonId: 'sci_001',
    questionText: 'What are mitochondria known as?',
    options: ['Cell walls', 'Powerhouses of the cell', 'Protein factories', 'Storage units'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_sci_001_5',
    lessonId: 'sci_001',
    questionText: 'What controls what enters and leaves the cell?',
    options: ['Nucleus', 'Cytoplasm', 'Cell membrane', 'Ribosome'],
    correctAnswerIndex: 2,
  ),
  const Question(
    id: 'q_sci_001_6',
    lessonId: 'sci_001',
    questionText: 'Which of these is an example of a prokaryotic cell?',
    options: ['Human cell', 'Bacteria', 'Plant cell', 'Fungus'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_sci_001_7',
    lessonId: 'sci_001',
    questionText: 'What do ribosomes do in a cell?',
    options: ['Store water', 'Make proteins', 'Provide energy', 'Break down waste'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_sci_001_8',
    lessonId: 'sci_001',
    questionText: 'What contains the instructions for making proteins?',
    options: ['RNA', 'DNA', 'Proteins', 'Lipids'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_sci_001_9',
    lessonId: 'sci_001',
    questionText: 'How many cells does the human body have?',
    options: ['Millions', 'Billions', 'Trillions', 'Thousands'],
    correctAnswerIndex: 2,
  ),
  const Question(
    id: 'q_sci_001_10',
    lessonId: 'sci_001',
    questionText: 'Which type of organism is made of eukaryotic cells?',
    options: ['Bacteria', 'Viruses', 'Animals', 'Archaea'],
    correctAnswerIndex: 2,
  ),

  // Science - Water Cycle
  const Question(
    id: 'q_sci_002_1',
    lessonId: 'sci_002',
    questionText: 'What powers the water cycle?',
    options: ['Wind', 'The Moon', 'The Sun', 'Gravity'],
    correctAnswerIndex: 2,
  ),
  const Question(
    id: 'q_sci_002_2',
    lessonId: 'sci_002',
    questionText: 'What is the process of water changing from liquid to gas called?',
    options: ['Condensation', 'Precipitation', 'Evaporation', 'Freezing'],
    correctAnswerIndex: 2,
  ),
  const Question(
    id: 'q_sci_002_3',
    lessonId: 'sci_002',
    questionText: 'What percentage of atmospheric moisture comes from oceans, seas, lakes, and rivers?',
    options: ['50%', '70%', '90%', '100%'],
    correctAnswerIndex: 2,
  ),
  const Question(
    id: 'q_sci_002_4',
    lessonId: 'sci_002',
    questionText: 'What is the process of water vapor turning into liquid water called?',
    options: ['Evaporation', 'Condensation', 'Precipitation', 'Sublimation'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_sci_002_5',
    lessonId: 'sci_002',
    questionText: 'What is responsible for the formation of clouds?',
    options: ['Evaporation', 'Condensation', 'Precipitation', 'Wind'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_sci_002_6',
    lessonId: 'sci_002',
    questionText: 'Which of these is NOT a form of precipitation?',
    options: ['Rain', 'Snow', 'Condensation', 'Hail'],
    correctAnswerIndex: 2,
  ),
  const Question(
    id: 'q_sci_002_7',
    lessonId: 'sci_002',
    questionText: 'What happens to water after it falls as precipitation?',
    options: ['It only evaporates', 'It only infiltrates the ground', 'It may evaporate, be stored, or infiltrate', 'It disappears'],
    correctAnswerIndex: 2,
  ),
  const Question(
    id: 'q_sci_002_8',
    lessonId: 'sci_002',
    questionText: 'What form does most precipitation take?',
    options: ['Snow', 'Rain', 'Sleet', 'Hail'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_sci_002_9',
    lessonId: 'sci_002',
    questionText: 'What provides the primary route for water to return to Earth\'s surface?',
    options: ['Evaporation', 'Condensation', 'Precipitation', 'Wind currents'],
    correctAnswerIndex: 2,
  ),
  const Question(
    id: 'q_sci_002_10',
    lessonId: 'sci_002',
    questionText: 'The water cycle is also known as:',
    options: ['The rain cycle', 'The hydrologic cycle', 'The weather cycle', 'The cloud cycle'],
    correctAnswerIndex: 1,
  ),

  // Add similar questions for remaining lessons... (truncated for brevity)
  // Math - Algebra
  const Question(
    id: 'q_math_001_1',
    lessonId: 'math_001',
    questionText: 'What are letters that represent unknown values called in algebra?',
    options: ['Constants', 'Variables', 'Coefficients', 'Operators'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_math_001_2',
    lessonId: 'math_001',
    questionText: 'What is the solution to x + 5 = 12?',
    options: ['x = 5', 'x = 7', 'x = 12', 'x = 17'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_math_001_3',
    lessonId: 'math_001',
    questionText: 'Which has an equals sign?',
    options: ['Expression', 'Equation', 'Variable', 'Term'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_math_001_4',
    lessonId: 'math_001',
    questionText: 'In PEMDAS, what does P stand for?',
    options: ['Plus', 'Parentheses', 'Power', 'Prime'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_math_001_5',
    lessonId: 'math_001',
    questionText: 'What is 3x + 2 an example of?',
    options: ['An equation', 'An expression', 'A variable', 'A constant'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_math_001_6',
    lessonId: 'math_001',
    questionText: 'If 2x + 3 = 11, what is x?',
    options: ['3', '4', '5', '6'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_math_001_7',
    lessonId: 'math_001',
    questionText: 'What operation comes first in order of operations after parentheses?',
    options: ['Addition', 'Subtraction', 'Multiplication', 'Exponents'],
    correctAnswerIndex: 3,
  ),
  const Question(
    id: 'q_math_001_8',
    lessonId: 'math_001',
    questionText: 'What is solving an equation?',
    options: ['Writing the equation', 'Finding the value of the variable', 'Drawing a graph', 'Adding numbers'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_math_001_9',
    lessonId: 'math_001',
    questionText: 'Algebra is used in which fields?',
    options: ['Only mathematics', 'Only science', 'Only business', 'Science, technology, engineering, and business'],
    correctAnswerIndex: 3,
  ),
  const Question(
    id: 'q_math_001_10',
    lessonId: 'math_001',
    questionText: 'What does the M in PEMDAS stand for?',
    options: ['Minus', 'Multiplication', 'Mean', 'Multiple'],
    correctAnswerIndex: 1,
  ),

  // History - Ancient Civilizations
  const Question(
    id: 'q_hist_001_1',
    lessonId: 'hist_001',
    questionText: 'Which region is called the "Cradle of Civilization"?',
    options: ['Egypt', 'China', 'Mesopotamia', 'Greece'],
    correctAnswerIndex: 2,
  ),
  const Question(
    id: 'q_hist_001_2',
    lessonId: 'hist_001',
    questionText: 'What writing system did the Sumerians develop?',
    options: ['Hieroglyphics', 'Cuneiform', 'Alphabet', 'Sanskrit'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_hist_001_3',
    lessonId: 'hist_001',
    questionText: 'Which civilization built the pyramids?',
    options: ['Greek', 'Roman', 'Egyptian', 'Chinese'],
    correctAnswerIndex: 2,
  ),
  const Question(
    id: 'q_hist_001_4',
    lessonId: 'hist_001',
    questionText: 'The Great Wall was built in which ancient civilization?',
    options: ['Egypt', 'China', 'Rome', 'Greece'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_hist_001_5',
    lessonId: 'hist_001',
    questionText: 'Which ancient civilization is known for democracy and philosophy?',
    options: ['Egypt', 'Rome', 'Greece', 'Persia'],
    correctAnswerIndex: 2,
  ),
  const Question(
    id: 'q_hist_001_6',
    lessonId: 'hist_001',
    questionText: 'What did the Chinese invent? (Select one)',
    options: ['Democracy', 'Paper', 'Pyramids', 'Alphabet'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_hist_001_7',
    lessonId: 'hist_001',
    questionText: 'Which river was central to Egyptian civilization?',
    options: ['Tigris', 'Euphrates', 'Nile', 'Yellow'],
    correctAnswerIndex: 2,
  ),
  const Question(
    id: 'q_hist_001_8',
    lessonId: 'hist_001',
    questionText: 'Who were Socrates, Plato, and Aristotle?',
    options: ['Roman emperors', 'Egyptian pharaohs', 'Greek philosophers', 'Chinese emperors'],
    correctAnswerIndex: 2,
  ),
  const Question(
    id: 'q_hist_001_9',
    lessonId: 'hist_001',
    questionText: 'What language became the basis for many modern European languages?',
    options: ['Greek', 'Latin', 'Arabic', 'Sanskrit'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_hist_001_10',
    lessonId: 'hist_001',
    questionText: 'The Indus Valley Civilization was located in modern-day:',
    options: ['Egypt', 'Iraq', 'Pakistan and India', 'China'],
    correctAnswerIndex: 2,
  ),

  // English - Parts of Speech
  const Question(
    id: 'q_eng_001_1',
    lessonId: 'eng_001',
    questionText: 'What part of speech names a person, place, thing, or idea?',
    options: ['Verb', 'Noun', 'Adjective', 'Adverb'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_eng_001_2',
    lessonId: 'eng_001',
    questionText: 'What part of speech replaces a noun?',
    options: ['Adjective', 'Adverb', 'Pronoun', 'Verb'],
    correctAnswerIndex: 2,
  ),
  const Question(
    id: 'q_eng_001_3',
    lessonId: 'eng_001',
    questionText: 'What part of speech expresses action or state of being?',
    options: ['Noun', 'Verb', 'Adjective', 'Conjunction'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_eng_001_4',
    lessonId: 'eng_001',
    questionText: 'What part of speech modifies a noun?',
    options: ['Adverb', 'Adjective', 'Preposition', 'Conjunction'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_eng_001_5',
    lessonId: 'eng_001',
    questionText: 'What part of speech often ends in -ly?',
    options: ['Noun', 'Verb', 'Adjective', 'Adverb'],
    correctAnswerIndex: 3,
  ),
  const Question(
    id: 'q_eng_001_6',
    lessonId: 'eng_001',
    questionText: 'What part of speech shows relationships between words?',
    options: ['Conjunction', 'Preposition', 'Interjection', 'Pronoun'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_eng_001_7',
    lessonId: 'eng_001',
    questionText: 'What part of speech connects words, phrases, or clauses?',
    options: ['Preposition', 'Conjunction', 'Adjective', 'Adverb'],
    correctAnswerIndex: 1,
  ),
  const Question(
    id: 'q_eng_001_8',
    lessonId: 'eng_001',
    questionText: 'In "The big red ball," what parts of speech are "big" and "red"?',
    options: ['Nouns', 'Verbs', 'Adjectives', 'Adverbs'],
    correctAnswerIndex: 2,
  ),
  const Question(
    id: 'q_eng_001_9',
    lessonId: 'eng_001',
    questionText: 'What type of pronoun is "myself"?',
    options: ['Personal', 'Possessive', 'Reflexive', 'Relative'],
    correctAnswerIndex: 2,
  ),
  const Question(
    id: 'q_eng_001_10',
    lessonId: 'eng_001',
    questionText: 'What part of speech expresses strong emotion?',
    options: ['Verb', 'Adverb', 'Interjection', 'Conjunction'],
    correctAnswerIndex: 2,
  ),
];

// Sample Quiz Attempts
final List<QuizAttempt> mockQuizAttempts = [
  QuizAttempt(
    id: 'qa_001',
    lessonId: 'sci_001',
    lessonTitle: 'Introduction to Cells',
    score: 9,
    totalQuestions: 10,
    date: DateTime.now().subtract(const Duration(days: 2)),
  ),
  QuizAttempt(
    id: 'qa_002',
    lessonId: 'math_001',
    lessonTitle: 'Introduction to Algebra',
    score: 7,
    totalQuestions: 10,
    date: DateTime.now().subtract(const Duration(days: 5)),
  ),
  QuizAttempt(
    id: 'qa_003',
    lessonId: 'hist_001',
    lessonTitle: 'Ancient Civilizations',
    score: 4,
    totalQuestions: 10,
    date: DateTime.now().subtract(const Duration(days: 7)),
  ),
  QuizAttempt(
    id: 'qa_004',
    lessonId: 'eng_001',
    lessonTitle: 'Parts of Speech',
    score: 10,
    totalQuestions: 10,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  QuizAttempt(
    id: 'qa_005',
    lessonId: 'sci_002',
    lessonTitle: 'The Water Cycle',
    score: 6,
    totalQuestions: 10,
    date: DateTime.now().subtract(const Duration(days: 10)),
  ),
];
