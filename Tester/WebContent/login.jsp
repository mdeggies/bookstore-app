<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
    <form action="loginServlet" method="post">  
        <fieldset style="width: 300px">  
            <legend>Login</legend>  
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
                    <td><input type="submit" value="Login" /></td>  
                    <td><input type="reset" value="Reset"/></td>
                </tr>  
            </table>  
        </fieldset>  
            <br>
			If you are a new user, please <a href="register.jsp">register</a>.
    </form>  
</body>
</html>