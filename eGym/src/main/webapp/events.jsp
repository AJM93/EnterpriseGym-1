<%-- 
    Document   : events
    Created on : Sep 18, 2015, 1:56:54 PM
    Author     : Paris
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Iterator"%>
<%@page import="Models.EventsModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="header.jsp"></jsp:include>
<div id="news" class="pad-section">
        <div class="container">       
        
        <%
            
            LinkedList<EventsModel> llsr = (LinkedList<EventsModel>) request.getAttribute("EventsList");
           
           for (EventsModel t : llsr){
        %>
           <div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading" style="min-height: 50px; max-height: 50px;">
                        <h3 class="panel-title"><a href="/eGym/EventItem/<%=t.getEventID()%>"><%=t.getEventTitle()%></a></h3>
                    </div>
                    <div class="panel-body" style="min-height: 100px; max-height: 100px;">
                        <%="body of event..."%>
                    </div>
                </div>
            </div>
        </div>
            <%
            }
        %>
        
        </div>
       
<jsp:include page="footer.jsp"></jsp:include>