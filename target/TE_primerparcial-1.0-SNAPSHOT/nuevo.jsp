<%@page import="com.emergentes.modelo.Estudiante"%>
<%
    Estudiante item = (Estudiante) request.getAttribute("miEstudiante");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <FONT COLOR="red"><h1>NUEVO REGISTRO</h1></font>
        <form action="MainController" method="post">
            <input type="hidden" name="id" value="<%= item.getId() %>">
            <table>
                <tr>
                    <td>NOMBRE:</td>
                    <td><input type="text" name="nombres" value="" > </td>
                </tr>
                <tr>
                    <td>AAPELLIDOS:</td>
                    <td><input type="text" name="apellidos" value="" ></td>
                </tr>
                <tr>
                    <td>CATEGORIA:</td>
                    <td><select name="categoria" required>
                            <option value="Junior">Junior</option>
                            <option value="Senior">Senior</option>
                            <option value="SemiSenior">Semi-Senior</option>
                        </select>
                    </td>
                   
                </tr>
                <tr>
                    <td>CONFIRMADO</td>
                        <td><input type="checkbox" name="confirmado" value=1></td>
    
                </tr>
                <tr>
                    <td>FECHA DE INSCRIPCION</td>
                    <td><input type="date" name="fechainscripcion" value="" ></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Enviar" ></td>
                </tr>
            </table>
        </form>
    </body>
</html>
