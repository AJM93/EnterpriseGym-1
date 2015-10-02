<%-- 
    Document   : EditCarousel
    Created on : 30-Sep-2015, 17:13:59
    Author     : Dreads
--%>

<%@page import="Stores.LoggedIn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="header.jsp"></jsp:include>
        <div id="services" class="pad-section">
    <%
        String carouselId = request.getParameter("CarouselId");
        int id = Integer.parseInt(carouselId);
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
        if (lg != null && lg.isLoggedIn()) {
            if (lg.getRole() == 2 || lg.getRole() == 3) { // logged in user is an editor or an admin
    %>
    <div class="container">    
        <h1>Enter Carousel Item</h1>
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">  
            <div class="bs-example">
                <form method="POST"  action="updateCarouselItem">
                    <input type="hidden" id="carouselId" name="carouselId" value="<%=id%>">
                    <div class="form-group">
                        <label for="pictureLink">Picture Link</label>
                        <input type="text" class="form-control" id="pictureLink" name="pictureLink" required placeholder="Enter the link to the Picture">
                    </div>
                    <div class="form-group">
                        <label for="captionLink">Caption Link</label>
                        <input type="text" class="form-control" id="captionLink" name="captionLink" required placeholder="Enter a link for the Picture Caption">
                    </div>
                    <div class="form-group">
                        <label for="captionText">Caption Text</label>
                        <input type="text" class="form-control" id="captionText" name="captionText" required placeholder="Enter the text for the Picture Caption">
                    </div>
                    <button type="submit" value="Submit" class="btn btn-default">Submit</button>
                </form>
            </div>
        </div>
    </div>
    <%
    } else {
    %>                
    <h1>You are not authorised to view this page. Please <a href="<%=response.encodeURL("login.jsp")%>">sign in</a> as an administrator.</h1>
    <%
        }
    } else {
    %>
    <h1>Please <a href="<%=response.encodeURL("login.jsp")%>">sign in</a></h1>
    <%
        }
    %>
</div>
<jsp:include page="footer.jsp"></jsp:include>