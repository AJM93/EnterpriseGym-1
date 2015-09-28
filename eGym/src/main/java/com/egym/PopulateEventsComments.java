package com.egym;

import Models.EventsCommentModel;
import Stores.EventsCommentsFetch;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;


@WebServlet("/PopulateEventsComments")
public class PopulateEventsComments extends HttpServlet {
 private static final long serialVersionUID = 1L;

    
 
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
    // get the news ID from the URL that triggered the servlet
    /*String path = request.getPathInfo();
    int urlEventsID = Integer.parseInt(path.substring(1));*/
     
  ArrayList<EventsCommentModel> eventsComments=new ArrayList<EventsCommentModel>();
  //eventsComments=EventsCommentsFetch.getAllEventsComments(3);
  eventsComments=EventsCommentsFetch.getAllEventsComments(3);
  Gson gson = new Gson();
  JsonElement element = gson.toJsonTree(eventsComments, new TypeToken<List<EventsCommentModel>>() {}.getType());

  JsonArray jsonArray = element.getAsJsonArray();
  response.setContentType("application/json");
  response.getWriter().print(jsonArray);
  
 }

}
