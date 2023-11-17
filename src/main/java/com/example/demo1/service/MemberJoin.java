package com.example.demo1.service;

import com.example.demo1.dao.MemberDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/join")
public class MemberJoin extends HttpServlet {
    private Connection con;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        MemberDAO memberDAO = new MemberDAO();
//        String id = req.getParameter("logid");
//        String search = "select * from member_tbl where member_id =?";
//
//
//        try{
//            ps = con.prepareStatement(search);
//            ps.setString(1, id);
//            rs = ps.executeQuery(search);  // 중복 확인을 위한 서치 쿼리문
//            if (rs == null) {
//                //사용 가능한 아이디
//                                                              여긴 필요 없지 않나 ? 그쵸 형?
//            } else {
//                //중복으로 사용불가
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//
//        System.out.println(rs);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        MemberDAO memberDAO = new MemberDAO();

        String id = req.getParameter("joinId");
        String pw = req.getParameter("joinPw");
        String name = req.getParameter("joinName");
        System.out.println(id);
        String sql = "insert into member_tbl(member_id, member_pw, member_name) value(?, ?, ?)";
        String search = "select * from member_tbl where member_id =?";



        try {

            ps = con.prepareStatement(search);
            ps.setString(1, id);
            rs = ps.executeQuery(); // 중복 확인을 위한 서치 쿼리문


            if (!rs.next()) { // 가져온 결과에 값이 없을 때 insert
                System.out.println("성공");
                ps = memberDAO.con.prepareStatement(sql);
                ps.setString(1, id);
                ps.setString(2, pw);
                ps.setString(3, name);
                ps.executeUpdate();
                req.setAttribute("success", "true");
                resp.sendRedirect("Project1/login.jsp?success=true");
            } else {
                resp.sendRedirect("Project1/login.jsp?success=false");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


    }






}
