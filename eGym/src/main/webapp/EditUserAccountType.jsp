<%-- 
    Document   : EditUserAccountType
    Created on : 29-Sep-2015, 16:21:17
    Author     : Dreads
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Stores.UserTypes"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
<%
    String Username = (String) request.getAttribute("Username");
    String memberType = (String) request.getAttribute("MemberType");
    int typeVal = Integer.parseInt(memberType);
    LinkedList<UserTypes> userType = (LinkedList<UserTypes>) request.getAttribute("UserTypes");
    Iterator<UserTypes> typeIterator = userType.iterator();
%>
    <div id="services" class="pad-section">
        <div class="container">    
            <h1>Edit User's Account Type</h1>
            <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">  
                <div class="bs-example">
                    <form method="POST"  action="UpdateUserAccountType">
                        <div class="form-group">
                            <label for="inputUsername">Username</label>
                            <input type="text" class="form-control" id="inputUsername" name="username" readonly value="<%=Username%>">
                        </div>
                        
                        <div class="from-group">
                            <label for="userType">User Type</label>
                            <select name="userType" required>
                                <%
                                    while(typeIterator.hasNext())
                                    {
                                        UserTypes st = typeIterator.next();
                                        if(st.getId() == typeVal){
                                %>
                                <option selected value="<%=st.getId()%>"><%=st.getType()%></option>
                                <%
                                    }else{
                                %>
                                <option value="<%=st.getId()%>"><%=st.getType()%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                       <button type="submit" value="UpdateUserAccountType" class="btn btn-default">Confirm</button>      
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>