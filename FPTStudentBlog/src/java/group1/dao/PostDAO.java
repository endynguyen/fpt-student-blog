/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group1.dao;

import group1.dto.PostDTO;
import group1.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class PostDAO {
     public static ArrayList<PostDTO> getAvailablePost() throws SQLException{
        ArrayList<PostDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = "select * from tblPosts \n"+
                             "Where statusPID = '1'";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    if(list == null) list = new ArrayList<>();
                    int postID=rs.getInt("postID");
                    String userID=rs.getString("userID");
                    String status=rs.getString("statusPID");
                    String category=rs.getString("categoryID");
                    String title=rs.getString("title");
                    String postContent=rs.getString("postContent");
                    String date=rs.getString("date");
                    int vote=rs.getInt("vote");
                    list.add(new PostDTO(postID, userID, status, category, title, postContent, date, vote));
                }
            }
        } catch (Exception e) {
            
        } finally {
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(conn != null) conn.close();
        }
        return list;
    }
     
    
       public List<PostDTO> getAllPost() throws SQLException {
        List<PostDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select * from tblPosts ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int postID=rs.getInt("postID");
                    String userID=rs.getString("userID");
                    String status=rs.getString("statusPID");
                    String category=rs.getString("categoryID");
                    String title=rs.getString("title");
                    String postContent=rs.getString("postContent");
                    String date=rs.getString("date");
                    int vote=rs.getInt("vote");
                    list.add(new PostDTO(postID, userID, status, category, title, postContent, date, vote));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    //public int getPostByID(String postID){
    //    return 0;
    //}
    
    public static ArrayList<PostDTO> getAllPostByCategory(int categoryID) throws SQLException{
        ArrayList<PostDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = "select * from tblPosts\n"+
                             "Where categoryID = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, categoryID);
                rs = stm.executeQuery();
                while(rs.next()){
                    if(list == null) list = new ArrayList<>();
                    int postID=rs.getInt("postID");
                    String userID=rs.getString("userID");
                    String status=rs.getString("statusPID");
                    String category=rs.getString("categoryID");
                    String title=rs.getString("title");
                    String postContent=rs.getString("postContent");
                    String date=rs.getString("date");
                    int vote=rs.getInt("vote");
                    list.add(new PostDTO(postID, userID, status, category, title, postContent, date, vote));
                }
            }
        }catch(Exception e){
        }finally{
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(conn != null) conn.close();
        }
    return list;
    }
    
    public static ArrayList<PostDTO> getAvailablePostByCategory(int categoryID) throws SQLException{
        ArrayList<PostDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = "select * from tblPosts\n"+
                             "where categoryID = ? and statusPID = '1'";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, categoryID);
                rs = stm.executeQuery();
                while(rs.next()){
                    if(list == null) list = new ArrayList<>();
                    int postID=rs.getInt("postID");
                    String userID=rs.getString("userID");
                    String status=rs.getString("statusPID");
                    String category=rs.getString("categoryID");
                    String title=rs.getString("title");
                    String postContent=rs.getString("postContent");
                    String date=rs.getString("date");
                    int vote=rs.getInt("vote");
                    list.add(new PostDTO(postID, userID, status, category, title, postContent, date, vote));
                }
            }
        }catch (Exception e) {
            
        }finally{
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(conn != null) conn.close();
        }
        return list;
    }
}
