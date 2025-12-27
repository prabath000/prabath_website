<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Project - Prabath Thilina</title>
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

        /* Form Styles */
        .project-form {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 3rem;
            border-radius: 15px;
            box-shadow: var(--shadow);
        }

        .form-group {
            margin-bottom: 2rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: var(--text-dark);
            font-weight: 500;
            font-size: 1.1rem;
        }

        .form-group input[type="text"],
        .form-group textarea {
            width: 100%;
            padding: 1rem;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
            font-family: inherit;
            transition: border-color 0.3s ease;
            resize: vertical;
        }

        .form-group input[type="text"]:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: var(--primary-color);
        }

        .form-group textarea {
            min-height: 120px;
        }

        .file-upload {
            position: relative;
            display: inline-block;
            width: 100%;
            margin-bottom: 1rem;
        }

        .file-upload input[type="file"] {
            position: absolute;
            opacity: 0;
            width: 100%;
            height: 100%;
            cursor: pointer;
        }

        .file-upload label {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1rem;
            border: 2px dashed #ddd;
            border-radius: 8px;
            background: var(--bg-light);
            cursor: pointer;
            transition: all 0.3s ease;
            min-height: 60px;
        }

        .file-upload label:hover {
            border-color: var(--primary-color);
            background: var(--tertiary-color);
        }

        .file-upload span {
            margin-left: 0.5rem;
            color: var(--text-light);
        }

        .file-preview {
            margin-top: 0.5rem;
            font-size: 0.9rem;
            color: var(--text-light);
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
            border: 2px solid var(--primary-color);
            cursor: pointer;
            font-size: 1rem;
        }

        .cta-button:hover {
            background: var(--primary-color);
            color: var(--bg-white);
            transform: translateY(-3px);
            box-shadow: 0 25px 30px -5px rgba(0, 0, 0, 0.2);
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 2rem;
            color: var(--text-light);
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .back-link:hover {
            color: var(--primary-color);
        }

        /* Existing media preview */
        .existing-media {
            margin-top: 1rem;
            padding: 1rem;
            background: var(--bg-light);
            border-radius: 8px;
            border: 1px solid #ddd;
        }

        .existing-media img {
            max-width: 100px;
            max-height: 100px;
            margin-right: 1rem;
            border-radius: 4px;
        }

        .existing-media video {
            max-width: 150px;
            max-height: 100px;
            margin-right: 1rem;
            border-radius: 4px;
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

            .project-form {
                padding: 2rem;
            }

            .section-title {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav>
        <div class="nav-container">
            <ul class="nav-links">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="index.jsp#about">About</a></li>
                <li><a href="index.jsp#projects">Projects</a></li>
                <li><a href="index.jsp#feedback">Feedback</a></li>
                <li><a href="index.jsp#contact">Contact</a></li>
            </ul>
        </div>
    </nav>

    <!-- Edit Project Section -->
    <section>
        <div class="container">
            <h1 class="section-title">Edit Project</h1>
            <p class="section-subtitle">Update your project details</p>
            <form class="project-form" action="ProjectServlet?action=edit" method="post" enctype="multipart/form-data">
                <input type="hidden" name="projectId" value="<%= request.getAttribute("project") != null ? ((com.example.prabath_web.Project)request.getAttribute("project")).getId() : "" %>">

                <div class="form-group">
                    <label for="projectName">Project Name</label>
                    <input type="text" id="projectName" name="projectName" required 
                           value="<%= request.getAttribute("project") != null ? ((com.example.prabath_web.Project)request.getAttribute("project")).getProjectName() : "" %>" 
                           placeholder="Enter your project name">
                </div>

                <div class="form-group">
                    <label for="description">Project Description</label>
                    <textarea id="description" name="description" required 
                              placeholder="Describe your project in detail"><%= request.getAttribute("project") != null ? ((com.example.prabath_web.Project)request.getAttribute("project")).getDescription() : "" %></textarea>
                </div>

                <!-- Hidden fields for existing media -->
                <%
                    if (request.getAttribute("project") != null) {
                        com.example.prabath_web.Project project = (com.example.prabath_web.Project)request.getAttribute("project");
                %>
                <input type="hidden" name="existingPhoto1" value="<%= project.getPhoto1() != null ? project.getPhoto1() : "" %>">
                <input type="hidden" name="existingPhoto2" value="<%= project.getPhoto2() != null ? project.getPhoto2() : "" %>">
                <input type="hidden" name="existingPhoto3" value="<%= project.getPhoto3() != null ? project.getPhoto3() : "" %>">
                <input type="hidden" name="existingPhoto4" value="<%= project.getPhoto4() != null ? project.getPhoto4() : "" %>">
                <input type="hidden" name="existingPhoto5" value="<%= project.getPhoto5() != null ? project.getPhoto5() : "" %>">
                <input type="hidden" name="existingVideo" value="<%= project.getVideo() != null ? project.getVideo() : "" %>">
                <%
                    }
                %>

                <div class="form-group">
                    <label>Project Photos (Upload up to 5 images)</label>
                    <div class="file-upload">
                        <input type="file" id="photo1" name="photo1" accept="image/*">
                        <label for="photo1">
                            📷 <span>Choose Photo 1</span>
                        </label>
                        <div class="file-preview" id="preview1"></div>
                    </div>
                    <div class="file-upload">
                        <input type="file" id="photo2" name="photo2" accept="image/*">
                        <label for="photo2">
                            📷 <span>Choose Photo 2</span>
                        </label>
                        <div class="file-preview" id="preview2"></div>
                    </div>
                    <div class="file-upload">
                        <input type="file" id="photo3" name="photo3" accept="image/*">
                        <label for="photo3">
                            📷 <span>Choose Photo 3</span>
                        </label>
                        <div class="file-preview" id="preview3"></div>
                    </div>
                    <div class="file-upload">
                        <input type="file" id="photo4" name="photo4" accept="image/*">
                        <label for="photo4">
                            📷 <span>Choose Photo 4</span>
                        </label>
                        <div class="file-preview" id="preview4"></div>
                    </div>
                    <div class="file-upload">
                        <input type="file" id="photo5" name="photo5" accept="image/*">
                        <label for="photo5">
                            📷 <span>Choose Photo 5</span>
                        </label>
                        <div class="file-preview" id="preview5"></div>
                    </div>
                </div>

                <div class="form-group">
                    <label>Project Video (Upload one video file)</label>
                    <div class="file-upload">
                        <input type="file" id="video" name="video" accept="video/*">
                        <label for="video">
                            🎥 <span>Choose Video</span>
                        </label>
                        <div class="file-preview" id="videoPreview"></div>
                    </div>
                </div>

                <!-- Existing media preview -->
                <%
                    if (request.getAttribute("project") != null) {
                        com.example.prabath_web.Project project = (com.example.prabath_web.Project)request.getAttribute("project");
                %>
                <div class="form-group">
                    <label>Current Media</label>
                    <div class="existing-media">
                        <% if (project.getPhoto1() != null && !project.getPhoto1().isEmpty()) { %>
                            <img src="<%= project.getPhoto1() %>" alt="Photo 1">
                        <% } %>
                        <% if (project.getPhoto2() != null && !project.getPhoto2().isEmpty()) { %>
                            <img src="<%= project.getPhoto2() %>" alt="Photo 2">
                        <% } %>
                        <% if (project.getPhoto3() != null && !project.getPhoto3().isEmpty()) { %>
                            <img src="<%= project.getPhoto3() %>" alt="Photo 3">
                        <% } %>
                        <% if (project.getPhoto4() != null && !project.getPhoto4().isEmpty()) { %>
                            <img src="<%= project.getPhoto4() %>" alt="Photo 4">
                        <% } %>
                        <% if (project.getPhoto5() != null && !project.getPhoto5().isEmpty()) { %>
                            <img src="<%= project.getPhoto5() %>" alt="Photo 5">
                        <% } %>
                        <% if (project.getVideo() != null && !project.getVideo().isEmpty()) { %>
                            <video width="150" controls>
                                <source src="<%= project.getVideo() %>" type="video/mp4">
                            </video>
                        <% } %>
                    </div>
                    <p style="font-size: 0.9rem; color: var(--text-light); margin-top: 0.5rem;">
                        Leave file fields blank to keep existing media
                    </p>
                </div>
                <%
                    }
                %>

                <button type="submit" class="cta-button">Update Project</button>
            </form>
            <a href="index.jsp" class="back-link">← Back to Home</a>
        </div>
    </section>

    <script>
        // File preview functionality
        function updateFilePreview(inputId, previewId, type) {
            const input = document.getElementById(inputId);
            const preview = document.getElementById(previewId);

            input.addEventListener('change', function() {
                const file = this.files[0];
                if (file) {
                    preview.textContent = `Selected: ${file.name}`;
                    preview.style.color = 'var(--primary-color)';
                } else {
                    preview.textContent = '';
                }
            });
        }

        // Initialize file previews
        updateFilePreview('photo1', 'preview1', 'image');
        updateFilePreview('photo2', 'preview2', 'image');
        updateFilePreview('photo3', 'preview3', 'image');
        updateFilePreview('photo4', 'preview4', 'image');
        updateFilePreview('photo5', 'preview5', 'image');
        updateFilePreview('video', 'videoPreview', 'video');
    </script>
</body>
</html>