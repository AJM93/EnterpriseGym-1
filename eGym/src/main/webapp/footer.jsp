<%-- 
    Document   : footer
    Created on : Sep 27, 2015, 11:33:50 PM
    Author     : Yogi
--%>
<jsp:include page="contact.jsp"></jsp:include>
<!-- footer -->
    <hr />
    <div class="container" style="padding: 5px;">
        <div class="row">
            <div class="col-md-4">
                <div class="fb-follow" data-href="https://www.facebook.com/EnterpriseGym" data-layout="standard" data-show-faces="true"></div>
            </div>
            
            <div class="col-md-4">
                <a class="twitter-follow-button"
                   href="https://twitter.com/Enterprise_Gym">
                    Follow @TwitterDev</a>
            </div>
            
            <div class="col-md-4">
                <p class="text-right">Copyright &copy; The Enterprise Gym 2015</p>
            </div>
        </div>
    </div>
<!-- /footer -->

<!-- attach JavaScripts -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
</script>
</body>
</html>
