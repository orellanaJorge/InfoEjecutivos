<%-- 
    Document   : Valida
    Created on : 26-abr-2012, 0:48:29
    Author     : Jorge
--%>
<%@page import="ConeccionBD.Sqls"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%

String nombreEjecutivo = request.getParameter("nombreEjecutivo");
String codArea = request.getParameter("codArea");
String tel = request.getParameter("tel");
String rut = request.getParameter("rut");
String sucursal = request.getParameter("sucursal");
String email1 = request.getParameter("email1");
String email2 = request.getParameter("email2");
String paterno = request.getParameter("paterno");
String materno = request.getParameter("materno");

String sw = "";
String mensaje = "";

if( (nombreEjecutivo==null) || (nombreEjecutivo.length()==0) ){nombreEjecutivo = "";sw="1";mensaje+= " (Nombre Ejecutivo)";}
if( (codArea==null) || (codArea.length()==0) ){codArea = "";sw="1";mensaje+= " (Codigo Area)";}
if( (rut==null) || (rut.length()==0) ){rut = "";}
if( (tel==null) || (tel.length()==0) ){tel = "";sw="1";mensaje+= " (Telefono)";}
if( (sucursal==null) || (sucursal.length()==0) ){sucursal = "";sw="1";mensaje+= " (Sucursal)";}
if( (email1==null) || (email1.length()==0) ){email1 = "";sw="1";mensaje+= " (Email)";}
if( (email2==null) || (email2.length()==0) ){email2 = "";sw="1";}
if( (paterno==null) || (paterno.length()==0) ){paterno = "";sw="1";mensaje+= " (Apellido Paterno)";}
if( (materno==null) || (materno.length()==0) ){materno = "";sw="1";mensaje+= " (Apellido Materno)";}


if(email1.trim().equals(email2.trim())){}else{sw="1";mensaje+= " (Mails ingresados no son iguales)";}


String ruta = "";
if(sw.trim().equals("")){

    Sqls sqlGatilla = new Sqls();
    sqlGatilla.SQL_InsertaRegistro(nombreEjecutivo, codArea, tel, sucursal, email1, paterno, materno, rut);
    sqlGatilla = null;

    ruta = "Mensaje.jsp";
}else{
    ruta = "IngresoDatos.jsp?nombreEjecutivo=" + nombreEjecutivo.trim() + "&codArea= " + codArea.trim() + "&tel= " + tel.trim() + "&sucursal=" + sucursal.trim() + "&email1= " + email1.trim() + "&email2=" + email2.trim() + "&mensaje=" + mensaje.trim()+ "&paterno=" + paterno.trim()+ "&materno=" + materno.trim()+ "&rut=" + rut.trim();
}
response.sendRedirect(ruta);

%>