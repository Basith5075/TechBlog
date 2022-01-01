<%@page import="com.tech.blog.dao.LikedDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Categories"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page errorPage="error_page.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
	User user = (User) session.getAttribute("currentUser");
	String name =null ;
	String email = null ;
	if(user==null){
		response.sendRedirect("login_page.jsp");
	}
	PostDao postDao = new PostDao(ConnectionProvider.getConnection());
	ArrayList<Categories> al = postDao.getPostCategories();
%>
<%
	int pid = Integer.parseInt(request.getParameter("pid"));
	Posts p = postDao.getAllPostsByID(pid);
	if(p==null){
		out.println("No posts to display");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<style>
            .banner-background{
             clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
            .post-title{
           	text-align: center;
            font-weight:100;
            font-size: 30px;
            }
            .post-content{
            font-weight:100;
            font-size: 20px;
            }
              .post-date{
                font-style: italic;
                font-weight: bold;
            }
             .post-user-info{
                font-size: 20px;
            }
             .row-user{
                border:1px solid #e2e2e2;
                padding-top: 10px;
            }
              body{
                background:url(img/bg.jpeg);
                background-size: cover;
                background-attachment: fixed;
            }
            
        </style>
 
<meta charset="ISO-8859-1">
<title><%= p.getpTitle() %></title>
</head>
<body>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v12.0" nonce="imdUeH75"></script>
<!-- NavBar Start -->
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <div class="container-fluid ">
    <a class="navbar-brand" href="#"><span class="fa fa-asterisk"></span> Tech Blog</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="profile_page.jsp"><span class="fa fa-bell-o"></span> Basith_Tech</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <span class="	fa fa-check-square-o"></span> Categories
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Programming Language</a></li>
            <li><a class="dropdown-item" href="#">Project Implementation</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Data Structures</a></li>
          </ul>
        </li>
      <li class="nav-item">
                <a class="nav-link" href="#"> <span class="	fa fa-address-card-o"></span> Contact</a>
            </li>
     		 <li class="nav-item">
                <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#add-post-modal"> <span class="	fa fa-asterisk"></span> Do Post</a>
            </li>
         
      </ul>
        <ul class="navbar-nav mr-right">
                   	<li class="nav-item">   
                   	<a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal"> <span class="fa fa-user-circle ">
  						<%=user.getName() %>
					</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"> <span class="fa fa-user-plus"></span> Logout</a>
                   </li>
       </ul>
    </div>
  </div>
</nav>

<!-- NavBar End -->

<!-- Main content of the post is shown here -->
		<div class = "container">
			<div class = "row my-4">
				<div class = "col-md-8 offset-md-2" >
					
					<div class = "card"> 
						<div class = "card-header primary-background text-white">
							 <h4 class="post-title"><%= p.getpTitle()%></h4>
						</div>
						<div class="card-body">
						<img class="card-img-top my-2" src="post_pics/<%= p.getpPic()%>" alt="Card image cap">
						  <div class="row my-3 row-user">
						  		 <div class="col-md-8">
						  	
                    		 <% UserDao ud = new UserDao(ConnectionProvider.getConnection());%> 

                                  <p class="post-user-info"> <a href="#!"> <%= ud.getUserByID(p.getUserID()).getName() %></a> has posted : </p>
                                </div>
                                
                                <div class="col-md-4">
                                    <p class="post-date"> <%=  DateFormat.getDateTimeInstance().format(p.getpDate())%>  </p>
                                </div>
                           </div>
                                 <p class="post-content"><%= p.getpContent()%></p> 
                                    <br>
                            		<br>
                            	<div class="post-code">
                                <pre><%= p.getpCode()%></pre>
                            </div>
						   </div>
						   <%
						   		LikedDao likeDao = new LikedDao(ConnectionProvider.getConnection());
				
						   %>
						   <div class = "card-footer primary-background">
						   		<a href="#" onclick="doLike(<%=p.getPid()%>,<%=user.getId()%>)" class = "btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i><span class="like-counter-<%=p.getPid()%>"> <%=likeDao.countLikeOnPost(p.getPid()) %></span></a>
							<a href="#!" class = "btn btn-outline-light btn-sm"><i class="fa fa-commenting-o" aria-hidden="true"></i></a>
						  </div>
						  	<div class = "card-footer">
								<div class="fb-comments" data-href="http://localhost:1011/TechBlog/show_blog_page.jsp?pid=<%= p.getPid()%>" data-width="" data-numposts="5">Best test</div>
							</div>
					</div>
	
				</div>
			</div>
		</div>
<!-- End of main content of the post -->
	
<!-- Modal For post -->
<div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header primary-background">
      <div class = "container text-center">
        <h5 class="modal-title" id="exampleModalLabel">Add a New Post</h5>
        </div>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
      	<form action="AddPost" method = "POST" id = "add-post-form" enctype="multipart/form-data" >
        	 <div class = "form-group mt-1">
      			<select class = "form-control" name = "cid">
      				<option selected disabled>***Select Category***</option>
      				<%
      				// The below variable are declared in the top of the page, hence commented here just for the sake of understanding from where categories list is coming dynamically.
  /*     				PostDao postDao = new PostDao(ConnectionProvider.getConnection());
      					ArrayList<Categories> al = postDao.getPostCategories(); */
      					for(Categories cat:al){
      				%>
      						<option value = "<%=cat.getCid() %>"><%=cat.getName() %></option>
      				<%	
      				}
      				%>      				
      			</select>
      		</div>	
      		<div class = "form-group mt-1">
      			<input name = "pTitle" type = "input" class = "form-control" placeholder = "Please Enter *Title* of post"></input>
      		</div>
      		<div class = "form-group mt-1">
      			<textarea name = "pContent" style = "height:150px" class = "form-control" placeholder = "Enter the content of the post"></textarea>
      		</div>
      		<div class = "form-group mt-1">
      			<textarea name = "pCode" style = "height:150px" class = "form-control" placeholder = "Enter the Code of the post(if any...)"></textarea>
      		</div>
      		<div class = "form-group mt-1">
      			<label>Upload any post file .</label>
      			<br>
      			<input name = "pic" type = "file"class = "form-control"></input>
      		</div>
      		
      		<div class = " container text-center mt-3">
      			<button type = "submit" class = "btn text-white btn-outline-primary primary-background">Save</button>
      		</div>
      	</form>
      
      </div>
    </div>
  </div>
</div>
<!-- Modal for edit and display modal Start-->
<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
     <div  class="modal-header primary-background">
	      <div class = "container text-center">
    	  		  <h5 class="modal-title" id="exampleModalLabel"> TechBlog </h5>
            </div>
         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
     	<div class="container text-center">
     		<img class = "image-fluid" style = "border-radius:80%; max-width: 90px" src="pics/<%= user.getProfile()%>"></img>
     	</div>
     	<div class="container text-center mt-3">
     		<h5><%=user.getName() %></h3>
     	</div>
 <!-- Profile Show -->
     	<div id = "profile-details">
     		<table class="table">
				  <tbody>
				    <tr>
				      <th scope="row">ID</th>
				      <td><%=user.getId() %></td>
				    </tr>
				    <tr>
				      <th scope="row">Name</th>
				      <td><%=user.getName() %></td>
				    </tr>
				    <tr>
				      <th scope="row">Email</th>
				   	<td><%= user.getEmail() %></td>
				    </tr>
				    <tr>
				      <th scope="row">Gender</th>
				   	<td><%= user.getGender()%></td>
				    </tr>
				    <tr>
				      <th scope="row">About</th>
				   	<td><%= user.getAbout() %></td>
				    </tr>
				    <tr>
				      <th scope="row">Registered On</th>
				   	<td><%= user.getDateTime().toLocaleString()%></td>
				    </tr>
				  </tbody>
			</table>
     	</div>
 <!--profile Modal edit-->
     	<div id = "profile-edit" style = "display:none">
     		<h5 class = "text-center">Please Edit Carefully !!</h5>
     		<form method = "POST" action = "EditServlet" enctype="multipart/form-data">
     		<table class="table">
				  <tbody>
				    <tr>
				      <th scope="row">ID</th>
				      <td><%=user.getId() %></td>
				    </tr>
				    <tr>
				      <th scope="row">Email ID</th>
				      <td><input type = "email" class = "form-control" name = "user_email" value ="<%=user.getEmail()%>"/></td>
				    </tr>
				    <tr>
				      <th scope="row">Name</th>
				      <td><input type = "text" class = "form-control" name = "user_name" value ="<%=user.getName()%>"/></td>
				    </tr>
				   	<tr>
				      <th scope="row">Password</th>
				   	<td><input type = "password" class = "form-control" name = "user_password" value ="<%=user.getPassword()%>"/></td>
				    </tr>
				    <tr>
				      <th scope="row">Gender</th>
				   	<td><%= user.getGender().toUpperCase()%></td>
				    </tr>
				    <tr>
				      <th scope="row">About</th>
				   	<td><textarea row = "3" class = "form-control" name = "user_about"><%=user.getAbout()%></textarea></td>
				    </tr>
				    <tr>
				      <th scope="row">New Profile Pic</th>
				   	<td><input type = "file" name = "image" class = "form-control"/></td>
				    </tr>
				  </tbody>
			</table>
			<div class= "container text-center">
				<button type = "submit" class = "btn btn-outline-primary">Save</button>
			</div>
			</form>
     	
     	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="js/myjs.js"></script>

<script>

/* Logic for showing the edit form */
	$(document).ready(function(){
		
		let editStatus = false;
		
		$('#edit-profile-button').click(function(){
		
			if(editStatus == false){
			$('#profile-details').hide();
			$('#profile-edit').show();
			editStatus = true;
			$(this).text("Back");
			}else{
				$('#profile-details').show();
				$('#profile-edit').hide();
				editStatus = false;
				$(this).text("Edit");
				
			}
		});
		
	});

</script>
<!--   /* Logic for adding post */ -->
<script>

	$(document).ready(function(e){
		
		$('#add-post-form').on("submit", function (event){
			// this code gets called when form is submitted....
			event.preventDefault();
			console.log("you have clicked on submit..");
			let form = new FormData(this);
			
			//now requesting to server
			
			$.ajax({
				url:"AddPostServlet",
				type: 'POST',
				data:form,
				success: function (data, textStatus, jqXHR){
					console.log(data);
					if(data.trim() == 'done'){
						swal("Congratulations !!", "Your post is submitted successfully!!", "success");
					}else{
						swal("Alas !!", "Something went wrong !!", "error");	
					}
				},
				error:function (jqXHR, textStatus, errorThrown){
					swal("Alas !!", "Something went wrong !!", "error");					
				},
				processData:false,
				contentType:false
			});
		});
		
	});
</script>
</body>

</html>