package com.emergentes.modelo;

public class Estudiante {
    private int id;
    private String nombres;
    private String apellidos;
    private String categoria;
    private int confirmado;
    private String fechainscripcion;
    
    public Estudiante() {
        this.id = 0;
        this.nombres = "";
        this.apellidos = "";
        this.categoria = "";
        this.confirmado = 2;
        this.fechainscripcion = "";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getConfirmado() {
        return confirmado;
    }

    public void setConfirmado(int confirmado) {
        this.confirmado = confirmado;
    }

    public String getFechainscripcion() {
        return fechainscripcion;
    }

    public void setFechainscripcion(String fechainscripcion) {
        this.fechainscripcion = fechainscripcion;
    }  
}
