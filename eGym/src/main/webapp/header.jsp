<%@page import="Stores.CarouselImageStore"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Models.*"%>
<%@page import="Stores.LoggedIn"%>
<!DOCTYPE html>
<html lang="en">



<head>
    <%
        CarouselImageModel imageModel = new CarouselImageModel();
        LinkedList<CarouselImageStore> carouselImage = imageModel.getImages();
    %>
    <meta charset="utf-8" />
    <meta name="author" content="Script Tutorials" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='http://fonts.googleapis.com/css?family=Economica' rel='stylesheet' type='text/css'>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/css/half-slider.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    

</head>

<body>

	<script>(function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.4&appId=684175961620254";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>
        <script>window.twttr = (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0],
                        t = window.twttr || {};
                if (d.getElementById(id))
                    return t;
                js = d.createElement(s);
                js.id = id;
                js.src = "https://platform.twitter.com/widgets.js";
                fjs.parentNode.insertBefore(js, fjs);

                t._e = [];
                t.ready = function (f) {
                    t._e.push(f);
                };

                return t;
            }(document, "script", "twitter-wjs"));</script>
    <%
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
        if (lg != null && lg.isLoggedIn()) { %>
        <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/eGym/homePage"><img src="${pageContext.request.contextPath}/images/logo-eg.png"></a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="/eGym/news">News</a>
                    </li>
                    <li>
                        <a href="/eGym/events">Events</a>
                    </li>
                   
                    <li>
                        <a href="/eGym/GetQuizzes">Quizzes</a>
                    
                </ul>
                </li>
                <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="/eGym/profile/<%=lg.getUsername()%>">Profile</a>
                    </li>
                <% if (lg.getRole() == 2 || lg.getRole() == 3) {%>
                    <li class="dropdown pull-right">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">Admin<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="/eGym/GetAllUsers">View/Edit Users</a></li>
                            <li><a href="/eGym/approveUsers">Approve Users</a></li>
                            <li><a href="/eGym/createNews">Create News</a></li>
                            <li><a href="/eGym/createActivity">Create Activity</a></li>
                            <li><a href="/eGym/CreateQuiz.jsp">Create Quiz</a></li>
                            <li><a href="/eGym/quickRegistration.jsp">Quick Registration</a></li>
                            <li><a href="/eGym/GetCarouselInformation">Edit Carousel</a><li>
                            <li class="divider"></li>

                        </ul>
                    </li>
                <%}%>
                    <li><a href="/eGym/logout">Sign Out</a></li>
                </ul>
              
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
        
    <% }else{ %>   
    
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/eGym/homePage"><img src="${pageContext.request.contextPath}/images/logo-eg.png"></a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="/eGym/news">News</a>
                    </li>
                    <li>
                        <a href="/eGym/events">Events</a>
                    </li>
                    
                </ul>
				<ul class="nav navbar-nav navbar-right">
                         <li>
                             <a href="/eGym/login.jsp">Sign In</a>
                            
                        </li>
                        <li> <a href="/eGym/register">Register</a></li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <% 
            }
    %>

    <!-- Half Page Image Background Carousel Header -->
    <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for Slides -->
        <div class="carousel-inner">
            <div class="item active">
                <!-- Set the first background image using inline CSS below. -->
                <div class="fill" style="background-image:url('<%=carouselImage.get(0).getImageLink()%>');"></div>
                
                <div class="carousel-caption">
                    <h2> <a href="<%=carouselImage.get(0).getCaptionLink()%>"><%=carouselImage.get(0).getCaptionText()%> </a> </h2>
                </div>
            </div>
            <div class="item">
                <!-- Set the second background image using inline CSS below. -->
                <div class="fill" style="background-image:url('<%=carouselImage.get(1).getImageLink()%>');"></div>
                <div class="carousel-caption">
                    <h2> <a href="<%=carouselImage.get(1).getCaptionLink()%>"><%=carouselImage.get(1).getCaptionText()%> </a> </h2>
                </div>
            </div>
            <div class="item">
                <!-- Set the third background image using inline CSS below. -->
                <div class="fill" style="background-image:url('<%=carouselImage.get(2).getImageLink()%>');"></div>
                <div class="carousel-caption">
                    <h2> <a href="<%=carouselImage.get(2).getCaptionLink()%>"><%=carouselImage.get(2).getCaptionText()%> </a> </h2>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>

    </header>

