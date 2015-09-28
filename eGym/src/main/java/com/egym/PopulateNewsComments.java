/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.egym;

import Models.NewsCommentModel;
import Stores.NewsCommentsFetch;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Paris
 */

@WebServlet("/PopulateNewsComments")
public class PopulateNewsComments extends HttpServlet{
    
    
    private static final long serialVersionUID = 1L;

    public PopulateNewsComments() {
        
    }
 
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
  ArrayList<NewsCommentModel> newsComments=new ArrayList<NewsCommentModel>();
  newsComments= NewsCommentsFetch.getAllNewsComments(1);
  Gson gson = new Gson();
  JsonElement element = gson.toJsonTree(newsComments, new TypeToken<List<NewsCommentModel>>() {}.getType());

  JsonArray jsonArray = element.getAsJsonArray();
  response.setContentType("application/json");
  response.getWriter().print(jsonArray);
  
 }
    
}
