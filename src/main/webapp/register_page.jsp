<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page...</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<style>
            .banner-background{
             clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
        </style>
</head>
<body>

<%@include file="normal_navbar.jsp" %>

<main class="primary-background  banner-background"  style="padding-bottom: 80px;">

    <div class = "container">
        
        <div class="col-md-6 offset-md-3" >

        
            <div class="card">
             <div class="card-header text-center primary-background text-white">
                  <span class="fa fa-3x fa-user-circle"></span>
                   <br>
                      Register here
               </div>
                <div class="card-body">
					<form id="reg-form" action="RegisterServlet" method="POST">
					 	<div class="form-group">
                          <label for="user_name">User Name</label>
                          <input name = "user_name" type="text" class="form-control" id="user_name" aria-describedby="namehelp" placeholder="Enter Name" required>
                        </div>
                        
                        <div class="form-group">
                          <label for="user_email">Email address</label>
                          <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email" required>
                        
                        </div>
                        
                        <div class="form-group">
                          <label for="password">Password</label>
                          <input name = "user_password" type="password" class="form-control" id="password" placeholder="Password" required>
                        </div>
                 
        				 <div class="form-group">
                                    <label for="gender">Select Gender</label>
                                    <br>
                                    <input type="radio"  id="gender" name="user_gender" value="Male" required>Male
                                    <input type="radio"  id="gender" name="user_gender" value="Female" required>Female
                         </div>
                                
                         <div class="form-group">

                                    <textarea name="user_about"  class="form-control" id=""  rows="5" placeholder="Enter something about yourself"></textarea>

                        </div>
                        <div class=" form-check">
                          <input name = "checkbox" type="checkbox" class="form-check-input" id="exampleCheck1">
                          <label class="form-check-label" for="exampleCheck1">Agree Terms and Condition</label>
                        </div>
                        <br>
                        <div class="container text-center" id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>Please wait..</h4>
                                </div>
                        
                        <button id = "submit-button"type="submit" class="btn btn-primary">Submit</button>
                    </form>
               
                </div>
            </div>

        </div>

    </div>

</main>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
<!-- below is the sweet alert cdn link which need to be added in order to display the JS alert to the user as a response -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>
$(document).ready(function(){
	console.log("loaded ....")

	$('#reg-form').on('submit',function(event){
		event.preventDefault();
		let form = new FormData(this);
		$("#submit-button").hide();
		$("#loader").show();
		//send register servlet:
		$.ajax({
			url:"RegisterServlet",
			type:'POST',
			data:form,
			success:function(data,textStatus,jqXHR){
				console.log(data)
				$("#submit-button").show();
				$("#loader").hide();
				if (data.trim() === 'done')
                {
					/* swal is a JS alert which we are using to display the respone to the user For more on sweet alert visit < -- https://sweetalert.js.org/ -- >  */
                    swal("Registered successfully..We are going to redirect to login page")
                            .then((value) => {
                                window.location = "login_page.jsp"
                            });
                } else
                {
                    swal(data);
                }
				
			},
			error: function(jqXHR, textStatus, errorThrown){
				$("#submit-button").show();
				$("#loader").hide();
				swal("something went wrong..try again");
			},
			 processData: false,
             contentType: false
			
		});
	});
		
});


</script>

</body>
</html>