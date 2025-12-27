package com.example.prabath_web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/ProjectServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class ProjectServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form parameters
        String projectName = request.getParameter("projectName");
        String description = request.getParameter("description");

        // Get the upload path
        String applicationPath = getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        // Create upload directory if it doesn't exist
        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // File paths for database
        String photo1Path = null, photo2Path = null, photo3Path = null, photo4Path = null, photo5Path = null, videoPath = null;

        try {
            // Handle photo1
            Part photo1Part = request.getPart("photo1");
            if (photo1Part != null && photo1Part.getSize() > 0) {
                String fileName = Paths.get(photo1Part.getSubmittedFileName()).getFileName().toString();
                photo1Path = UPLOAD_DIR + "/" + fileName;
                photo1Part.write(uploadFilePath + File.separator + fileName);
            }

            // Handle photo2
            Part photo2Part = request.getPart("photo2");
            if (photo2Part != null && photo2Part.getSize() > 0) {
                String fileName = Paths.get(photo2Part.getSubmittedFileName()).getFileName().toString();
                photo2Path = UPLOAD_DIR + "/" + fileName;
                photo2Part.write(uploadFilePath + File.separator + fileName);
            }

            // Handle photo3
            Part photo3Part = request.getPart("photo3");
            if (photo3Part != null && photo3Part.getSize() > 0) {
                String fileName = Paths.get(photo3Part.getSubmittedFileName()).getFileName().toString();
                photo3Path = UPLOAD_DIR + "/" + fileName;
                photo3Part.write(uploadFilePath + File.separator + fileName);
            }

            // Handle photo4
            Part photo4Part = request.getPart("photo4");
            if (photo4Part != null && photo4Part.getSize() > 0) {
                String fileName = Paths.get(photo4Part.getSubmittedFileName()).getFileName().toString();
                photo4Path = UPLOAD_DIR + "/" + fileName;
                photo4Part.write(uploadFilePath + File.separator + fileName);
            }

            // Handle photo5
            Part photo5Part = request.getPart("photo5");
            if (photo5Part != null && photo5Part.getSize() > 0) {
                String fileName = Paths.get(photo5Part.getSubmittedFileName()).getFileName().toString();
                photo5Path = UPLOAD_DIR + "/" + fileName;
                photo5Part.write(uploadFilePath + File.separator + fileName);
            }

            // Handle video
            Part videoPart = request.getPart("video");
            if (videoPart != null && videoPart.getSize() > 0) {
                String fileName = Paths.get(videoPart.getSubmittedFileName()).getFileName().toString();
                videoPath = UPLOAD_DIR + "/" + fileName;
                videoPart.write(uploadFilePath + File.separator + fileName);
            }

            // Insert into database
            Connection conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Projects (projectName, description, photo1, photo2, photo3, photo4, photo5, video) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, projectName);
                stmt.setString(2, description);
                stmt.setString(3, photo1Path);
                stmt.setString(4, photo2Path);
                stmt.setString(5, photo3Path);
                stmt.setString(6, photo4Path);
                stmt.setString(7, photo5Path);
                stmt.setString(8, videoPath);

                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
                    response.sendRedirect("index.jsp?success=Project added successfully");
                } else {
                    response.sendRedirect("project.jsp?error=Failed to add project");
                }

                stmt.close();
                conn.close();
            } else {
                response.sendRedirect("project.jsp?error=Database connection failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("project.jsp?error=An error occurred: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action != null) {
            if (action.equals("edit")) {
                handleEditRequest(request, response);
            } else if (action.equals("delete")) {
                handleDeleteRequest(request, response);
            } else if (action.equals("getProject")) {
                handleGetProjectRequest(request, response);
            }
        } else {
            // Default: list all projects
            listAllProjects(request, response);
        }
    }

    private void listAllProjects(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM Projects";
                PreparedStatement stmt = conn.prepareStatement(sql);
                java.sql.ResultSet rs = stmt.executeQuery();

                java.util.List<Project> projects = new java.util.ArrayList<>();
                while (rs.next()) {
                    Project project = new Project();
                    project.setId(rs.getInt("id"));
                    project.setProjectName(rs.getString("projectName"));
                    project.setDescription(rs.getString("description"));
                    project.setPhoto1(rs.getString("photo1"));
                    project.setPhoto2(rs.getString("photo2"));
                    project.setPhoto3(rs.getString("photo3"));
                    project.setPhoto4(rs.getString("photo4"));
                    project.setPhoto5(rs.getString("photo5"));
                    project.setVideo(rs.getString("video"));
                    projects.add(project);
                }

                request.setAttribute("projects", projects);
                request.getRequestDispatcher("/index.jsp").forward(request, response);

                rs.close();
                stmt.close();
                conn.close();
            } else {
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

    private void handleGetProjectRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int projectId = Integer.parseInt(request.getParameter("id"));
            Connection conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM Projects WHERE id = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, projectId);
                java.sql.ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    Project project = new Project();
                    project.setId(rs.getInt("id"));
                    project.setProjectName(rs.getString("projectName"));
                    project.setDescription(rs.getString("description"));
                    project.setPhoto1(rs.getString("photo1"));
                    project.setPhoto2(rs.getString("photo2"));
                    project.setPhoto3(rs.getString("photo3"));
                    project.setPhoto4(rs.getString("photo4"));
                    project.setPhoto5(rs.getString("photo5"));
                    project.setVideo(rs.getString("video"));
                    
                    request.setAttribute("project", project);
                    request.getRequestDispatcher("/edit-project.jsp").forward(request, response);
                } else {
                    response.sendRedirect("index.jsp?error=Project not found");
                }

                rs.close();
                stmt.close();
                conn.close();
            } else {
                response.sendRedirect("index.jsp?error=Database connection failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?error=An error occurred: " + e.getMessage());
        }
    }

    private void handleEditRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int projectId = Integer.parseInt(request.getParameter("projectId"));
            String projectName = request.getParameter("projectName");
            String description = request.getParameter("description");

            // Get the upload path
            String applicationPath = getServletContext().getRealPath("");
            String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

            // Create upload directory if it doesn't exist
            File uploadDir = new File(uploadFilePath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // File paths for database
            String photo1Path = request.getParameter("existingPhoto1");
            String photo2Path = request.getParameter("existingPhoto2");
            String photo3Path = request.getParameter("existingPhoto3");
            String photo4Path = request.getParameter("existingPhoto4");
            String photo5Path = request.getParameter("existingPhoto5");
            String videoPath = request.getParameter("existingVideo");

            // Handle photo1 update
            try {
                Part photo1Part = request.getPart("photo1");
                if (photo1Part != null && photo1Part.getSize() > 0) {
                    String fileName = Paths.get(photo1Part.getSubmittedFileName()).getFileName().toString();
                    photo1Path = UPLOAD_DIR + "/" + fileName;
                    photo1Part.write(uploadFilePath + File.separator + fileName);
                }
            } catch (Exception e) {
                // Ignore if no file uploaded
            }

            // Handle photo2 update
            try {
                Part photo2Part = request.getPart("photo2");
                if (photo2Part != null && photo2Part.getSize() > 0) {
                    String fileName = Paths.get(photo2Part.getSubmittedFileName()).getFileName().toString();
                    photo2Path = UPLOAD_DIR + "/" + fileName;
                    photo2Part.write(uploadFilePath + File.separator + fileName);
                }
            } catch (Exception e) {
                // Ignore if no file uploaded
            }

            // Handle photo3 update
            try {
                Part photo3Part = request.getPart("photo3");
                if (photo3Part != null && photo3Part.getSize() > 0) {
                    String fileName = Paths.get(photo3Part.getSubmittedFileName()).getFileName().toString();
                    photo3Path = UPLOAD_DIR + "/" + fileName;
                    photo3Part.write(uploadFilePath + File.separator + fileName);
                }
            } catch (Exception e) {
                // Ignore if no file uploaded
            }

            // Handle photo4 update
            try {
                Part photo4Part = request.getPart("photo4");
                if (photo4Part != null && photo4Part.getSize() > 0) {
                    String fileName = Paths.get(photo4Part.getSubmittedFileName()).getFileName().toString();
                    photo4Path = UPLOAD_DIR + "/" + fileName;
                    photo4Part.write(uploadFilePath + File.separator + fileName);
                }
            } catch (Exception e) {
                // Ignore if no file uploaded
            }

            // Handle photo5 update
            try {
                Part photo5Part = request.getPart("photo5");
                if (photo5Part != null && photo5Part.getSize() > 0) {
                    String fileName = Paths.get(photo5Part.getSubmittedFileName()).getFileName().toString();
                    photo5Path = UPLOAD_DIR + "/" + fileName;
                    photo5Part.write(uploadFilePath + File.separator + fileName);
                }
            } catch (Exception e) {
                // Ignore if no file uploaded
            }

            // Handle video update
            try {
                Part videoPart = request.getPart("video");
                if (videoPart != null && videoPart.getSize() > 0) {
                    String fileName = Paths.get(videoPart.getSubmittedFileName()).getFileName().toString();
                    videoPath = UPLOAD_DIR + "/" + fileName;
                    videoPart.write(uploadFilePath + File.separator + fileName);
                }
            } catch (Exception e) {
                // Ignore if no file uploaded
            }

            // Update in database
            Connection conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "UPDATE Projects SET projectName = ?, description = ?, photo1 = ?, photo2 = ?, photo3 = ?, photo4 = ?, photo5 = ?, video = ? WHERE id = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, projectName);
                stmt.setString(2, description);
                stmt.setString(3, photo1Path);
                stmt.setString(4, photo2Path);
                stmt.setString(5, photo3Path);
                stmt.setString(6, photo4Path);
                stmt.setString(7, photo5Path);
                stmt.setString(8, videoPath);
                stmt.setInt(9, projectId);

                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
                    response.sendRedirect("index.jsp?success=Project updated successfully");
                } else {
                    response.sendRedirect("index.jsp?error=Failed to update project");
                }

                stmt.close();
                conn.close();
            } else {
                response.sendRedirect("index.jsp?error=Database connection failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?error=An error occurred: " + e.getMessage());
        }
    }

    private void handleDeleteRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int projectId = Integer.parseInt(request.getParameter("id"));
            Connection conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "DELETE FROM Projects WHERE id = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, projectId);

                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
                    response.sendRedirect("index.jsp?success=Project deleted successfully");
                } else {
                    response.sendRedirect("index.jsp?error=Failed to delete project");
                }

                stmt.close();
                conn.close();
            } else {
                response.sendRedirect("index.jsp?error=Database connection failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?error=An error occurred: " + e.getMessage());
        }
    }
}