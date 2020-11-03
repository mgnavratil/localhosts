import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;



@WebServlet("/SearchNavratil")
public class getdata extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public getdata() {
      super();
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



     
	
       

   }


   public JSONArray getJsonObject2() {


       JSONObject dataSet = new JSONObject();
       dataSet.put("title", "test json");
       dataSet.put("url", "www.google.com");
        dataSet.put("start", "2020-10-02");
      
        JSONObject dataSet2 = new JSONObject();
        dataSet2.put("title", "test json2");
        dataSet2.put("url", "www.google.com");
         dataSet2.put("start", "2020-10-03");
         
         
         JSONObject dataSet3 = new JSONObject();
         dataSet3.put("title", "test json3");
         dataSet3.put("url", "www.google.com");
          dataSet3.put("start", "2020-10-04");
          JSONObject dataSet4 = new JSONObject();
          dataSet4.put("title", "test json4");
          dataSet4.put("url", "www.google.com");
           dataSet4.put("start", "2020-10-05");




       JSONArray properties = new JSONArray();
       properties.add(dataSet);
       properties.add(dataSet2);
       properties.add(dataSet3);
       properties.add(dataSet4);
       
       



   
       return properties;
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	      String name = request.getParameter("data2");
	      response.getWriter().print("Hello "+ name + "!!");
	   
	 
   }

}
