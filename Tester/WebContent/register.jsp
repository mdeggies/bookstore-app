<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
</head>
<body>
    <form action="registerServlet" method="post">  
        <fieldset style="width: 300px">  
            <legend>Register</legend>  
            <table>  
                <tr>  
                    <td>Username</td>  
                    <td><input type="text" name="username" required="required" /></td>  
                </tr>  
                <tr>  
                    <td>Password</td>  
                    <td><input type="password" name="password" required="required" /></td>  
                </tr>  
                <tr>  
                    <td>First Name</td>  
                    <td><input type="text" name="first_name" required="required" /></td>  
                </tr>  
                <tr>  
                    <td>Last Name</td>  
                    <td><input type="password" name="last_name" required="required" /></td>  
                </tr>  
                <tr>  
                    <td>Address</td>  
                    <td><input type="password" name="address" required="required" /></td>  
                </tr>  
                <tr>  
                    <td>Store Credit</td>  
                    <td><input type="password" name="store_credit" required="required" /></td>  
                </tr>  
                <tr>
                	<td>Credit Card Number</td>  
                    <td><input type="password" name="credit_card_info" required="required" /></td>  
                </tr>  
                <tr>  
                    <td><input type="submit" value="Register" /></td>  
                    <td><input type="reset" value="Reset"/></td>
                </tr>  
            </table>  
        </fieldset>  
            <br>
			If you are an existing user, please <a href="login.jsp">login</a>.
    </form>  
</body>
</html>