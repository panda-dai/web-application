<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Gallery</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="css/styles.css" rel="stylesheet">

            <script language="JavaScript" type="text/javascript">
                <!--
                function createAndSubmitForm ( id, inputName, value )
                {
                    var form = document.createElement("form");
                    form.setAttribute("method", "post");
                    if(id.length != 0) {
                        form.setAttribute("id", id);
                    }
                    var hiddenField = document.createElement("input");
                    hiddenField.setAttribute("name", inputName);
                    hiddenField.setAttribute("value", value );
                    hiddenField.setAttribute("type", "hidden");
                    form.appendChild(hiddenField);
                    document.body.appendChild(form);
                    form.submit();
                }
                -->
              </script>
	</head>
	<body style="background-image:url(img/light-grey-damask-pattern.jpg);">

          <%
              String funcID = request.getParameter("funcID");
              String name = request.getParameter("name");
              String description = request.getParameter("description");
              String id = request.getParameter("id");
              String birth_year = request.getParameter("birth_year");
              String country = request.getParameter("country");
              String title = request.getParameter("title");
              String gallery_id = request.getParameter("gallery_id");
              String artist_id = request.getParameter("artist_id");
              String year = request.getParameter("year");
              String type = request.getParameter("type");
              String width = request.getParameter("width");
              String height = request.getParameter("height");
              String location = request.getParameter("location");
              String link = request.getParameter("link");
              String image_id = request.getParameter("image_id");
              String year_start = request.getParameter("year_start");
              String year_end = request.getParameter("year_end");
            %>
            <%
              try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
              }
              catch(Exception e)
              {
                out.println("can't load mysql driver");
                out.println(e.toString());
              }
            %>

          <div class="navbar-wrapper">
            <div class="container">
              <div class="navbar navbar-inverse navbar-static-top">

                  <div class="navbar-header">
          	    <a class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          	      <span class="icon-bar"></span>
          	      <span class="icon-bar"></span>
          	      <span class="icon-bar"></span>
          	    </a>
                  <a class="navbar-brand" href="#">Gallery</a>
                  </div>
                  <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                      <li><a href="#" onclick="createAndSubmitForm('', 'funcID', '0')">Home</a></li>
                      <li><a href="#" onclick="createAndSubmitForm('', 'funcID', '1')">View Gallery</a></li>
                      <li class="dropdown">
                          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Add Item <b class="caret"></b></a>
                          <ul class="dropdown-menu">
                            <li><a href="#"  onclick="createAndSubmitForm('', 'funcID', '2')">Create new gallery</a></li>
                            <li><a href="#" onclick="createAndSubmitForm('','funcID', '3')">Add new artist</a></li>
                            <li><a href="#" onclick="createAndSubmitForm('', 'funcID', '4')">Add new artwork</a></li>
                          </ul>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Search <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#"  onclick="createAndSubmitForm('', 'funcID', '15')">Find image</a></li>
                            <li><a href="#" onclick="createAndSubmitForm('','funcID', '16')">Find artist</a></li>
                        </ul>
                      </li>
                    </ul>
                  </div>

              </div>
            </div><!-- /container -->
          </div><!-- /navbar wrapper -->


<!-- Carousel
================================================== -->
<div id="myCarousel" class="carousel slide">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="item active">
      <img src="http://cdn.wonderfulengineering.com/wp-content/uploads/2014/05/twitter-header-photo-20.jpg" class="img-responsive">
      <div class="container">
        <div class="carousel-caption">
          <h1>Gallery</h1>
          <p><br></p>
          <p><br></p>
        </div>
      </div>
    </div>
    <div class="item">
      <img src="http://wallpaperdownload.info/download/6739/2015/01/abstract_wallpaper_free_wallpaper_images_for_desktop_12-1500x500.jpg/" class="img-responsive">
      <div class="container">
        <div class="carousel-caption">
          <h1>Welcome!</h1>
          <p><br></p>
          <p><br></p>
        </div>
      </div>
    </div>
    <div class="item">
      <img src="http://www.surftin.com/images/seasons-summer-delta_182740.jpg" class="img-responsive">
      <div class="container">
        <div class="carousel-caption">
          <h1>Have fun!</h1>
          <p><br></p>
          <p><br></p>
        </div>
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
</div>
<!-- /.carousel -->


<!-- Marketing messaging and featurettes
================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->

<div class="container marketing" >

  <!-- START THE FEATURETTES -->
    <p class="lead">
        <%
            String hiddenForm = "<form method=\"post\" id=\"%s%d\">\n<input name=\"funcID\" type=\"hidden\" value=\"%d\"/>\n<input name=\"%s\" type=\"hidden\" value=\"%d\"/>\n%s<a href=\"javascript:{}\" onclick=\"document.getElementById(\'%s%d\').submit(); return false;\">%s</a>\n</form>";
            if(funcID!=null) {
            try {
              String url="jdbc:mysql://127.0.0.1:3306/gallery";
              String user="gallery";
              String pwd="eecs221";
              Connection con= DriverManager.getConnection(url,user,pwd);

              int func=Integer.valueOf(funcID);
              Statement stmt;
              PreparedStatement pstmt;
              ResultSet rs;
              switch(func) {
                case 0:
                    out.println("<div class=\"col-sm-10 col-sm-offset-1\">");
                    out.println("<div class=\"page-header text-center\"><h1>Welcome to the gallery!</h1></div>");
                    out.println("</div>");
                    break;
                case 1:
                // show gallery list
                  stmt = con.createStatement(); // Statements allow to issue SQL queries to the database
                  String sql="SELECT * FROM gallery";
                  rs=stmt.executeQuery(sql); // Result set get the result of the SQL query
                  out.println("<div class=\"container\">");
                  out.println("<div class=\"col-sm-8 col-sm-offset-2 text-center\">");
                  out.println("<h1>Gallery List</h1>");
                  out.println("</div><br>");

                  out.println("<table class=\"table table-condensed\">");
                  //out.println("<caption> Gallery List </caption>");
                  out.println("<thead>");
                  out.println("<tr>");
                  out.println("<th>ID</th>");
                  out.println("<th>Name</th>");
                  out.println("<th>Description</th>");
                  out.println("<th>Modify Info?</th>");
                  out.println("</tr>");
                  out.println("</thead>");
                  out.println("<tbody>");
                  while (rs.next()) {
                    out.println("<tr>");
                    int gid = rs.getInt("gallery_id");
                    out.println("<td>"+String.format(hiddenForm, "gallery", gid, 5, "id", gid, "","gallery", gid, gid) +"</td>");
                    out.println(String.format("<form method=\"post\" id=\"%s\">", "modify"+String.valueOf(gid)));
                    out.println("<td>"+String.format("<input type=\"text\" name=\"name\" value=\"%s\">", rs.getString("name"))+"</td>");
                    out.println("<td>"+String.format("<input type=\"text\" name=\"description\" value=\"%s\">", rs.getString("description"))+"</td>");
                    out.println("<input type=\"hidden\" name=\"funcID\" value=\"12\">");
                    out.println(String.format("<input type=\"hidden\" name=\"gallery_id\" value=\"%d\">", gid));
                    out.println("<td>"+String.format("<a href=\"javascript:{}\" onclick=\"document.getElementById(\'%s%d\').submit(); return false;\">modify</a></form>", "modify", gid)+"</td>");
                    out.println("</tr>");
                  }
                  rs.close();
                  stmt.close();
                  out.println("</tbody>");
                  out.println("</table>");
                  out.println("</div>");
                  break;
                case 2:
                  // add gallery
                  out.println("<p class=\"lead text-center\">");
                  out.println("Create a new gallery");
                  out.println("</p>");

                  out.println("<div class=\"col-sm-offset-2\">");
                  out.println("<div class=\"col-sm-8\">");
                  out.println("<form method=\"post\" class=\"form-horizontal\" role=\"form\">");

                  out.println("<div class=\"row form-group\">");
                  out.println("<input type=\"hidden\" name=\"funcID\" value=\"6\">");
                  out.println("<label class=\"control-label col-sm-2\" for=\"name\">Name:</label>");
                  out.println("<div class=\"col-sm-10\">");
                  out.println("<input type=\"text\" class=\"form-control\" id=\"name\" name=\"name\" placeholder=\"Name\" required=\"\">");
                  out.println("</div>");
                  out.println("</div>");
                  out.println("<div class=\"row form-group\">");
                  out.println("<label class=\"control-label col-sm-2\" for=\"name\">Description:</label>");
                  out.println("<div class=\"col-sm-10\">");
                  out.println("<input type=\"text\" class=\"form-control\" id=\"description\" name=\"description\" placeholder=\"Description\" required=\"\">");
                  out.println("</div>");
                  out.println("</div>");

                  out.println("<div class=\"form-group\">");
                  out.println("<div class=\"col-sm-offset-2 col-sm-10\">");
                  out.println("<button type=\"submit\" class=\"btn btn-default\">Add</button>");
                  out.println("</div>");
                  out.println("</div>");

                  out.println("</form>");
                  out.println( "</div>");
                  out.println( "</div>");
                  break;
                case 3:
                // add artist
                  out.println("<p class=\"lead text-center\">");
                  out.println("Add a new artist");
                  out.println("</p>");

                  out.println("<div class=\"col-sm-offset-2\">");
                  out.println("<div class=\"col-sm-8\">");
                  out.println("<form method=\"post\" class=\"form-horizontal\" role=\"form\">");

                  out.println("<div class=\"row form-group\">");
                  out.println("<input type=\"hidden\" name=\"funcID\" value=\"7\">");
                  out.println("<label class=\"control-label col-sm-2\" for=\"name\">Name:</label>");
                  out.println("<div class=\"col-sm-4\">");
                  out.println("<input type=\"text\" class=\"form-control\" id=\"name\" name=\"name\" placeholder=\"Name\" required=\"\">");
                  out.println("</div>");
                  out.println("<label class=\"control-label col-sm-2\" for=\"country\">Country:</label>");
                  out.println("<div class=\"col-sm-4\">");
                  out.println("<input type=\"text\" class=\"form-control\" id=\"country\" name=\"country\" placeholder=\"Country\" required=\"\">");
                  out.println("</div>");
                  out.println("</div>");

                  out.println("<div class=\"row form-group\">");
                  out.println("<label class=\"control-label col-sm-2\" for=\"birth_year\">Birth Year:</label>");
                  out.println("<div class=\"col-sm-2\">");
                  out.println("<input type=\"text\" class=\"form-control\" id=\"birth_year\" name=\"birth_year\" placeholder=\"Year\" required=\"\">");
                  out.println("</div>");
                  out.println("<label class=\"control-label col-sm-2\" for=\"name\">Description:</label>");
                  out.println("<div class=\"col-sm-6\">");
                  out.println("<input type=\"text\" class=\"form-control\" id=\"description\" name=\"description\" placeholder=\"Description\" required=\"\">");
                  out.println("</div>");
                  out.println("</div>");

                  out.println("<div class=\"form-group\">");
                  out.println("<div class=\"col-sm-offset-2 col-sm-10\">");
                  out.println("<button type=\"submit\" class=\"btn btn-default\">Add</button>");
                  out.println("</div>");
                  out.println("</div>");

                  out.println("</form>");
                  out.println( "</div>");
                  out.println( "</div>");
                  break;
                case 4:
                  // add image
                  out.println("<p class=\"lead text-center\">");
                  out.println("Add a new image");
                  out.println("</p>");

                  out.println("<div class=\"col-sm-offset-1\">");
                  out.println("<div class=\"col-sm-10\">");
                  out.println("<form method=\"post\" class=\"form-horizontal\" role=\"form\">");

                  out.println("<div class=\"row form-group\">");
                  out.println("<input type=\"hidden\" name=\"funcID\" value=\"8\">");
                  out.println("<label class=\"control-label col-sm-2\" for=\"title\">Title:</label>");
                  out.println("<div class=\"col-sm-3\">");
                  out.println("<input type=\"text\" class=\"form-control\" id=\"title\" name=\"title\" placeholder=\"Title\" required=\"\">");
                  out.println("</div>");
                  out.println("<label class=\"control-label col-sm-2\" for=\"link\">Link:</label>");
                  out.println("<div class=\"col-sm-5\">");
                  out.println("<input type=\"text\" class=\"form-control\" id=\"link\" name=\"link\" placeholder=\"Link\" required=\"\">");
                  out.println("</div>");
                  out.println("</div>");

                  out.println("<div class=\"row form-group\">");
                  out.println("<label class=\"control-label col-sm-2\" for=\"gallery_id\">Gallery:</label>");
                  out.println("<div class=\"col-sm-3\">");
                  out.println("<select class=\"form-control\" id=\"gallery_id\" name=\"gallery_id\">");
                  pstmt = con.prepareStatement("select gallery_id, name from gallery");
                  rs = pstmt.executeQuery();
                  while(rs.next()) {
                      out.println(String.format("<option value=\"%s\">%s</option>", rs.getString("gallery_id"), rs.getString("name")));
                  }
                  rs.close();
                  pstmt.close();
                  out.println("</select>");
                  out.println("</div>");
                  out.println("<label class=\"control-label col-sm-1\" for=\"artist_id\">Artist:</label>");
                  out.println("<div class=\"col-sm-3\">");
                  out.println("<select class=\"form-control\" id=\"artist_id\" name=\"artist_id\">");
                  pstmt = con.prepareStatement("select artist_id, name from artist");
                  rs = pstmt.executeQuery();
                  while(rs.next()) {
                      out.println(String.format("<option value=\"%s\">%s</option>", rs.getString("artist_id"), rs.getString("name")));
                  }
                  rs.close();
                  pstmt.close();
                  out.println("</select>");
                  out.println("</div>");
                  out.println("<label class=\"control-label col-sm-1\" for=\"year\">Year:</label>");
                  out.println("<div class=\"col-sm-2\">");
                  out.println("<input type=\"text\" class=\"form-control\" id=\"year\" name=\"year\" placeholder=\"Year\" required=\"\">");
                  out.println("</div>");
                  out.println("</div>");

                  out.println("<div class=\"row form-group\">");
                  out.println("<label class=\"control-label col-sm-2\" for=\"type\">Type:</label>");
                  out.println("<div class=\"col-sm-4\">");
                  out.println("<input type=\"text\" class=\"form-control\" id=\"type\" name=\"type\" placeholder=\"Type\" required=\"\">");
                  out.println("</div>");
                  out.println("<label class=\"control-label col-sm-1\" for=\"width\">Width:</label>");
                  out.println("<div class=\"col-sm-2\">");
                  out.println("<input type=\"text\" class=\"form-control\" id=\"width\" name=\"width\" placeholder=\"Width\" required=\"\">");
                  out.println("</div>");
                  out.println("<label class=\"control-label col-sm-1\" for=\"height\">Height:</label>");
                  out.println("<div class=\"col-sm-2\">");
                  out.println("<input type=\"text\" class=\"form-control\" id=\"height\" name=\"height\" placeholder=\"Height\" required=\"\">");
                  out.println("</div>");
                  out.println("</div>");

                  out.println("<div class=\"row form-group\">");
                  out.println("<label class=\"control-label col-sm-2\" for=\"location\">Location:</label>");
                  out.println("<div class=\"col-sm-2\">");
                  out.println("<input type=\"text\" class=\"form-control\" id=\"location\" name=\"location\" placeholder=\"Location\" required=\"\">");
                  out.println("</div>");
                  out.println("<label class=\"control-label col-sm-2\" for=\"description\">Description:</label>");
                  out.println("<div class=\"col-sm-6\">");
                  out.println("<input type=\"text\" class=\"form-control\" id=\"description\" name=\"description\" placeholder=\"Description\" required=\"\">");
                  out.println("</div>");
                  out.println("</div>");

                  out.println("<div class=\"form-group\">");
                  out.println("<div class=\"col-sm-offset-2 col-sm-10\">");
                  out.println("<button type=\"submit\" class=\"btn btn-default\">Add</button>");
                  out.println("</div>");
                  out.println("</div>");

                  out.println("</form>");
                  out.println( "</div>");
                  out.println( "</div>");
                  break;
                case 5:
                  // show images in each gallery
                  pstmt = con.prepareStatement("select title, link, image_id from gallery natural join image where gallery_id = ?");
                  pstmt.clearParameters();
                  // Parameters start with 1

                  pstmt.setString(1, id);
                  rs = pstmt.executeQuery();
                  int count = 0;

                  out.println("<p class=\"lead text-center\">");
                  out.println(String.format("Gallery %s", id));
                  out.println("</p>");

                  out.println("<div class=\"container\">");
                  out.println("<table class=\"table table-condensed\">");
                  out.println("<thead>");
                  out.println("<tr>");
                  out.println("<th>Title</th>");
                  out.println("<th>Preview</th>");
                  out.println("<th>Modify details?</th>");
                  out.println("<th>Delete?</th>");
                  out.println("</tr>");
                  out.println("</thead>");
                  out.println("<tbody>");
                  while(rs.next()) {
                    out.println("<tr>");
                    out.println("<td>"+rs.getString("title")+"</td>");
                    out.println("<td>"+String.format("<img src=\"%s\" height=\"%d\" width=\"%d\">", rs.getString("link"), 100, 100)+"</td>");
                    out.println("<td>"+String.format(hiddenForm, "detail", rs.getInt("image_id"), 9, "image_id", rs.getInt("image_id"), String.format("<input type=\"hidden\" class=\"form-control\" id=\"gallery_id\" name=\"gallery_id\" value=\"%s\">", id),"detail", rs.getInt("image_id"), "see more details")+"</td>");
                    out.println("<td>"+String.format(hiddenForm, "delete", rs.getInt("image_id"), 11, "image_id", rs.getInt("image_id"), "","delete", rs.getInt("image_id"), "delete")+"</td>");
                    out.println("</tr>");
                    count++;
                  }
                  out.println("</tbody>");
                  out.println("</table>");
                  out.println("</div>");
                  out.println(String.format("%d images in gallery %s", count, id));
                  out.println(String.format(hiddenForm, "back", 0, 1, "no", 0, "","back", 0, "Back to gallery"));
                  rs.close();
                  pstmt.close();
                  break;
                case 6:
                  // add gallery
                  // PreparedStatements can use variables and are more efficient
                  pstmt = con.prepareStatement("insert into gallery values (default,?,?)",Statement.RETURN_GENERATED_KEYS);
                  // Use ? to represent the variables
                  pstmt.clearParameters();
                  // Parameters start with 1
                  pstmt.setString(1, name);
                  pstmt.setString(2, description);
                  pstmt.executeUpdate();
                  rs=pstmt.getGeneratedKeys();
                  while (rs.next()) {
                    out.println("Successfully added. Gallery_ID:"+rs.getInt(1));
                  }
                  rs.close();
                  pstmt.close();
                  break;
                case 7:
                  // add artist
                  // PreparedStatements can use variables and are more efficient
                  pstmt = con.prepareStatement("insert into artist values (default,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
                  // Use ? to represent the variables
                  pstmt.clearParameters();
                  // Parameters start with 1
                  pstmt.setString(1, name);
                  pstmt.setString(2, birth_year);
                  pstmt.setString(3, country);
                  pstmt.setString(4, description);
                  pstmt.executeUpdate();
                  rs=pstmt.getGeneratedKeys();
                  while (rs.next()) {
                    out.println("Successfully added. Artist_ID:"+rs.getInt(1));
                  }
                  rs.close();
                  pstmt.close();
                  break;
                case 8:
                  // add image
                  // PreparedStatements can use variables and are more efficient
                  pstmt = con.prepareStatement("insert into image values (default,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
                  // Use ? to represent the variables
                  pstmt.clearParameters();
                  // Parameters start with 1
                  pstmt.setString(1, title);
                  pstmt.setString(2, link);
                  pstmt.setString(3, gallery_id);
                  pstmt.setString(4, artist_id);
                  pstmt.setString(5, null);
                  pstmt.executeUpdate();
                  rs=pstmt.getGeneratedKeys();
                  int i_id = 0;
                  while (rs.next()) {
                    out.println("Successfully added. Image_ID:"+rs.getInt(1));
                    i_id = rs.getInt(1);
                  }
                  rs.close();
                  pstmt.close();

                  pstmt = con.prepareStatement("insert into detail values (default,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
                  // Use ? to represent the variables
                  pstmt.clearParameters();
                  // Parameters start with 1
                  pstmt.setString(1, String.valueOf(i_id));
                  pstmt.setString(2, year);
                  pstmt.setString(3, type);
                  pstmt.setString(4, width);
                  pstmt.setString(5, height);
                  pstmt.setString(6, location);
                  pstmt.setString(7, description);
                  pstmt.executeUpdate();
                  rs=pstmt.getGeneratedKeys();
                  int d_id = 0;
                  while (rs.next()) {
                    out.println("Successfully added. Detail_ID:"+rs.getInt(1));
                    d_id = rs.getInt(1);
                  }
                  rs.close();
                  pstmt.close();

                  pstmt = con.prepareStatement("update image set detail_id=? where image_id = ?");
                  // Use ? to represent the variables
                  pstmt.clearParameters();
                  // Parameters start with 1
                  pstmt.setString(1, String.valueOf(d_id));
                  pstmt.setString(2, String.valueOf(i_id));
                  pstmt.executeUpdate();
                  rs.close();
                  pstmt.close();
                  break;
                case 9:
                  //show detail
                  pstmt = con.prepareStatement("select  title, year, type, width, height, location, detail.description, link, gallery_id, artist.name, artist.artist_id, image.image_id from image join detail on image.image_id=detail.image_id join artist on image.artist_id=artist.artist_id where detail.image_id=?");
                  pstmt.clearParameters();
                  // Parameters start with 1
                  pstmt.setString(1, image_id);
                  rs = pstmt.executeQuery();
                  //int gid = 0;
                  rs.next();
                  //gid = rs.getInt("gallery_id");
                  out.println("<p class=\"lead text-center\">");
                  out.println("Modify image info<br>");
                  out.println(String.format("<img src=\"%s\" height=\"%d\" width=\"%d\">", rs.getString("link"), 400, 400));
                  out.println("</p>");


                  out.println("<div class=\"col-sm-offset-1\">");
                  out.println("<div class=\"col-sm-10\">");

                  out.println("<div class=\"col-sm-offset-6 col-sm-6\">"+ "<label class=\"control-label col-sm-2\">Artist:</label>"+String.format(hiddenForm, "artist", rs.getInt("artist.artist_id"), 10, "artist_id",rs.getInt("artist.artist_id"), String.format("<input name=\"image_id\" value=\'%d\' type=\"hidden\">", rs.getInt("image.image_id"))+String.format("<input name=\"gallery_id\" value=\'%s\' type=\"hidden\">", gallery_id),"artist", rs.getInt("artist.artist_id"), rs.getString("artist.name"))+"</div>");
                  out.println("<form method=\"post\" class=\"form-horizontal\" role=\"form\">");

                  out.println("<div class=\"row form-group\">");
                  out.println("<input type=\"hidden\" name=\"funcID\" value=\"13\">");
                  out.println("<label class=\"control-label col-sm-2\" for=\"title\">Title:</label>");
                  out.println("<div class=\"col-sm-3\">");
                  out.println(String.format("<input type=\"text\" class=\"form-control\" id=\"title\" name=\"title\" value=\"%s\">", rs.getString("title")));
                  out.println("</div>");
                  out.println("<label class=\"control-label col-sm-2\" for=\"link\">Link:</label>");
                  out.println("<div class=\"col-sm-5\">");
                  out.println(String.format("<input type=\"text\" class=\"form-control\" id=\"link\" name=\"link\" value=\"%s\">", rs.getString("link")));
                  out.println("</div>");
                  out.println("</div>");

                  out.println("<div class=\"row form-group\">");
                  out.println("<label class=\"control-label col-sm-2\" for=\"year\">Year:</label>");
                  out.println("<div class=\"col-sm-2\">");
                  out.println(String.format("<input type=\"text\" class=\"form-control\" id=\"year\" name=\"year\" value=\"%s\">", rs.getString("year")));
                  out.println("</div>");
                  out.println("<label class=\"control-label col-sm-2\" for=\"type\">Type:</label>");
                  out.println("<div class=\"col-sm-2\">");
                  out.println(String.format("<input type=\"text\" class=\"form-control\" id=\"type\" name=\"type\" value=\"%s\">", rs.getString("type")));
                  out.println("</div>");
                  out.println("<label class=\"control-label col-sm-2\" for=\"location\">Location:</label>");
                  out.println("<div class=\"col-sm-2\">");
                  out.println(String.format("<input type=\"text\" class=\"form-control\" id=\"location\" name=\"location\" value=\"%s\">", rs.getString("location")));
                  out.println("</div>");
                  out.println("</div>");

                  out.println("<div class=\"row form-group\">");
                  out.println("<label class=\"control-label col-sm-2\" for=\"width\">Width:</label>");
                  out.println("<div class=\"col-sm-4\">");
                  out.println(String.format("<input type=\"text\" class=\"form-control\" id=\"width\" name=\"width\" value=\"%s\">", rs.getString("width")));
                  out.println("</div>");
                  out.println("<label class=\"control-label col-sm-2\" for=\"height\">Height:</label>");
                  out.println("<div class=\"col-sm-4\">");
                  out.println(String.format("<input type=\"text\" class=\"form-control\" id=\"height\" name=\"height\" value=\"%s\">", rs.getString("height")));
                  out.println("</div>");
                  out.println("</div>");

                  out.println("<div class=\"row form-group\">");
                  out.println("<label class=\"control-label col-sm-2\" for=\"description\">Description:</label>");
                  out.println("<div class=\"col-sm-10\">");
                  out.println(String.format("<input type=\"text\" class=\"form-control\" id=\"description\" name=\"description\" value=\"%s\">", rs.getString("detail.description")));
                  out.println("</div>");
                  out.println(String.format("<input type=\"hidden\" class=\"form-control\" id=\"image_id\" name=\"image_id\" value=\"%s\">", rs.getString("image.image_id")));
                  out.println(String.format("<input type=\"hidden\" class=\"form-control\" id=\"gallery_id\" name=\"gallery_id\" value=\"%s\">", gallery_id));
                  out.println("</div>");

                  out.println("<div class=\"form-group\">");
                  out.println("<div class=\"col-sm-offset-2 col-sm-10\">");
                  out.println("<button type=\"submit\" class=\"btn btn-default\">Modify</button>");
                  out.println("</div>");
                  out.println("</div>");

                  out.println("</form>");
                  if(gallery_id != null && !gallery_id.equals("null")) {
                    out.println("<div class=\"col-sm-offset-2 col-sm-10\">"+String.format(hiddenForm, "back", 0, 5, "id", Integer.parseInt(gallery_id), "","back", 0, "Back to gallery")+"</div>");
                  } else {
                    out.println("<div class=\"col-sm-offset-2 col-sm-10\">"+String.format(hiddenForm, "back", 0, 15, "no", 0, "","back", 0, "Search Again")+"</div>");
                  }
                  out.println( "</div>");
                  out.println( "</div>");
                  rs.close();
                  pstmt.close();
                  break;
                case 10:
                  // show artist detail
                  pstmt = con.prepareStatement("select  * from artist where artist_id=?");
                  pstmt.clearParameters();
                  // Parameters start with 1
                  pstmt.setString(1, artist_id);
                  rs = pstmt.executeQuery();
                  rs.next();
                  out.println("<p class=\"lead text-center\">");
                  out.println("Modify artist info");
                  out.println("</p>");

                  out.println("<div class=\"col-sm-offset-2\">");
                  out.println("<div class=\"col-sm-8\">");
                  out.println("<form method=\"post\" class=\"form-horizontal\" role=\"form\">");

                  out.println("<div class=\"row form-group\">");
                  out.println("<input type=\"hidden\" name=\"funcID\" value=\"14\">");
                  out.println("<label class=\"control-label col-sm-2\" for=\"name\">Name:</label>");
                  out.println("<div class=\"col-sm-4\">");
                  out.println(String.format("<input type=\"text\" class=\"form-control\" id=\"name\" name=\"name\" value=\"%s\">", rs.getString("name")));
                  out.println("</div>");
                  out.println("<label class=\"control-label col-sm-2\" for=\"country\">Country:</label>");
                  out.println("<div class=\"col-sm-4\">");
                  out.println(String.format("<input type=\"text\" class=\"form-control\" id=\"country\" name=\"country\" value=\"%s\">", rs.getString("country")));
                  out.println("</div>");
                  out.println("</div>");

                  out.println("<div class=\"row form-group\">");
                  out.println("<label class=\"control-label col-sm-2\" for=\"birth_year\">Birth Year:</label>");
                  out.println("<div class=\"col-sm-2\">");
                  out.println(String.format("<input type=\"text\" class=\"form-control\" id=\"birth_year\" name=\"birth_year\" value=\"%s\">", rs.getString("birth_year")));
                  out.println("</div>");
                  out.println("<label class=\"control-label col-sm-2\" for=\"name\">Description:</label>");
                  out.println("<div class=\"col-sm-6\">");
                  out.println(String.format("<input type=\"text\" class=\"form-control\" id=\"description\" name=\"description\" value=\"%s\">", rs.getString("description")));
                  out.println("</div>");
                  out.println(String.format("<input type=\"hidden\" class=\"form-control\" id=\"artist_id\" name=\"artist_id\" value=\"%s\">", rs.getString("artist_id")));
                  out.println(String.format("<input type=\"hidden\" class=\"form-control\" id=\"image_id\" name=\"image_id\" value=\"%s\">", image_id));
                  out.println(String.format("<input type=\"hidden\" class=\"form-control\" id=\"gallery_id\" name=\"gallery_id\" value=\"%s\">", gallery_id));
                  out.println("</div>");

                  out.println("<div class=\"form-group\">");
                  out.println("<div class=\"col-sm-offset-2 col-sm-10\">");
                  out.println("<button type=\"submit\" class=\"btn btn-default\">Modify</button>");
                  out.println("</div>");
                  out.println("</div>");

                  out.println("</form>");
                  out.println(String.format(hiddenForm, "back", 0, 9, "image_id", Integer.parseInt(image_id), gallery_id != null ?String.format("<input name=\"gallery_id\" value=\'%s\' type=\"hidden\">", gallery_id) : "","back", 0, "Back to details"));
                  out.println( "</div>");
                  out.println( "</div>");

                  /*out.println("<div class=\"container\">");
                  out.println("<table class=\"table table-hover table-condensed\">");
                  out.println("<thead>");
                  out.println("<tr>");
                  out.println("<th>Name</th>");
                  out.println("<th>Birth Year</th>");
                  out.println("<th>Country</th>");
                  out.println("<th>Description</th>");
                  out.println("</tr>");
                  out.println("</thead>");
                  out.println("<tbody>");
                  while(rs.next()) {
                    out.println("<tr>");
                    out.println("<td>"+rs.getString("name")+"</td>");
                    out.println("<td>"+rs.getString("birth_year")+"</td>");
                    out.println("<td>"+rs.getString("country")+"</td>");
                    out.println("<td>"+rs.getString("description")+"</td>");
                    out.println("</tr>");
                  }
                  out.println("</tbody>");
                  out.println("</table>");
                  out.println("</div>");*/
                  rs.close();
                  pstmt.close();
                  break;
                case 11:
                  // delete artwork
                  pstmt = con.prepareStatement("select  detail_id, gallery_id from image where image_id=?");
                  pstmt.clearParameters();
                  pstmt.setString(1, image_id);
                  rs = pstmt.executeQuery();
                  rs.next();
                  String did = rs.getString("detail_id");
                  int gId = rs.getInt("gallery_id");
                  rs.close();
                  pstmt.close();

                  pstmt = con.prepareStatement("delete  from detail where detail_id=?");
                  pstmt.clearParameters();
                  pstmt.setString(1, did);
                  pstmt.executeUpdate();
                  rs.close();
                  pstmt.close();

                  pstmt = con.prepareStatement("delete  from image where image_id=?");
                  pstmt.clearParameters();
                  pstmt.setString(1, image_id);
                  pstmt.executeUpdate();
                  rs.close();
                  pstmt.close();
                  out.println("Delete Successful!");
                  out.println(String.format(hiddenForm, "back", 0, 5, "id", gId, "","back", 0, "Back to gallery"));
                  break;
                case 12:
                  // modify gallery
                  pstmt = con.prepareStatement("update gallery set name=?, description=? where gallery_id=?");
                  pstmt.clearParameters();
                  pstmt.setString(1, name);
                  pstmt.setString(2, description);
                  pstmt.setString(3, gallery_id);
                  pstmt.executeUpdate();
                  pstmt.close();
                  out.println("Modification Successful!");
                  out.println(String.format(hiddenForm, "back", 0, 1, "no", 0, "","back", 0, "Back to gallery"));
                  break;
                case 13:
                  // modify artwork
                  pstmt = con.prepareStatement("update detail set year=?, type=?, width=?, height=?, location=?, description=? where image_id=?");
                  pstmt.clearParameters();
                  pstmt.setString(1, year);
                  pstmt.setString(2, type);
                  pstmt.setString(3, width);
                  pstmt.setString(4, height);
                  pstmt.setString(5, location);
                  pstmt.setString(6, description);
                  pstmt.setString(7, image_id);
                  pstmt.executeUpdate();
                  pstmt.close();

                  pstmt = con.prepareStatement("update image set title=?, link=? where image_id=?");
                  pstmt.clearParameters();
                  pstmt.setString(1, title);
                  pstmt.setString(2, link);
                  pstmt.setString(3, image_id);
                  pstmt.executeUpdate();
                  pstmt.close();

                  out.println("Modification Successful!");
                  out.println(String.format(hiddenForm, "back", 0, 9, "image_id", Integer.parseInt(image_id), String.format("<input type=\"hidden\" id=\"gallery_id\" name=\"gallery_id\" value=\"%s\">", gallery_id),"back", 0, "Back to detail"));
                  break;
                case 14:
                  // modify artist
                  pstmt = con.prepareStatement("update artist set name=?, birth_year=?, country=?, description=? where artist_id=?");
                  pstmt.clearParameters();
                  pstmt.setString(1, name);
                  pstmt.setString(2, birth_year);
                  pstmt.setString(3, country);
                  pstmt.setString(4, description);
                  pstmt.setString(5, artist_id);
                  pstmt.executeUpdate();
                  pstmt.close();
                  out.println("Modification Successful!");
                  if(image_id != null) {
                    out.println(String.format(hiddenForm, "back", 0, 9, "image_id", Integer.parseInt(image_id), String.format("<input type=\"hidden\" id=\"gallery_id\" name=\"gallery_id\" value=\"%s\">", gallery_id),"back", 0, "Back to detail"));
                  } else {
                    out.println(String.format(hiddenForm, "back", 0, 16, "no", 0, "","back", 0, "Search Again"));
                  }
                  break;
                case 15:
                  // find image
                  out.println("<p class=\"lead text-center\">");
                  out.println("Find image");
                  out.println("</p>");


                  out.println("<div class=\"col-sm-offset-1\">");
                  out.println("<div class=\"col-sm-10\">");

                  out.println("<form method=\"post\" class=\"form-horizontal\" role=\"form\">");
                  out.println("<div class=\"row form-group\">");
                  out.println("<input type=\"hidden\" name=\"funcID\" value=\"17\">");
                  out.println("<label class=\"control-label col-sm-2\" for=\"name\">Artist Name:</label>");
                  out.println("<div class=\"col-sm-4\">");
                  out.println("<input type=\"text\" class=\"form-control\" id=\"name\" name=\"name\" placeholder=\"Artist Name\">");
                  out.println("</div>");
                  out.println("<label class=\"control-label col-sm-2\" for=\"type\">Type:</label>");
                  out.println("<div class=\"col-sm-4\">");
                  out.println("<input type=\"text\" class=\"form-control\" id=\"type\" name=\"type\" placeholder=\"Type\">");
                  out.println("</div>");
                  out.println("</div>");

                  out.println("<div class=\"row form-group\">");
                  out.println("<label class=\"control-label col-sm-2\" for=\"year_start\">Creation Year Start:</label>");
                  out.println("<div class=\"col-sm-2\">");
                  out.println("<input type=\"text\" class=\"form-control\" id=\"year_start\" name=\"year_start\" placeholder=\"Creation Year Start\">");
                  out.println("</div>");
                  out.println("<label class=\"control-label col-sm-2\" for=\"year_end\">Creation Year End:</label>");
                  out.println("<div class=\"col-sm-2\">");
                  out.println("<input type=\"text\" class=\"form-control\" id=\"year_end\" name=\"year_end\" placeholder=\"Creation Year End\">");
                  out.println("</div>");
                  out.println("<label class=\"control-label col-sm-2\" for=\"location\">Location:</label>");
                  out.println("<div class=\"col-sm-2\">");
                  out.println("<input type=\"text\" class=\"form-control\" id=\"location\" name=\"location\" placeholder=\"Location\">");
                  out.println("</div>");
                  out.println("</div>");

                  out.println("<div class=\"form-group\">");
                  out.println("<div class=\"col-sm-offset-2 col-sm-10\">");
                  out.println("<button type=\"submit\" class=\"btn btn-default\">Search</button>");
                  out.println("</div>");
                  out.println("</div>");

                  out.println("</form>");
                  out.println("</div>");
                  out.println("</div>");

                  break;
                case 16:
                  // find artist
                  out.println("<p class=\"lead text-center\">");
                  out.println("Find artist");
                  out.println("</p>");


                  out.println("<div class=\"col-sm-offset-1\">");
                  out.println("<div class=\"col-sm-10\">");

                  out.println("<form method=\"post\" class=\"form-horizontal\" role=\"form\">");
                  out.println("<div class=\"row form-group\">");
                  out.println("<input type=\"hidden\" name=\"funcID\" value=\"18\">");
                  out.println("<label class=\"control-label col-sm-2\" for=\"country\">Country:</label>");
                  out.println("<div class=\"col-sm-4\">");
                  out.println("<input type=\"text\" class=\"form-control\" id=\"country\" name=\"country\" placeholder=\"Country\">");
                  out.println("</div>");
                  out.println("<label class=\"control-label col-sm-2\" for=\"birth_year\">Birth Year:</label>");
                  out.println("<div class=\"col-sm-4\">");
                  out.println("<input type=\"text\" class=\"form-control\" id=\"birth_year\" name=\"birth_year\" placeholder=\"Birth Year\">");
                  out.println("</div>");
                  out.println("</div>");

                  out.println("<div class=\"form-group\">");
                  out.println("<div class=\"col-sm-offset-2 col-sm-10\">");
                  out.println("<button type=\"submit\" class=\"btn btn-default\">Search</button>");
                  out.println("</div>");
                  out.println("</div>");

                  out.println("</form>");
                  out.println("</div>");
                  out.println("</div>");
                  break;
                case 17:
                  // search image result
                  StringBuilder query = new StringBuilder("select * from artist join image on artist.artist_id=image.artist_id join detail on detail.image_id=image.image_id where");
                  String[] fieldName = {"artist.name", "type", "location"};
                  String[] fields = {name, type, location};
                  int j = 0;
                  for(int i = 0; i < fields.length; i++) {
                    if(fields[i].length() != 0) {
                      if(j != 0) {
                        query.append(" and ");
                      } else {
                        query.append(' ');
                      }
                      query.append(fieldName[i]);
                      query.append('=');
                      query.append('\'');
                      query.append(fields[i]);
                      query.append('\'');
                      j++;
                    }
                  }

                  if(year_start.length() != 0) {
                      if(j != 0) {
                        query.append(" and ");
                      } else {
                        query.append(' ');
                      }
                      query.append(String.format("year >= \'%s\'", year_start));
                      j++;
                  }

                  if(year_end.length() != 0) {
                      if(j != 0) {
                        query.append(" and ");
                      } else {
                        query.append(' ');
                      }
                      query.append(String.format("year <= \'%s\'", year_end));
                      j++;
                  }

                  pstmt = con.prepareStatement(query.toString());
                  rs = pstmt.executeQuery();
                  count = 0;

                  out.println("<div class=\"container\">");
                  out.println("<table class=\"table table-condensed\">");
                  out.println("<thead>");
                  out.println("<tr>");
                  out.println("<th>Title</th>");
                  out.println("<th>Preview</th>");
                  out.println("<th>Modify details?</th>");
                  out.println("<th>Delete?</th>");
                  out.println("</tr>");
                  out.println("</thead>");
                  out.println("<tbody>");
                  while(rs.next()) {
                    out.println("<tr>");
                    out.println("<td>"+rs.getString("title")+"</td>");
                    out.println("<td>"+String.format("<img src=\"%s\" height=\"%d\" width=\"%d\">", rs.getString("link"), 100, 100)+"</td>");
                    out.println("<td>"+String.format(hiddenForm, "detail", rs.getInt("image.image_id"), 9, "image_id", rs.getInt("image.image_id"), "","detail", rs.getInt("image.image_id"), "see more details")+"</td>");
                    out.println("<td>"+String.format(hiddenForm, "delete", rs.getInt("image.image_id"), 11, "image_id", rs.getInt("image.image_id"), "","delete", rs.getInt("image.image_id"), "delete")+"</td>");
                    out.println("</tr>");
                    count++;
                  }
                  out.println("</tbody>");
                  out.println("</table>");
                  out.println("</div>");
                  out.println(String.format("%d images found", count));
                  rs.close();
                  pstmt.close();
                  out.println(String.format(hiddenForm, "back", 0, 15, "no", 0, "","back", 0, "Search Again"));
                  break;
                case 18:
                  // search artist result
                  query = new StringBuilder("select * from artist where");
                  fieldName = new String[]{"country", "birth_year"};
                  fields = new String[]{country, birth_year};
                  j = 0;
                  for(int i = 0; i < fields.length; i++) {
                    if(fields[i].length() != 0) {
                      if(j != 0) {
                        query.append(" and ");
                      } else {
                        query.append(' ');
                      }
                      query.append(fieldName[i]);
                      query.append('=');
                      query.append('\'');
                      query.append(fields[i]);
                      query.append('\'');
                      j++;
                    }
                  }

                  pstmt = con.prepareStatement(query.toString());
                  rs = pstmt.executeQuery();
                  out.println("<div class=\"container\">");
                  out.println("<table class=\"table table-condensed\">");
                  out.println("<thead>");
                  out.println("<tr>");
                  out.println("<th>Name</th>");
                  out.println("<th>Birth Year</th>");
                  out.println("<th>Country</th>");
                  out.println("<th>Description</th>");
                  out.println("<th>Modify Info</th>");
                  out.println("</tr>");
                  out.println("</thead>");
                  out.println("<tbody>");
                  while(rs.next()) {
                    out.println("<tr>");
                    out.println(String.format("<form method=\"post\" id=\"%s\">", "modify"+rs.getString("artist_id")));
                    out.println("<td>"+String.format("<input type=\"text\" name=\"name\" value=\"%s\">", rs.getString("name"))+"</td>");
                    out.println("<td>"+String.format("<input type=\"text\" name=\"birth_year\" value=\"%s\">", rs.getString("birth_year"))+"</td>");
                    out.println("<td>"+String.format("<input type=\"text\" name=\"country\" value=\"%s\">", rs.getString("country"))+"</td>");
                    out.println("<td>"+String.format("<input type=\"text\" name=\"description\" value=\"%s\">", rs.getString("description"))+"</td>");
                    out.println("<input type=\"hidden\" name=\"funcID\" value=\"14\">");
                    out.println(String.format("<input type=\"hidden\" class=\"form-control\" id=\"artist_id\" name=\"artist_id\" value=\"%s\">", rs.getString("artist_id")));
                    out.println("<td>"+String.format("<a href=\"javascript:{}\" onclick=\"document.getElementById(\'%s%s\').submit(); return false;\">modify</a></form>", "modify", rs.getString("artist_id"))+"</td>");
                    out.println("</tr>");
                  }
                  out.println("</tbody>");
                  out.println("</table>");
                  out.println("</div>");
                  rs.close();
                  pstmt.close();
                  out.println(String.format(hiddenForm, "back", 0, 16, "no", 0, "","back", 0, "Search Again"));
                  break;
              }
              con.close();
            }
            catch(Exception e)
            {
                out.println(e.toString());
            }

          } else {
              out.println("<div class=\"page-header text-center\"><h1>Welcome to the gallery!</h1></div>");
          }%>
    </p>
  </div>

  <!-- /END THE FEATURETTES -->
<hr>

  <!-- FOOTER -->
  <footer>
    <p class="pull-right"><a href="#">Back to top</a></p>
  </footer>

</div><!-- /.container -->
	<!-- script references -->
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>
