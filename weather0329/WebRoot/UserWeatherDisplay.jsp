<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" errorPage="error.jsp"%>
<%@ page import="bean.Weather"%>
<%@ page import="dao.WeatherDao"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.List" %>
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <title>Weather Forecast</title>
    <meta charset="utf-8">
    <link rel="icon" href="http://dzyngiri.com/favicon.png" type="image/x-icon">
    <link rel="shortcut icon" href="http://dzyngiri.com/favicon.png" type="image/x-icon" />
    <meta name="description" content="Codester is a free responsive Bootstrap template by Dzyngiri">
    <meta name="keywords" content="free, template, bootstrap, responsive">
    <meta name="author" content="Inbetwin Networks">
    <link rel="stylesheet" href="css/bootstrap.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/responsive.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/touchTouch.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/kwicks-slider.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/my.css" type="text/css" media="screen">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/superfish.js"></script>
    <script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
    <script type="text/javascript" src="js/jquery.kwicks-1.5.1.js"></script>
    <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="js/jquery.cookie.js"></script>
    <script type="text/javascript" src="js/touchTouch.jquery.js"></script>
    <script type="text/javascript">if($(window).width()>1024){document.write("<"+"script src='js/jquery.preloader.js'></"+"script>");}	</script>
    <script language="javascript">
    function ale()
    {//这个基本没有什么说的，就是弹出一个提醒的对话框
    alert("对不起，您没有相应权限");
    window.navigate("home.jsp");  
    }
    </script>
    <script>
        jQuery(window).load(function() {
            $x = $(window).width();
            if($x > 1024)
            {
                jQuery("#content .row").preloader();    }

            jQuery('.magnifier').touchTouch();
            jQuery('.spinner').animate({'opacity':0},1000,'easeOutCubic',function (){jQuery(this).css('display','none')});
        });

    </script>

    <!--[if lt IE 8]>
    <div style='text-align:center'><a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://www.theie6countdown.com/img/upgrade.jpg"border="0"alt=""/></a></div>
    <![endif]-->
    <!--[if (gt IE 9)|!(IE)]><!-->
    <!--<![endif]-->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link rel="stylesheet" href="css/docs.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/ie.css" type="text/css" media="screen">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400' rel='stylesheet' type='text/css'>
    <![endif]-->

    <!--Google analytics code-->
    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-29231762-1']);
        _gaq.push(['_setDomainName', 'dzyngiri.com']);
        _gaq.push(['_trackPageview']);

        (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script>
</head>

<body>
<div class="spinner"></div>
<!-- header start -->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>Weather Forecast</title>
    <meta charset="utf-8">
    <link rel="icon" href="http://dzyngiri.com/favicon.png" type="image/x-icon">
    <link rel="shortcut icon" href="http://dzyngiri.com/favicon.png" type="image/x-icon" />
    <meta name="description" content="Codester is a free responsive Bootstrap template by Dzyngiri">
    <meta name="keywords" content="free, template, bootstrap, responsive">
    <meta name="author" content="Inbetwin Networks">
    <link rel="stylesheet" href="css/bootstrap.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/responsive.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/touchTouch.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/kwicks-slider.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/my.css" type="text/css" media="screen">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/superfish.js"></script>
    <script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
    <script type="text/javascript" src="js/jquery.kwicks-1.5.1.js"></script>
    <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="js/jquery.cookie.js"></script>
    <script type="text/javascript" src="js/touchTouch.jquery.js"></script>
    <script type="text/javascript">if($(window).width()>1024){document.write("<"+"script src='js/jquery.preloader.js'></"+"script>");}	</script>

    <script>
        jQuery(window).load(function() {
            $x = $(window).width();
            if($x > 1024)
            {
                jQuery("#content .row").preloader();    }

            jQuery('.magnifier').touchTouch();
            jQuery('.spinner').animate({'opacity':0},1000,'easeOutCubic',function (){jQuery(this).css('display','none')});
        });

    </script>

    <!--[if lt IE 8]>
    <div style='text-align:center'><a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://www.theie6countdown.com/img/upgrade.jpg"border="0"alt=""/></a></div>
    <![endif]-->
    <!--[if (gt IE 9)|!(IE)]><!-->
    <!--<![endif]-->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link rel="stylesheet" href="css/docs.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/ie.css" type="text/css" media="screen">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400' rel='stylesheet' type='text/css'>
    <![endif]-->

    <!--Google analytics code-->
    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-29231762-1']);
        _gaq.push(['_setDomainName', 'dzyngiri.com']);
        _gaq.push(['_trackPageview']);

        (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script>
</head>

<body>
<div class="spinner"></div>
<!-- header start -->
<header>
    <div class="container clearfix">
        <div class="row">
            <div class="span12">
                <div class="navbar navbar_">
                    <div class="container">
                        <h1 class="brand brand_"><a href="UserIndex.jsp"><!--<span class="header1">Weather Forecast </span>--><img alt="" src="img/mine/icon.jpg"> </a></h1>
                        <a class="btn btn-navbar btn-navbar_" data-toggle="collapse" data-target=".nav-collapse_">Menu <span class="icon-bar"></span> </a>
                        <div class="nav-collapse nav-collapse_  collapse">
                            <ul class="nav sf-menu">
                                <li><a href="" onlick="ale()">用户管理</a></li>
                                <li  class="active"><a href="UserWeatherModify.jsp">历史数据</a></li>
                                <li><a href="UserHadoop.jsp">数据分析</a></li>
                                <li class="sub-menu"><a >文献资料</a>
                                    <ul>
                                        <li><a href="UserUpLoad.jsp">文件上传</a></li>
                                        <li><a href="servlet/ListFileServlet">文件下载</a></li>
                                        <li><a href="UserProcess3.jsp">可读文档</a></li>
                                    </ul>
                                </li>
                                <li><a href="UserMessboard.jsp">意见反馈</a></li>
                                <%String name=(String)session.getAttribute("name"); %>
                                <li><p3>欢迎，<%=name%></p3><button onclick="window.location.href='Logout.jsp'">退出</button></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<div class="bg-content">
    <div class="container">
        <div class="row">
            <div class="span12">
                <!-- slider -->
                <div class="flexslider">
                    <ul class="slides">
                        <li> <img src="img/mine/slide-1.jpg" alt="" > </li>
                        <li> <img src="img/mine/slide-2.jpg" alt="" > </li>
                        <li> <img src="img/mine/slide-3.jpg" alt="" > </li>
                        <li> <img src="img/mine/slide-4.jpg" alt="" > </li>
                        <li> <img src="img/mine/slide-5.jpg" alt="" > </li>
                    </ul>
                </div>
                <span id="responsiveFlag"></span>
                
            </div>
        </div>
    </div>

    <!-- content -->

    <div id="content" class="content-extra"><div class="ic"></div>
        <div class="row-1">
            <div class="container">
                <div class="row">
                    <article class="span12">
                        <h4>Our Work</h4>
                    </article>
                    <div class="clear"></div>
                    <ul class="portfolio clearfix">
                        <table width="90%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#F6B83B" bordercolorlight="#FFFFFF">
   <tr align="center" bgcolor="#e3F4F7">  
    <td width="12%" bgcolor="#e7e8e8">省份</td>
    <td width="10%" bgcolor="#e7e8e8">月序</td>
    <td width="12%" bgcolor="#e7e8e8">累年月平均气压（百帕）</td>
    <td width="12%" bgcolor="#e7e8e8">累年月平均气温（摄氏度）</td>
    <td width="12%" bgcolor="#e7e8e8">累年月平均相对湿度（%）</td>
    <td width="12%" bgcolor="#e7e8e8">累年月平均降水量（毫米）</td>
    <td width="12%" bgcolor="#e7e8e8">累年月平均风速（米/秒）</td>

  </tr>
    <%String provinceName=(String)request.getAttribute("provinceName"); %>
    <%Weather weather=new Weather(provinceName) ;%>
    <%List<Weather> weatherList=WeatherDao.printProvinceWeather(weather); %>
    <%for(Weather weathers: weatherList){
       }%>
    <% for(Weather weathers: weatherList){%>
  <tr align="center">
    <td style="padding:5px;"><%= weathers.getProvince()%></td>  
    <td style="padding:5px;"><%= weathers.getMonth()%></td>
    <td style="padding:5px;"><%= weathers.getAvgPressure()%></td>
    <td style="padding:5px;"><%= weathers.getAvgTemperature()%></td>
    <td style="padding:5px;"><%= weathers.getAvgHumidity()%></td>
    <td style="padding:5px;"><%= weathers.getAvgPrecipitation()%></td>
    <td style="padding:5px;"><%= weathers.getAvgWindSpeed()%></td>
  </tr>
    <%}%>                       
                    </ul>
                </div>
            </div>
        </div>

<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>