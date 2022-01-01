<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikedDao"%>
<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class= "container">
	<div class = "row">
	
	<% 	
		Thread.sleep(1000);
		User user = (User) session.getAttribute("currentUser");
		PostDao postDao = new PostDao(ConnectionProvider.getConnection());
		List<Posts> posts = null;
		int cid = Integer.parseInt(request.getParameter("cid"));
		if(cid==0){
			posts = postDao.getAllPost();
		}else{
			posts = postDao.getAllPostsByCatID(cid);
		}
		if(posts.size()==0){
			out.println("<h3 class = 'display-3'>No Posts in this category !!</h3>");
			return;
		}
		
		for(Posts p : posts){
	%>			<div class = "col-md-6">
					<div class = "card mt-3">
					<img class="card-img-top" src="post_pics/<%= p.getpPic()%>" alt="Card image cap">
						<div class = "card-body">
							<h5> <%=p.getpTitle() %> </h5>
							<p> <%=p.getpContent() %> </p>
							<pre><%=p.getpCode() %></pre>
						</div>
						<%
						   		LikedDao likeDao = new LikedDao(ConnectionProvider.getConnection());
				
						   %>
						<div class= "card-footer text-center">
						<a href="#" onclick="doLike(<%=p.getPid()%>,<%=user.getId()%>)" class = "btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i><span class="like-counter-<%=p.getPid()%>"> <%=likeDao.countLikeOnPost(p.getPid()) %></span></a>
							<a href="show_blog_page.jsp?pid=<%=p.getPid()%>" class = "btn btn-outline-primary"> Read More</a>
							<a href="#!" class = "btn btn-outline-primary"><i class="fa fa-commenting-o" aria-hidden="true"></i></a>
						</div>
					</div>
				</div>
	<%	
			}
	%>		
	
	</div>
</div>