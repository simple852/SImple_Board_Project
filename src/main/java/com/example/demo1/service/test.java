package com.example.demo1.service;

import com.example.demo1.dao.MemberDAO;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/test")
public class test extends HttpServlet {

    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String test = req.getParameter("test");
        System.out.println(test);
        System.out.println("접속확인");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");


        PrintWriter writer = resp.getWriter();
        MemberDAO memberDAO = new MemberDAO();
        JSONObject json = new JSONObject();

        String id = req.getParameter("id");// 파라미터 아이디
        Pattern reg = Pattern.compile("^[A-Za-z0-9]{4,12}$"); // 영어 숫자체크
        String search = "select * from member_tbl where member_id =?";
        Matcher matcher = reg.matcher(id);


        try{
            ps = memberDAO.con.prepareStatement(search);
            ps.setString(1, id);
            rs = ps.executeQuery();  // 중복 확인을 위한 서치 쿼리문
            if (!rs.next()) {
                json.put("check2",true);
                System.out.println("문제1");

            }else{
                json.put("check2",false);
                System.out.println("문제2");
            }
            if(!matcher.find()){
                json.put("check",false);
                System.out.println("문제3");
            }else{
                json.put("check",true);
                System.out.println("문제4");
            }


        } catch (SQLException e) {
            System.out.println("디비에러");

        }

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        System.out.println(json);
        writer.println(json);

        writer.flush();

    }
}
