<%@page import="com.emergentes.modelo.Estudiante"%>
<%
    Estudiante item = (Estudiante) request.getAttribute("miEstudiante");
%><%!String cat;%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MODIFICAR</title>
    </head>
    <body>
        <FONT COLOR="red"><h1>MODIFICAR REGISTRO</h1></FONT>
        <form action="MainController" method="post">
            <input type="hidden" name="id" value="<%= item.getId() %>"/>
            <table>
                <tr>
                    <td>NOMBRE:</td>
                    <td><input type="text" name="nombres" value="<%= item.getNombres() %>" /> </td>
                </tr>
                <tr>
                    <td>APELLIDO:</td>
                    <td><input type="text" name="apellidos" value="<%= item.getApellidos() %>" /></td>
                </tr>
                <tr>
                    <td>CATEGORIA</td>
                    <td><select name="categoria">
                            <%cat=item.getCategoria(); 
                            switch (cat){
                                case "Junior":
                                   %>
                                    <option value="Junior" selected>Junior</option>
                                    <option value="Senior">Senior</option>
                                    <option value="SemiSenior">Semi-Senior</option>
                                   <%
                                    break;
                                case "Senior":
                                   %>
                                   <option value="Junior">Junior</option>
                                   <option value="Senior" selected>Senior</option>
                                   <option value="SemiSenior">Semi-Senior</option>
                                   <%
                                   break;
                                case "SemiSenior":
                                   %>
                                    <option value="Junior">Junior</option>
                                    <option value="Senior">Senior</option>
                                    <option value="SemiSenior" selected>Semi-Senior</option>
                            <%
                                break;
     
                                }    
                            %>  
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>CONFIRMADO</td>
                    <%if (item.getConfirmado()==0) {
                            %>
                            <td><input type="checkbox" name="confirmado" value=1></td>
                            <%
                        }else{
                            %>
                            <td><input type="checkbox" name="confirmado" value=1 checked></td>
                            <%
                         }
                    %>
                    
                </tr>
                <tr>
                    <td>FECHA DE INSCRIPCION </td>
                    <td><input type="date" name="fechainscripcion" value="<%= item.getFechainscripcion() %>" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Enviar" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
