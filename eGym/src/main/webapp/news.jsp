<%-- 
    Document   : news
    Created on : 17-Sep-2015, 16:47:44
    Author     : Dreads
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Iterator"%>
<%@page import="Models.NewsModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    </head>
    <body>
        <table width='700px' border='1px'>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Body</th>
                <th>User</th>
            </tr>
        <%
            ArrayList news_titles = new ArrayList();
            ArrayList news_body = new ArrayList();
            ArrayList news_user = new ArrayList();
            LinkedList<NewsModel> llsr = (LinkedList<NewsModel>) request.getAttribute("NewsList");
            Iterator<NewsModel> iterator;
            iterator = llsr.iterator();
            while (iterator.hasNext()) 
            {
                NewsModel nm = (NewsModel) iterator.next();
                int id = nm.getNewsId();
                String Title = nm.getNewsTitle();
                String Body = nm.getNewsBody();
                String User = nm.getNewsUser();
                news_titles.add(id + ": " + Title);
                news_body.add(Body);
                news_user.add(User);
        %>
            <tr>
                <td><%=id%></td>
                <td><%=Title%></td>
                <td><%=Body%></td>
                <td><%=User%></td>
            </tr>
            <%
            }
        %>
        </table>
        
        <h2 id="newsFeed">News Feed</h2>
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                    <div id="divOne"class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne">
                                    <h4 class="panel-title">
                                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne"><%=news_titles.get(0)%></a>
                                    </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                                <p>User: <%=news_user.get(0)%></p>    
                                <div class="panel-body">
                                        <%=news_body.get(0)%>
                                </div>
                                    
                            </div>
                    </div>
                    <div id="divTwo" class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingTwo">
                                    <h4 class="panel-title">
                                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo"><%=news_titles.get(1)%></a>
                                    </h4>
                            </div>
                            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                    <p>User: <%=news_user.get(1)%></p>    
                                <div class="panel-body">
                                        <%=news_body.get(1)%>
                                </div>
                            </div>
                    </div>
                    <div id="divThree" class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingThree">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree"><%=news_titles.get(2)%></a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                            <p>User: <%=news_user.get(2)%></p>    
                                <div class="panel-body">
                                        <%=news_body.get(2)%>
                                </div>
                        </div>
                    </div>
                    <div id="divFour" class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingFour">
                                    <h4 class="panel-title">
                                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour"><%=news_titles.get(3)%></a>
                                    </h4>
                            </div>
                            <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                                    <p>User: <%=news_user.get(3)%></p>    
                                <div class="panel-body">
                                        <%=news_body.get(3)%>
                                </div>
                            </div>
                    </div>
                    <div id="divFive" class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingFive">
                                    <h4 class="panel-title">
                                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive"><%=news_titles.get(4)%></a>
                                    </h4>
                            </div>
                            <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
                                    <p>User: <%=news_user.get(4)%></p>    
                                <div class="panel-body">
                                        <%=news_body.get(4)%>
                                </div>
                            </div>
                    </div>       
                    <div id="divSix" class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingSix">
                                    <h4 class="panel-title">
                                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseSix"><%=news_titles.get(5)%></a>
                                    </h4>
                            </div>
                            <div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
                                    <p>User: <%=news_user.get(5)%></p>    
                                <div class="panel-body">
                                        <%=news_body.get(5)%>
                                </div>
                            </div>
                    </div>            
            </div>
        
    </body>
</html>
