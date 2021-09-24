/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group1.dao;

import group1.dto.CategoryDTO;
import group1.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class CategoryDAO {
    public static ArrayList<CategoryDTO> getAllCategory() throws SQLException{
        ArrayList<CategoryDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = "Select categoryID, categoryName\n" +
                             "From tblCategories \n";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while(rs.next()){
                    if(list == null) list = new ArrayList<>();
                    list.add(new CategoryDTO(rs.getInt("categoryID"),
                            rs.getString("categoryName")));
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
}
