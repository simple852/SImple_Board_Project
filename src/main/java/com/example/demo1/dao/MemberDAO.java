package com.example.demo1.dao;

import java.sql.*;

public class MemberDAO {
    public Connection con;
    public Statement st;
    public PreparedStatement ps;
    public ResultSet rs;



    public MemberDAO() { // default 생성자 db 연결만
        String url = "jdbc:mysql://localhost:3306/project1";
        String id = "root";
        String pw = "1234";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, id, pw);
            System.out.println("DB 연결 성공");
            st = con.createStatement();
        } catch (Exception e) {
            System.out.println("DB연결 실패");
            System.out.println("사유 :" + e.getMessage());
        }
    }

    public boolean check_id(String id) {
        boolean result = false;
        String search = "select * from member_tbl where member_id =?";

        try{
            ps = con.prepareStatement(search);
            ps.setString(1, id);
            rs = ps.executeQuery();  // 중복 확인을 위한 서치 쿼리문
            if (!rs.next()) {
                System.out.println("있음");
                //사용가능한 아이디
                result = true;
            } else {

                //중복으로 사용불가
                result = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

}
