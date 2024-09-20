<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="post.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cropper/4.0.0/cropper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/cropper/4.0.0/cropper.min.js"></script>



	
    <title>VibeNexa -Social Media</title>
</head>

<body>
<!-- Login session check -->
<%@ page import="javax.servlet.http.HttpSession" %>
<% 
        // Check if the user is logged in
        HttpSession session = request.getSession(false);
        String username = (session != null) ? (String) session.getAttribute("id") : null;

        if (username != null) {
    %>
        <h1>Welcome, <%= username %>!</h1>
        <p>This is the home page.</p>
    <%
        } else {
            // Redirect to the login page if not logged in
            response.sendRedirect("login.html");
        }
    %>



    <div>
        <div class="home-container">
            <div class="home-container1">
                <div class="home-container2">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="#"><img id="mylogo" src="logo/logo.png"
                                alt="RajeStyle"></a><strong>VibeNexa</strong>
                    </div>
                    <div class="container">
                        <ul>
                            <li>
                                <a class="nav-item" href="home.html"><img class="logo" src="logo/house-heart-fill.svg"
                                        alt="Home"><b>Home</b></a>
                            </li>
                            <li>
                                <a class="nav-item" href="#"><img class="logo" src="logo/search-heart-fill.svg"
                                        alt="Search"><b>Search</b></a>
                            </li>
                            <li>
                                <a class="nav-item" data-bs-toggle="modal" data-bs-target="#friendlist"><img
                                        class="logo" src="logo/friend.png" alt="Friends"><b>Friends</b></a>
                            </li>
                            <li>
                                <a class="nav-item" href="#"><img class="logo" src="logo/chat-heart-fill.svg"
                                        alt="Chat"><b>Chat</b></a>
                            </li>
                            <li>
                                <a class="nav-item" data-bs-toggle="modal" data-bs-target="#exampleModal"><img
                                        class="logo" src="logo/plus-circle-fill.svg" alt="Create"><b>Create</b></a>
                            </li>
                            <li>
                                <a class="nav-item" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button"
                                    aria-controls="offcanvasExample"><img class="logo" src="logo/gear-fill.svg"
                                        alt="Settings"><b>Settings</b></a>
                            </li>
                            <li>
                                <a class="nav-item" href="profile.html"><img class="logo" src="logo/person-circle.svg"
                                        alt="Profile"><b>Profile</b></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="home-container3">
                    <div class="story-area">
                        <div class="storypost">
                            <div class="story" style="border-radius: 50%;">
                                <img src="abc.jpg" alt="">
                            </div>
                            <b class="name">XYZ</b>
                        </div>
                    </div>
                    
                    
                    
                    
                    
                   		<%@ page import="java.util.*" %>
    <%
    List<ArrayList<String>> post = (List<ArrayList<String>>) request.getAttribute("post");

    ArrayList<String> post1 = new ArrayList<>();

    int numRows = post.size();

    // Determine the maximum number of columns dynamically
    int numCols = 0;
    for (ArrayList<String> row : post) {
        numCols = Math.max(numCols, row.size());
    }

    for (int col = 0; col < numCols; col++) {
        for (int row = 0; row < numRows; row++) {
            ArrayList<String> currentRow = post.get(row);

            // Check if the column index is within bounds for the current row
            if (col < currentRow.size()) {
                String element = currentRow.get(col);

                // Store the value in the list
                post1.add(element);
            }
        }
    }

    // Print the stored values
   
    for (int i = 0; i < post1.size(); i=i+4) {
    	if (i==post.size()-3) {
			return;
		}
    	else {
		
    	%>
    	
           
						
							<div class="post">
                        <div class="card" style="width: 27rem; margin-top: 10px;">
                            <div class="card-header">
                                <img src="<%=post1.get(i+3) %>" alt=""
                                    style="width: 50px; height: 50px; border-radius: 50%;"><b><%=post1.get(i+1) %></b>
                            </div>
                            <img src="<%= post1.get(i) %>" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">
                                    <a href="#"><img src="logo/suit-heart.svg" alt=""></a>
                                    <a href="#" style="margin-left: 15px;"><img src="logo/chat-right-heart-fill.svg"
                                            alt=""></a>
                                </h5>
                                <p class="card-text"><%=post1.get(i+2) %></p>
                            </div>
                        </div> 
                    </div>
						
					<%
    	}
	}
            
           %>
						
						
						
                    

                </div>
            </div>
        </div>
    </div>






    <!--Settings offcanvas-->
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasExampleLabel">Settings</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="container">
            <ul>
                <li><a class="nav-item" href="#">Action</a></li>
                <li><a class="nav-item" href="#">Another action</a></li>
                <li><a class="nav-item" href="#">Something else here</a></li>
            </ul>
        </div>
    </div>
    <!--Modal for new post-->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Create new Post</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="file" id="imageInput" accept="image/*" onchange="displayImage()" />
                    <img id="image" alt="Selected Image" style="display: none;width: 25rem;height: 25rem;" />

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>

    <!--Modal for friends list-->
    <div class="modal fade" id="friendlist" tabindex="-1" aria-labelledby="friendlistLabel" aria-hidden="true">
    <%@page import="java.sql.*" %>
    <%!int count; %>
    <%!Connection con; %>
    <%!Statement stmt,stmt1; %>
    <% Class.forName("com.mysql.cj.jdbc.Driver"); %>
    <%

    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vibenexa","root","");
    
    stmt=con.createStatement();
    String str="SELECT friend.*, COUNT(user.user_id) AS user_count FROM friend INNER JOIN user ON friend.user_id = user.user_id WHERE user.user_id = 1";
    
    ResultSet rs=stmt.executeQuery(str);
    while (rs.next()) {
    	count=rs.getInt("user_count");
	}
    
    
    
    
    %>
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="friendlistLabel">Friends (<%=count %>)</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col1"><img src="logo/person-circle.svg" alt=""></div>
                        <div class="col"><b>XYZ XYZ</b></div>
                    </div>
                    <div class="row">
                        <div class="col1"><img src="logo/person-circle.svg" alt=""></div>
                        <div class="col"><b>XYZ XYZ</b></div>
                    </div>
                </div>
            </div>
        </div>
    </div>








    <!-- javascript code from here-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script>
        function displayImage() {
            const input = document.getElementById('imageInput');
            const image = document.getElementById('image');
            const file = input.files[0];

            if (file) {
                const reader = new FileReader();

                reader.onload = function (e) {
                    image.src = e.target.result;
                    image.style.display = 'block'; // Display the image
                };

                reader.readAsDataURL(file);
            } else {
                image.src = '';
                image.style.display = 'none'; // Hide the image if no file is selected
            }
        }
    </script>
</body>

</html>