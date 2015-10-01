<%@page import="java.util.regex.Pattern"%>
<%-- 
     Document   : news
     Created on : 17-Sep-2015, 16:47:44
     Author     : Dreads
--%>

<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Iterator"%>
<%@page import="Models.NewsModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>

    <div id="news" class="pad-section">
        <div class="container">
            <div class="col-md-12">
                <ol class="breadcrumb">
                    <li><a href="/eGym/homePage">Home</a></li>
                    <li><a href="/eGym/news">News</a></li>
                </ol>
            </div>

        <%
            LinkedList<NewsModel> llsr = (LinkedList<NewsModel>) request.getAttribute("NewsList");

            for (NewsModel n : llsr) {
                boolean htmlTag = false;
                String originalBody = n.getNewsBody();
                String noHtmlBody = "";

                for (int i = 0; i < originalBody.length(); ++i) {
                    if (!htmlTag && originalBody.charAt(i) == '<') {
                        htmlTag = true;
                        continue;
                    }
                    if (htmlTag && originalBody.charAt(i) == '>') {
                        htmlTag = false;
                        continue;
                    }
                    if (!htmlTag) {
                        noHtmlBody = noHtmlBody + originalBody.charAt(i);
                    }
                }

                String bodyDisplay = noHtmlBody.substring(0, Math.min(noHtmlBody.length(), 70));
                bodyDisplay = bodyDisplay + "...";
        %>             
        <div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading" style="min-height: 50px; max-height: 50px;">
                        <h3 class="panel-title"><a href="/eGym/NewsItem/<%=n.getNewsId()%>"><%=n.getNewsTitle()%></a></h3>
                    </div>
                    <div class="panel-body" style="min-height: 100px; max-height: 100px;">
                        <%=bodyDisplay%>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>             
    </div>

</div>
</div>     
<jsp:include page="footer.jsp"></jsp:include>