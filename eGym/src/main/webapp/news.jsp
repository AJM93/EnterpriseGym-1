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
    <link href="css/style.css" rel="stylesheet" />     

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <!-- Bootstrap Form Helpers -->
    <link href="http://bootstrapformhelpers.com/assets/css/bootstrap-formhelpers.min.css" rel="stylesheet" media="screen">
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <script src="assets/js/jquery.validate.js"></script> 
    <!-- jQuery -->
    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <!-- Bootstrap -->
    <script src="http://bootstrapformhelpers.com/assets/js/bootstrap.min.js"></script>
    <!-- Bootstrap Form Helpers -->
    <script src="http://bootstrapformhelpers.com/assets/js/bootstrap-formhelpers.min.js"></script>


    <div id="news" class="pad-section">
        <div class="container">       

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