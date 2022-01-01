<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TechBlog..</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
      .banner-background{
      clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
     }
      .post-title{
           	text-align: center;
            font-weight:400;
            font-size: 25px;
            }
            .post-content{
            font-weight:100;
            font-size: 18px;
            }
     
</style>

 </head>
<body>  
<%@ include file="normal_navbar.jsp"%>

<!-- Banner -->
<div class = "container-fluid p-0 m-0 mb-3 banner-background">
	<div class="h-50 p-5 bg-light border rounded-3 primary-background">

			<div class = "container">
			<h3 class = "text-center display-3">Welcome to Tech Blog</h3>
			<p >Welcome to Technical Blog, world of technology is waiting for you !!</p>
			<p>A programming language is a formal language comprising a set of strings that produce various kinds of machine code output. Programming languages are one kind of computer language, and are used in computer programming to implement algorithms.
			</p>
			<p>Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages. Since the early 1800s, programs have been used to direct the behavior of machines such as Jacquard looms, music boxes and player pianos.
			</p>
				      <button class="btn btn-outline-light btn-lg"> <span class="fa 	fa fa-user-plus"></span>  Start ! its Free</button>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle fa-spin"></span>  Login</a>
			</div>
	</div>
</div>

<!-- Cards -->

<div class = "container mt-5">
	<div class ="row mb-3">
	<%
		PostDao postDao = new PostDao(ConnectionProvider.getConnection());
		List<Posts> listPost = postDao.getAllPost();
		int i =0;
		for(Posts p:listPost){
		i++;
		if(i==10){return;}
	%>
		<div class = "col-md-4 my-3">
			<div class = "card">
				<div class= "card-header primary-background">
				<h5 class = "card-title post-title"><%=p.getpTitle() %></h5>	
				</div>
				<div class = "card-body">
					<img class="card-img-top my-2" style ="height: 200px" src="post_pics/<%= p.getpPic()%>" alt="Card image cap">
					<p class = "card-text post-content"><%=p.getpContent() %></p>
				</div>	
			</div>
		</div>
	<%
		}
	%>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>



</body>
</html>