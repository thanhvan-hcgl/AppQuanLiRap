/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.NgonNgu;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import util.Database;

/**
 *
 * @author leanh
 */
public class NgonNguModel {
    public static ArrayList<NgonNgu> taiTatCa() throws SQLException {
        ArrayList<NgonNgu> arr = new ArrayList<>();
        String sql = "select * from ngonngu";
        ResultSet rs = Database.callQuery(sql);
        while(rs.next()) {
            arr.add(new NgonNgu(rs.getString(1), rs.getString(2)));
        }
        return arr;
    }
}
