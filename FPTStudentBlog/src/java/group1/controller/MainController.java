/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group1.controller;

import group1.dao.CategoryDAO;
import group1.dao.PostDAO;
import group1.dto.CategoryDTO;
import group1.dto.PostDTO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Admin
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {
    private static final String ADMIN = "admin.jsp";
    private static final String ERROR = "error.jsp";
    private static final String SHOW_DETAIL_POST = "showDetailPostController";
    private static final String APPROVE_DENY_POST = "ApproveDenyPostController";
    private static final String LOGIN = "LoginController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if ("Show details".equals(action)) {
                url=SHOW_DETAIL_POST;
            }else if ("Approve".equals(action)) {
                url=APPROVE_DENY_POST;
            }else if ("Deny".equals(action)) {
                url=APPROVE_DENY_POST;
            }
            else if ("Login".equals(action)) {
                url=LOGIN;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
        
        try {
            ArrayList<PostDTO> listPost = PostDAO.getAllPost();
            ArrayList<CategoryDTO> listCategory = CategoryDAO.getAllCategory();
            
            if(listPost != null){
                HttpSession session = request.getSession();
                session.setAttribute("LIST_POST", listPost);
                session.setAttribute("LIST_CATEGORY", listCategory);
            }
        } catch (Exception e) {
           
        } finally {
            request.getRequestDispatcher(ADMIN).forward(request, response);
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
