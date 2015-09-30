<%-- 
    Document   : viewCarouselInformation
    Created on : 30-Sep-2015, 14:41:38
    Author     : Dreads
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Stores.CarouselImageStore"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Stores.LoggedIn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
    <div id="services" class="pad-section">
    <%
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
        if (lg != null && lg.isLoggedIn()) {
            if (lg.getRole() == 2 || lg.getRole() == 3) { // logged in user is an editor or an admin
%>


    <h1>Carousel Details</h1>
    <div class="table-responsive">    
        <table class="table" >
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Image</th>
                    <th>Image Link</th>
                    <th>Caption Link</th>
                    <th>Caption Text</th>
                    <th>Replace Carousel Item</th>
                </tr>    
            </thead>
            <tbody>
            <%
                LinkedList<CarouselImageStore> carouselList = (LinkedList<CarouselImageStore>) request.getAttribute("CarouselList");
                Iterator<CarouselImageStore> iterator = carouselList.iterator();
                while(iterator.hasNext())
                {
                    CarouselImageStore cis = (CarouselImageStore) iterator.next();
                    int id = cis.getId();
                    String imageLink = cis.getImageLink();
                    String captionLink = cis.getCaptionLink();
                    String captionText = cis.getCaptionText();
            %>
                <tr>
                    <td><%=id%></td>
                    <td><img src="<%=imageLink%>" style="height:100px; width:100px;"></td>
                    <td><%=imageLink%></td>
                    <td><%=captionLink%></td>
                    <td><%=captionText%></td>
                    <td><form action="EditCarousel.jsp"><button type="submit" class="btn btn-default" name="CarouselId" value=<%=id%>>Replace</button></form></td>
                </tr>
            <%
                }
            %>
            </tbody>
             </table>       
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
