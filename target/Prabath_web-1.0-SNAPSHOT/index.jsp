<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prabath Thilina - Personal Website</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --primary-color: #222222;
            --secondary-color: #7B7B7B;
            --accent-color: #7B7B7B;
            --tertiary-color: #F8F8F8;
            --text-dark: #222222;
            --text-light: #7B7B7B;
            --bg-light: #F8F8F8;
            --bg-white: #FFFFFF;
            --shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            --shadow-lg: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: var(--text-dark);
            background-color: var(--bg-white);
        }

        /* Navigation */
        nav {
            position: fixed;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 1000;
            transition: all 0.3s ease;
        }

        .nav-container {
            background: transparent;
            border-radius: 25px;
            padding: 0.35rem 0.75rem;
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }


        .nav-links {
            display: flex;
            list-style: none;
            gap: 0.25rem;
            margin: 0;
            padding: 0;
        }

        .nav-links li {
            margin: 0;
        }

        .nav-links a {
            text-decoration: none;
            color: var(--text-dark);
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            display: flex;
            align-items: center;
            transition: all 0.3s ease;
            position: relative;
            font-size: 0.85rem;
        }

        .nav-links a:hover {
            background: var(--tertiary-color);
            color: var(--primary-color);
        }

        .nav-links a.active {
            background: var(--primary-color);
            color: var(--bg-white);
        }

        /* Hero Section */
        .hero {
            min-height: 100vh;
            display: grid;
            grid-template-columns: 1fr 1fr;
            align-items: center;
            background: var(--bg-white);
            color: var(--text-dark);
            position: relative;
            overflow: hidden;
        }

        .hero-content {
            padding: 4rem 3rem;
            max-width: 600px;
            animation: fadeInUp 1s ease;
            text-align: left;
        }

        .hero h1 {
            font-size: 4rem;
            margin-bottom: 1.5rem;
            font-weight: 700;
            color: var(--primary-color);
            line-height: 1.2;
        }

        .hero .subtitle {
            font-size: 1.5rem;
            margin-bottom: 2rem;
            color: var(--text-light);
            font-weight: 400;
        }

        .hero .description {
            font-size: 1.1rem;
            margin-bottom: 2.5rem;
            color: var(--text-light);
            line-height: 1.8;
        }

        .hero-image {
            height: 100vh;
            position: relative;
            overflow: visible;
            background: var(--bg-white);
            perspective: 1200px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .hero-image img {
            width: 80%;
            height: 90%;
            max-width: 600px;
            object-fit: contain;
            object-position: center center;
            display: block;
            filter: grayscale(100%) drop-shadow(0 20px 40px rgba(0, 0, 0, 0.3));
            transform: perspective(1200px) rotateY(-15deg) rotateX(5deg) translateZ(50px);
            transition: transform 0.6s cubic-bezier(0.23, 1, 0.32, 1);
            animation: float3d 6s ease-in-out infinite;
        }

        .hero-image:hover img {
            transform: perspective(1200px) rotateY(-10deg) rotateX(0deg) translateZ(80px) scale(1.05);
        }

        @keyframes float3d {
            0%, 100% {
                transform: perspective(1200px) rotateY(-15deg) rotateX(5deg) translateZ(50px) translateY(0px);
            }
            50% {
                transform: perspective(1200px) rotateY(-15deg) rotateX(5deg) translateZ(50px) translateY(-20px);
            }
        }

        .cta-button {
            display: inline-block;
            padding: 1rem 2.5rem;
            background: var(--bg-white);
            color: var(--primary-color);
            text-decoration: none;
            border-radius: 50px;
            font-weight: 600;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: var(--shadow-lg);
        }
        
        .cta-button:hover {
            background: var(--tertiary-color);
            transform: translateY(-3px);
            box-shadow: 0 25px 30px -5px rgba(0, 0, 0, 0.2);
        }

        /* Sections */
        section {
            padding: 5rem 2rem;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .section-title {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: var(--text-dark);
        }

        .section-subtitle {
            text-align: center;
            color: var(--text-light);
            margin-bottom: 3rem;
            font-size: 1.1rem;
        }

        /* About Section */
        .about {
            background: var(--bg-light);
        }

        .about-content {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 3rem;
            align-items: center;
        }

        .about-text {
            font-size: 1.1rem;
            color: var(--text-light);
            line-height: 1.8;
        }

        .about-image {
            border-radius: 20px;
            height: 400px;
            width: 100%;
            box-shadow: var(--shadow-lg);
            overflow: hidden;
            position: relative;
        }

        .about-image {
            perspective: 1000px;
        }

        .about-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            object-position: center 20%;
            display: block;
            filter: grayscale(100%) drop-shadow(0 15px 30px rgba(0, 0, 0, 0.25));
            transform: perspective(1000px) rotateY(-5deg);
            transition: transform 0.6s cubic-bezier(0.23, 1, 0.32, 1);
        }

        .about-image:hover img {
            transform: perspective(1000px) rotateY(0deg) translateZ(30px) scale(1.02);
        }

        /* Skills Section */
        .skills-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .skill-card {
            background: white;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: var(--shadow);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            text-align: center;
        }

        .skill-card:hover {
            transform: translateY(-10px);
            box-shadow: var(--shadow-lg);
        }

        .skill-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
        }

        .skill-card h3 {
            margin-bottom: 1rem;
            color: var(--text-dark);
        }

        .skill-card p {
            color: var(--text-light);
        }

        /* Projects Section */
        .projects {
            background: var(--bg-light);
        }

        .projects-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .project-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: var(--shadow);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .project-card:hover {
            transform: translateY(-10px);
            box-shadow: var(--shadow-lg);
        }

        .project-image {
            height: 200px;
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 3rem;
        }

        .project-content {
            padding: 2rem;
        }

        .project-content h3 {
            margin-bottom: 1rem;
            color: var(--text-dark);
        }

        .project-content p {
            color: var(--text-light);
            margin-bottom: 1rem;
        }

        .project-video {
            margin-top: 1rem;
        }

        .project-video video {
            border-radius: 8px;
            box-shadow: var(--shadow);
        }

        .project-actions {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
            justify-content: flex-end;
        }

        .edit-button, .delete-button {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 0.9rem;
            font-weight: 500;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .edit-button {
            background: var(--primary-color);
            color: var(--bg-white);
        }

        .edit-button:hover {
            background: var(--secondary-color);
            transform: translateY(-2px);
        }

        .delete-button {
            background: #dc3545;
            color: var(--bg-white);
        }

        .delete-button:hover {
            background: #c82333;
            transform: translateY(-2px);
        }

        .no-projects {
            text-align: center;
            color: var(--text-light);
            font-size: 1.1rem;
            margin-top: 2rem;
        }

        /* Contact Section */
        .contact-content {
            max-width: 600px;
            margin: 0 auto;
            text-align: center;
        }

        .contact-info {
            display: flex;
            justify-content: center;
            gap: 3rem;
            margin-top: 2rem;
            flex-wrap: wrap;
        }

        .contact-item {
            text-align: center;
        }

        .contact-item .icon {
            width: 60px;
            height: 60px;
            margin: 0 auto 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: transform 0.3s ease;
            color: var(--primary-color);
        }

        .contact-item .icon svg {
            width: 100%;
            height: 100%;
        }

        .contact-item:hover .icon {
            transform: translateY(-5px);
        }

        .contact-item a {
            color: var(--text-dark);
            text-decoration: none;
            transition: color 0.3s ease;
            font-weight: 500;
            display: block;
        }

        .contact-item a:hover {
            color: var(--primary-color);
        }

        /* Footer */
        footer {
            background: var(--text-dark);
            color: white;
            text-align: center;
            padding: 2rem;
        }

        .social-links {
            display: flex;
            justify-content: center;
            gap: 2rem;
            margin-top: 1rem;
        }

        .social-links a {
            color: white;
            font-size: 1.5rem;
            text-decoration: none;
            transition: transform 0.3s ease, color 0.3s ease;
        }

        .social-links a:hover {
            transform: translateY(-5px);
            color: var(--accent-color);
        }

        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideInLeft {
            from {
                opacity: 0;
                transform: translateX(-50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes slideInRight {
            from {
                opacity: 0;
                transform: translateX(50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
        }

        .fade-in {
            opacity: 0;
            transform: translateY(30px);
            transition: opacity 0.6s ease, transform 0.6s ease;
        }

        .fade-in.visible {
            opacity: 1;
            transform: translateY(0);
        }

        .slide-in-left {
            opacity: 0;
            transform: translateX(-50px);
            transition: opacity 0.6s ease, transform 0.6s ease;
        }

        .slide-in-left.visible {
            opacity: 1;
            transform: translateX(0);
        }

        .slide-in-right {
            opacity: 0;
            transform: translateX(50px);
            transition: opacity 0.6s ease, transform 0.6s ease;
        }

        .slide-in-right.visible {
            opacity: 1;
            transform: translateX(0);
        }

        .pulse {
            animation: pulse 2s ease-in-out infinite;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            nav {
                top: 10px;
                left: 10px;
                right: 10px;
                transform: none;
                width: auto;
            }

            .nav-container {
                width: 100%;
                justify-content: center;
                padding: 0.35rem 0.5rem;
            }

            .nav-links {
                gap: 0.15rem;
                flex-wrap: wrap;
                justify-content: center;
            }

            .nav-links a {
                padding: 0.45rem 0.85rem;
                font-size: 0.8rem;
            }

            .hero {
                grid-template-columns: 1fr;
                min-height: auto;
            }

            .hero-content {
                padding: 3rem 2rem;
                text-align: center;
            }

            .hero h1 {
                font-size: 3rem;
            }

            .hero .subtitle {
                font-size: 1.2rem;
            }

            .hero-image {
                height: 50vh;
                order: -1;
            }

            .about-content {
                grid-template-columns: 1fr;
            }

            .section-title {
                font-size: 2rem;
            }
        }

        /* Scroll to top button */
        .scroll-top {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 50px;
            height: 50px;
            background: var(--primary-color);
            color: white;
            border: none;
            border-radius: 50%;
            cursor: pointer;
            font-size: 1.5rem;
            box-shadow: var(--shadow-lg);
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s ease;
            z-index: 999;
        }

        .scroll-top.visible {
            opacity: 1;
            visibility: visible;
        }

        .scroll-top:hover {
            background: var(--secondary-color);
            transform: translateY(-5px);
        }

        /* Language Toggle */
        .lang-toggle {
            position: fixed;
            top: 20px;
            right: 30px;
            z-index: 1001;
            background: var(--bg-white);
            border-radius: 25px;
            padding: 0.5rem 1rem;
            box-shadow: var(--shadow);
            display: flex;
            gap: 0.5rem;
            align-items: center;
        }

        .lang-toggle button {
            background: transparent;
            border: none;
            padding: 0.4rem 0.8rem;
            border-radius: 15px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
            color: var(--text-dark);
            font-size: 0.85rem;
        }

        .lang-toggle button.active {
            background: var(--primary-color);
            color: var(--bg-white);
        }

        .lang-toggle button:hover:not(.active) {
            background: var(--tertiary-color);
        }

        /* Hide inactive language content */
        [data-lang]:not(.active-lang) {
            display: none;
        }

        /* Feedback Form Styles */
        .feedback-form {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: var(--shadow);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: var(--text-dark);
            font-weight: 500;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
            font-family: inherit;
            transition: border-color 0.3s ease;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: var(--primary-color);
        }

        .form-group textarea {
            resize: vertical;
            min-height: 120px;
        }

        .feedback-form .cta-button {
            width: 100%;
            margin-top: 1rem;
        }

        @media (max-width: 768px) {
            .lang-toggle {
                top: 10px;
                right: 10px;
                padding: 0.4rem 0.8rem;
            }

            .lang-toggle button {
                padding: 0.3rem 0.6rem;
                font-size: 0.75rem;
            }
        }
    </style>
</head>
<body>
    <!-- Language Toggle -->
    <div class="lang-toggle">
        <button id="langEn" class="active" onclick="switchLanguage('en')">English</button>
        <button id="langSi" onclick="switchLanguage('si')">සිංහල</button>
    </div>

    <!-- Navigation -->
    <nav>
        <div class="nav-container">
            <ul class="nav-links">
                <li><a href="#home" class="active active-lang" data-lang="en">Home</a></li>
                <li><a href="#home" class="active" data-lang="si">මුල් පිටුව</a></li>
                <li><a href="#about" class="active-lang" data-lang="en">About</a></li>
                <li><a href="#about" data-lang="si">මා ගැන</a></li>
                <li><a href="#projects" class="active-lang" data-lang="en">Projects</a></li>
                <li><a href="#projects" data-lang="si">ව්‍යාපෘති</a></li>
                <li><a href="#feedback" class="active-lang" data-lang="en">Feedback</a></li>
                <li><a href="#feedback" data-lang="si">පිළිගත්තාව</a></li>
                <li><a href="#contact" class="active-lang" data-lang="en">Contact</a></li>
                <li><a href="#contact" data-lang="si">සම්බන්ධ වන්න</a></li>
            </ul>
        </div>
    </nav>

    <!-- Hero Section -->
    <section id="home" class="hero">
        <div class="hero-content">
            <h1 data-lang="en" class="active-lang">Hello</h1>
            <h1 data-lang="si">ආයුබෝවන්</h1>
            <p class="subtitle active-lang" data-lang="en">— I'm Prabath Thilina</p>
            <p class="subtitle" data-lang="si">— මම ප්‍රභාත් තිලින</p>
            <p class="description active-lang" data-lang="en">
                A dedicated software developer and web enthusiast. I'm passionate about creating 
                innovative solutions and delivering high-quality software that makes a difference.
            </p>
            <p class="description" data-lang="si">
                කැපවූ මෘදුකාංග සංවර්ධකයෙක් සහ වෙබ් ලෝලියෙක්. නව්‍ය විසඳුම් නිර්මාණය කිරීමට සහ 
                වෙනසක් ඇති කරන උසස් තත්ත්වයේ මෘදුකාංග ලබා දීමට මම උනන්දු වෙමි.
            </p>
            <a href="#contact" class="cta-button active-lang" data-lang="en">Get In Touch</a>
            <a href="#contact" class="cta-button" data-lang="si">සම්බන්ධ වන්න</a>
        </div>
        <div class="hero-image">
            <img src="images/profile-background.jpg" alt="Prabath Thilina">
        </div>
    </section>

    <!-- About Section -->
    <section id="about" class="about">
        <div class="container">
            <h2 class="section-title slide-in-left active-lang" data-lang="en">About Me</h2>
            <h2 class="section-title slide-in-left" data-lang="si">මා ගැන</h2>
            <p class="section-subtitle slide-in-right active-lang" data-lang="en">Get to know more about who I am</p>
            <p class="section-subtitle slide-in-right" data-lang="si">මම කවුද යන්න ගැන වැඩි විස්තර දැනගන්න</p>
            <div class="about-content">
                <div class="about-text slide-in-left active-lang" data-lang="en">
                    <p>
                        Hello! I'm Prabath Thilina, a 22-year-old undergraduate and a second-year student 
                        at SLIIT University. I am a dedicated and
                        motivated software developer with a strong passion for creating elegant, efficient, 
                        and user-centered solutions. I enjoy transforming complex problems into simple, 
                        intuitive, and visually appealing designs.
                    </p>
                    <p style="margin-top: 1.5rem;">
                        I have a solid foundation in software development and web technologies, along with 
                        practical skills in UI design and video editing, which allow me to effectively 
                        combine technical expertise with creativity. I strongly believe in writing clean, 
                        maintainable code and following best practices to deliver high-quality and scalable 
                        solutions.
                    </p>
                    <p style="margin-top: 1.5rem;">
                        I am continuously learning and adapting to new technologies, with a keen interest 
                        in data-driven problem solving and modern design approaches. Outside of academics 
                        and coding, I enjoy exploring emerging technologies, contributing to open-source 
                        projects, and working on personal projects that challenge me to grow both 
                        technically and creatively.
                    </p>
                </div>
                <div class="about-text fade-in" data-lang="si">
                    <p>
                        ආයුබෝවන්! මම ප්‍රභාත් තිලින, වයස අවුරුදු 22 ක උපාධි අපේක්ෂකයෙක් සහ SLIIT විශ්වවිද්‍යාලයේ 
                        දෙවන වසර ශිෂ්‍යයෙක්. මම කැපවූ සහ අභිප්‍රේරිත මෘදුකාංග සංවර්ධකයෙක් වන අතර, අලංකාර, 
                        කාර්යක්ෂම සහ පරිශීලක කේන්ද්‍රීය විසඳුම් නිර්මාණය කිරීමට දැඩි ආශාවක් ඇත. සංකීර්ණ ගැටළු 
                        සරල, සහජ සහ දෘශ්‍යමය වශයෙන් ආකර්ෂණීය නිර්මාණ බවට පරිවර්තනය කිරීම මම රස විඳිමි.
                    </p>
                    <p style="margin-top: 1.5rem;">
                        මෘදුකාංග සංවර්ධනය සහ වෙබ් තාක්ෂණයන් පිළිබඳ ශක්තිමත් පදනමක් මා සතුව ඇති අතර, UI නිර්මාණය 
                        සහ වීඩියෝ සංස්කරණය පිළිබඳ ප්‍රායෝගික කුසලතා ද ඇත, මේවා තාක්ෂණික ප්‍රවීණත්වය නිර්මාණශීලීත්වය 
                        සමඟ ඵලදායී ලෙස ඒකාබද්ධ කිරීමට මට ඉඩ සලසයි. පිරිසිදු, නඩත්තු කළ හැකි කේතය ලිවීම සහ උසස් 
                        තත්ත්වයේ සහ පරිමාණය කළ හැකි විසඳුම් ලබා දීම සඳහා හොඳම භාවිතයන් අනුගමනය කිරීම ගැන මම දැඩි ලෙස විශ්වාස කරමි.
                    </p>
                    <p style="margin-top: 1.5rem;">
                        දත්ත මත පදනම් වූ ගැටළු විසඳීම සහ නවීන නිර්මාණ ප්‍රවේශයන් කෙරෙහි දැඩි උනන්දුවක් දක්වමින් 
                        මම අඛණ්ඩව නව තාක්ෂණයන් ඉගෙන ගනිමින් සහ අනුවර්තනය වෙමි. ශාස්ත්‍රීය කටයුතු සහ කේතීකරණයෙන් 
                        බැහැරව, නැගී එන තාක්ෂණයන් ගවේෂණය කිරීම, විවෘත මූලාශ්‍ර ව්‍යාපෘති සඳහා දායක වීම සහ තාක්ෂණික 
                        සහ නිර්මාණාත්මක වශයෙන් වර්ධනය වීමට මට අභියෝග කරන පුද්ගලික ව්‍යාපෘති මත වැඩ කිරීම මම රස විඳිමි.
                    </p>
                </div>
                <div class="about-image slide-in-right">
                    <img src="images/profile-background.jpg" alt="Prabath Thilina">
                </div>
            </div>
        </div>
    </section>

    <!-- Projects Section -->
    <section id="projects" class="projects">
        <div class="container">
            <h2 class="section-title slide-in-left active-lang" data-lang="en">My Projects</h2>
            <h2 class="section-title slide-in-left" data-lang="si">මගේ ව්‍යාපෘති</h2>
            <p class="section-subtitle slide-in-right active-lang" data-lang="en">Explore my work and creations</p>
            <p class="section-subtitle slide-in-right" data-lang="si">මගේ කාර්යය සහ නිර්මාණ කිරීම එක්සත් කරන්න</p>
            
            <%
                java.util.List<com.example.prabath_web.Project> projects = (java.util.List<com.example.prabath_web.Project>) request.getAttribute("projects");
                if (projects != null && !projects.isEmpty()) {
            %>
            <div class="projects-grid">
                <%
                    for (com.example.prabath_web.Project project : projects) {
                %>
                <div class="project-card fade-in">
                    <%
                        String photoPath = project.getPhoto1();
                        if (photoPath == null || photoPath.isEmpty()) {
                            photoPath = "images/profile-background.jpg";
                        }
                    %>
                    <div class="project-image">
                        <img src="<%= photoPath %>" alt="<%= project.getProjectName() %>">
                    </div>
                    <div class="project-content">
                        <h3><%= project.getProjectName() %></h3>
                        <p><%= project.getDescription() %></p>
                        <%
                            String videoPath = project.getVideo();
                            if (videoPath != null && !videoPath.isEmpty()) {
                        %>
                        <div class="project-video">
                            <video width="100%" controls>
                                <source src="<%= videoPath %>" type="video/mp4">
                                Your browser does not support the video tag.
                            </video>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
            <%
                } else {
            %>
            <p class="no-projects">No projects found.</p>
            <%
                }
            %>
        </div>
    </section>

    <!-- Feedback Section -->
    <section id="feedback">
        <div class="container">
            <h2 class="section-title fade-in active-lang" data-lang="en">Feedback</h2>
            <h2 class="section-title fade-in" data-lang="si">පිළිගත්තාව</h2>
            <p class="section-subtitle fade-in active-lang" data-lang="en">Share your thoughts and suggestions</p>
            <p class="section-subtitle fade-in" data-lang="si">ඔබගේ සිතුවිලි සහ යෝජනා බෙදාගන්න</p>
            <form class="feedback-form fade-in" action="FeedbackServlet" method="post">
                <div class="form-group">
                    <label for="name" data-lang="en" class="active-lang">Name</label>
                    <label for="name" data-lang="si">නම</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="email" data-lang="en" class="active-lang">Email</label>
                    <label for="email" data-lang="si">ඊමේල්</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="message" data-lang="en" class="active-lang">Message</label>
                    <label for="message" data-lang="si">පණිවිඩය</label>
                    <textarea id="message" name="message" required></textarea>
                </div>
                <button type="submit" class="cta-button active-lang" data-lang="en">Send Feedback</button>
                <button type="submit" class="cta-button" data-lang="si">පිළිගත්තාව යවන්න</button>
            </form>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact">
        <div class="container">
            <h2 class="section-title fade-in active-lang" data-lang="en">Get In Touch</h2>
            <h2 class="section-title fade-in" data-lang="si">සම්බන්ධ වන්න</h2>
            <p class="section-subtitle fade-in active-lang" data-lang="en">I'd love to hear from you</p>
            <p class="section-subtitle fade-in" data-lang="si">ඔබගෙන් අසන්නට මම කැමතියි</p>
            <div class="contact-content">
                <p style="font-size: 1.1rem; color: var(--text-light); margin-bottom: 2rem;" data-lang="en" class="active-lang">
                    Whether you have a project in mind, want to collaborate, or just want to say hello, 
                    feel free to reach out. I'm always open to discussing new opportunities and ideas.
                </p>
                <p style="font-size: 1.1rem; color: var(--text-light); margin-bottom: 2rem;" data-lang="si">
                    ඔබට ව්‍යාපෘතියක් සිතෙනවා නම්, සහයෝගයෙන් කටයුතු කිරීමට අවශ්‍ය නම්, හෝ හුදෙක් ආයුබෝවන් කියන්නට 
                    අවශ්‍ය නම්, නිදහසේ සම්බන්ධ වන්න. නව අවස්ථා සහ අදහස් ගැන සාකච්ඡා කිරීමට මම සැමවිටම සූදානම්.
                </p>
                <div class="contact-info">
                    <div class="contact-item">
                        <div class="icon">
                            <svg viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path d="M20 4H4C2.9 4 2.01 4.9 2.01 6L2 18C2 19.1 2.9 20 4 20H20C21.1 20 22 19.1 22 18V6C22 4.9 21.1 4 20 4ZM20 8L12 13L4 8V6L12 11L20 6V8Z"/>
                            </svg>
                        </div>
                        <a href="mailto:prathilina00000@gmail.com" data-lang="en" class="active-lang">Email Me</a>
                        <a href="mailto:prathilina00000@gmail.com" data-lang="si">මට ඊමේල් කරන්න</a>
                    </div>
                    <div class="contact-item">
                        <div class="icon">
                            <svg viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path d="M20.447 20.452H16.893V14.883C16.893 13.555 16.866 11.846 15.041 11.846C13.188 11.846 12.905 13.291 12.905 14.785V20.452H9.351V9H12.765V10.561H12.811C13.288 9.661 14.448 8.711 16.181 8.711C19.782 8.711 20.448 11.081 20.448 14.166V20.452H20.447ZM5.337 7.433C4.193 7.433 3.274 6.507 3.274 5.367C3.274 4.224 4.194 3.305 5.337 3.305C6.477 3.305 7.401 4.224 7.401 5.367C7.401 6.507 6.476 7.433 5.337 7.433ZM7.119 20.452H3.555V9H7.119V20.452ZM22.225 0H1.771C0.792 0 0 0.774 0 1.729V22.271C0 23.227 0.792 24 1.771 24H22.222C23.2 24 24 23.227 24 22.271V1.729C24 0.774 23.2 0 22.222 0H22.225Z"/>
                            </svg>
                        </div>
                        <a href="#" data-lang="en" class="active-lang">LinkedIn</a>
                        <a href="#" data-lang="si">LinkedIn</a>
                    </div>
                    <div class="contact-item">
                        <div class="icon">
                            <svg viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path d="M12 0C5.374 0 0 5.373 0 12C0 17.302 3.438 21.8 8.207 23.387C8.806 23.498 9.043 23.115 9.043 22.777C9.043 22.472 9.031 21.554 9.027 20.577C5.672 21.302 4.967 19.16 4.967 19.16C4.421 17.773 3.634 17.404 3.634 17.404C2.546 16.659 3.717 16.675 3.717 16.675C4.922 16.759 5.556 17.912 5.556 17.912C6.626 19.746 8.363 19.216 9.048 18.909C9.155 18.134 9.466 17.604 9.81 17.305C7.145 17.005 4.344 15.973 4.344 11.374C4.344 10.063 4.809 8.993 5.579 8.153C5.455 7.85 5.044 6.629 5.696 4.977C5.696 4.977 6.704 4.655 9.004 6.207C9.954 5.941 10.98 5.808 12 5.803C13.02 5.808 14.047 5.941 14.997 6.207C17.295 4.655 18.303 4.977 18.303 4.977C18.956 6.63 18.545 7.851 18.421 8.153C19.192 8.993 19.656 10.064 19.656 11.374C19.656 15.984 16.849 17.004 14.177 17.3C14.607 17.667 15 18.397 15 19.517C15 21.046 15 22.26 15 22.777C15 23.118 15.235 23.504 15.839 23.386C20.566 21.797 24 17.3 24 12C24 5.373 18.627 0 12 0Z"/>
                            </svg>
                        </div>
                        <a href="#" data-lang="en" class="active-lang">GitHub</a>
                        <a href="#" data-lang="si">GitHub</a>
                    </div>
                    <div class="contact-item">
                        <div class="icon">
                            <svg viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-.1040.959-1.040 2.062 0 1.103.829 2.168 1.000 2.316.173.148 2.416 3.69 5.856 5.174.82.443 1.459.708 1.955.907.82.262 1.566.225 2.156.136.658-.09 2.028-.829 2.314-1.629.287-.8.287-1.486.201-1.629-.086-.143-.297-.223-.62-.372M12.042 21.903h-.004c-1.628 0-3.224-.438-4.617-1.266l-.331-.196-3.431.9.916-3.347-.215-.343c-.91-1.447-1.39-3.118-1.39-4.829 0-5.016 4.08-9.096 9.096-9.096 2.428 0 4.71.947 6.428 2.665 1.718 1.718 2.665 4.001 2.665 6.428-.001 5.017-4.081 9.097-9.097 9.097m7.74-16.78C17.99 3.33 15.14 2.04 12.042 2.04c-5.463 0-9.91 4.447-9.91 9.91 0 1.747.455 3.454 1.32 4.955L2.04 21.96l5.16-1.353c1.447.79 3.078 1.206 4.742 1.206h.004c5.463 0 9.91-4.447 9.91-9.91 0-2.647-1.03-5.135-2.904-7.009"/>
                            </svg>
                        </div>
                        <a href="https://wa.me/" data-lang="en" class="active-lang">WhatsApp</a>
                        <a href="https://wa.me/" data-lang="si">WhatsApp</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <p data-lang="en" class="active-lang">&copy; 2024 Prabath Thilina. All rights reserved.</p>
        <p data-lang="si">&copy; 2024 ප්‍රභාත් තිලින. සියලුම හිමිකම් ඇවිරිණි.</p>
        <div class="social-links">
            <a href="#" aria-label="LinkedIn">💼</a>
            <a href="#" aria-label="GitHub">🐙</a>
            <a href="#" aria-label="Twitter">🐦</a>
            <a href="#" aria-label="Email">📧</a>
        </div>
    </footer>

    <!-- Scroll to Top Button -->
    <button class="scroll-top" id="scrollTop" aria-label="Scroll to top">↑</button>

    <script>
        // Language switching function
        function switchLanguage(lang) {
            // Update button states
            document.getElementById('langEn').classList.toggle('active', lang === 'en');
            document.getElementById('langSi').classList.toggle('active', lang === 'si');
             
            // Update content visibility
            document.querySelectorAll('[data-lang]').forEach(element => {
                if (element.getAttribute('data-lang') === lang) {
                    element.classList.add('active-lang');
                } else {
                    element.classList.remove('active-lang');
                }
            });
             
            // Store preference
            localStorage.setItem('preferredLanguage', lang);
        }
        
        // Fetch projects when the page loads
        window.addEventListener('DOMContentLoaded', function() {
            fetch('/Prabath_web-1.0-SNAPSHOT/ProjectServlet')
                .then(response => response.text())
                .then(data => {
                    // Handle the response if needed
                    console.log('Projects fetched successfully');
                })
                .catch(error => {
                    console.error('Error fetching projects:', error);
                });
        });

        // Load saved language preference
        window.addEventListener('DOMContentLoaded', function() {
            const savedLang = localStorage.getItem('preferredLanguage') || 'en';
            if (savedLang !== 'en') {
                switchLanguage(savedLang);
            }
        });

        // Smooth scroll for navigation links and active state
        document.querySelectorAll('.nav-links a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                
                // Remove active class from all nav links
                document.querySelectorAll('.nav-links a').forEach(link => {
                    link.classList.remove('active');
                });
                
                // Add active class to clicked links (both languages)
                const href = this.getAttribute('href');
                document.querySelectorAll(`.nav-links a[href="${href}"]`).forEach(link => {
                    link.classList.add('active');
                });
                
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });

        // Update active nav link on scroll
        const sections = document.querySelectorAll('section[id]');
        const navLinks = document.querySelectorAll('.nav-links a[href^="#"]');

        function updateActiveNav() {
            let current = '';
            const scrollPosition = window.pageYOffset + 150;

            sections.forEach(section => {
                const sectionTop = section.offsetTop;
                const sectionHeight = section.clientHeight;
                if (scrollPosition >= sectionTop && scrollPosition < sectionTop + sectionHeight) {
                    current = section.getAttribute('id');
                }
            });

            navLinks.forEach(link => {
                link.classList.remove('active');
                if (link.getAttribute('href') === `#${current}`) {
                    link.classList.add('active');
                }
            });
        }

        window.addEventListener('scroll', updateActiveNav);

        // Fade in animation on scroll
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver(function(entries) {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                }
            });
        }, observerOptions);

        document.querySelectorAll('.fade-in').forEach(el => {
            observer.observe(el);
        });

        document.querySelectorAll('.slide-in-left').forEach(el => {
            observer.observe(el);
        });

        document.querySelectorAll('.slide-in-right').forEach(el => {
            observer.observe(el);
        });

        // Scroll to top button
        const scrollTopButton = document.getElementById('scrollTop');
        
        window.addEventListener('scroll', function() {
            if (window.pageYOffset > 300) {
                scrollTopButton.classList.add('visible');
            } else {
                scrollTopButton.classList.remove('visible');
            }
        });

        scrollTopButton.addEventListener('click', function() {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });

        // Navbar background on scroll
        const nav = document.querySelector('nav');
        window.addEventListener('scroll', function() {
            if (window.scrollY > 50) {
                nav.style.boxShadow = '0 4px 6px -1px rgba(0, 0, 0, 0.1)';
            } else {
                nav.style.boxShadow = '0 4px 6px -1px rgba(0, 0, 0, 0.1)';
            }
        });
    </script>
</body>
</html>
