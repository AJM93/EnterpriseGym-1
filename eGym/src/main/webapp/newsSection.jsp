<%-- 
    Document   : newsSection
    Created on : 27-Sep-2015, 18:46:46
    Author     : danielmackay
--%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Iterator"%>
<%@page import="Models.NewsModel"%>


<%
    NewsModel nm = new NewsModel();
    java.util.LinkedList<NewsModel> NewsList = nm.getHomeNews();  
%>

<div id="information" class="pad-section">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title">Additional information</h2>
                    </div>
                    <img src="images/CalanderImage.PNG" class="img-rounded" alt="Cinque Terre" >
                </div>
            </div>
            <div class="col-sm-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title">Additional information</h2>
                    </div>
                    <div class="panel-body lead">
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
                                        <%=NewsList.get(0).getNewsBody()%>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
