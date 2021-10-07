package com.emergentes.controlador;

import com.emergentes.modelo.Estudiante;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {
    
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession ses = request.getSession();
        
        if (ses.getAttribute("listaestudiante") == null){
            ArrayList<Estudiante> listaux = new ArrayList<Estudiante>();
            ses.setAttribute("listaestudiante", listaux);
        }
        
        ArrayList<Estudiante> lista = (ArrayList<Estudiante>)ses.getAttribute("listaestudiante");
        
        
        String op = request.getParameter("op");
        String opcion = (op != null) ? op : "view";
        
        Estudiante obj1 = new Estudiante();
        int id, pos;
        
        switch (opcion){
            case "nuevo":
                request.setAttribute("miEstudiante", obj1);
                request.getRequestDispatcher("nuevo.jsp").forward(request, response);
                break;
            case "editar":
                id = Integer.parseInt(request.getParameter("id"));
                pos = buscarIndice(request,id);
                obj1 = lista.get(pos);
                request.setAttribute("miEstudiante", obj1);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "eliminar":
                id = Integer.parseInt(request.getParameter("id"));
                pos = buscarIndice(request,id);
                lista.remove(pos);
                ses.setAttribute("listaestudiante", lista);
                response.sendRedirect("index.jsp");
                break;
            case "view":
                response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses =  request.getSession();
        ArrayList<Estudiante> lista = (ArrayList<Estudiante>)ses.getAttribute("listaestudiante");
        
        Estudiante obj1 = new Estudiante();
        int x;
        if (request.getParameter("confirmado")==null) {
            x=0;
            obj1.setConfirmado(x);
        }else{
            obj1.setConfirmado(Integer.parseInt(request.getParameter("confirmado")));
        }
        obj1.setId(Integer.parseInt(request.getParameter("id")));
        obj1.setNombres(request.getParameter("nombres"));
        obj1.setApellidos(request.getParameter("apellidos"));
        obj1.setCategoria(request.getParameter("categoria"));
        obj1.setFechainscripcion(request.getParameter("fechainscripcion"));     
        int idt = obj1.getId();
        if (idt == 0){
            int ultID;
            ultID = ultimoId(request);
            obj1.setId(ultID);
            lista.add(obj1);
        }
        else{
            lista.set(buscarIndice(request,idt), obj1);
        }
        ses.setAttribute("listaestudiante", lista);
        response.sendRedirect("index.jsp");                
    }
    private int buscarIndice(HttpServletRequest request, int id){
        HttpSession ses = request.getSession();
        ArrayList<Estudiante> lista = (ArrayList<Estudiante>)ses.getAttribute("listaestudiante");
        
        int indice = 0;
        if (lista.size() > 0){
            for (int i = 0; i < lista.size(); i++) {
                if (lista.get(i).getId()==id) {
                    indice=i;
                }
            }
        }
        return indice;
    }
    
    private int ultimoId(HttpServletRequest request){
        HttpSession ses = request.getSession();
        ArrayList<Estudiante> lista = (ArrayList<Estudiante>)ses.getAttribute("listaestudiante");
        
        int idaux = 0;
        for (Estudiante item: lista){
            idaux = item.getId();
        }
        return idaux + 1;
    }
}