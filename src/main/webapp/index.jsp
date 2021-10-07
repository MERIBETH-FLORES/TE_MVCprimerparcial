<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Estudiante"%>
<%
    ArrayList<Estudiante> lista = (ArrayList<Estudiante>) session.getAttribute("listaestudiante");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REGISTRO</title>
    </head>
    <body>
        <table border="1" >
            <tr>
                <td>PRIMER PARCIAL TEM-742
                    <br>Nombre: MERIBETH KAREN FLORES BAUTISTA
                    <br>Carnet: 10078054LP
                </td>
            </tr>
        </table>

        <FONT COLOR="red"><h1>REGISTRO OLIMPIADAS DE PROGRAMACION</h1></font>
        <a href="MainController?op=nuevo">NUEVO REGISTRO</a>
        <form>   
        <table border="1">
            <tr>
                <th>ID</th>
                <th>NOMBRE</th>
                <th>APELLIDOS</th>
                <th>CATEGORIAS</th>
                <th>CONFIRMAR</th>
                <th>FECHA DE INSCRIPCION</th>
                <th></th>
                <th></th>
            </tr>
            <%
                if (lista != null){
                    for (Estudiante item : lista){
            %>
            <tr>
                <td><%= item.getId() %></td>
                <td><%= item.getNombres() %> </td>
                <td><%= item.getApellidos() %></td>
                <td><%= item.getCategoria() %></td>   
                <td><input type="checkbox" name="confirmado" <%= (item.getConfirmado() == 1) ? "checked":"" %>></td>
                <td><%= item.getFechainscripcion() %></td>
                <td><a href="MainController?op=editar&id=<%= item.getId() %>">MODIFICAR REGISTRO</a></td>
                <td><a href="MainController?op=eliminar&id=<%= item.getId() %>"
                       onclick="return confirm('Está seguro que desea eliminar el registro ?');">ELIMINAR REGISTRO</a></td>
            </tr>
            <%
                    }
                }
            %>
        </table>
        </form> 
    </body>
</html>
