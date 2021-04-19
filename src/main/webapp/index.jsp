<html>
<body>
<h1>JDBC Connection example</h1>

<form method="POST" action="insertGuests.jsp">
<label for="firstname">Name: </label>
<input type="text" name=firstname>

<label for="lastname">Surname: </label>
<input type="text" name=surname>

<label for="email">Email: </label>
<input type="text" name=email>

<button type="submit">Send</button>
</form>
<br>
<a href="<%= response.encodeURL(request.getContextPath() + "/showGuests.jsp") %>"> Show Guests </a>
<a href="<%= response.encodeURL(request.getContextPath() + "/showProducts.jsp") %>">Show Products</a>
</body>
</html>
