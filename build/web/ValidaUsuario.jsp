<%@page import="ConeccionBD.Sqls"%>
<%@page import="ValidaRut.Valida"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>

<%
String rut = request.getParameter("rut");
String mensaje = "";
String ruta = "";
String digitoValidado = "";
String digitoSinValidar = "";


Valida xp = new Valida();

int dd = rut.indexOf("-");

if (dd==-1){mensaje = "Ingrese Rut con el siguiente formato : 13468217-5";}else{
    try{
        String dig = rut.replaceAll("-", "");
        int largRut = dig.length();
        dig = dig.substring(0, largRut-1);
        digitoValidado = xp.Valida(dig);
        String rd = rut.replaceAll("-", "");
        digitoSinValidar = rd.substring(largRut-1, largRut);
    }catch(Exception e){mensaje = "Rut Invalido, intente nuevamente.";}
    if(digitoValidado.trim().equals(digitoSinValidar)){}else{mensaje = "Rut Invalido, intente nuevamente.";}
}
xp = null;

if(mensaje.trim().equals("")){
    try {
        Sqls sqlGatilla = new Sqls();
        String[][] Matriz = new String[100][100];
        Matriz = sqlGatilla.SQL_LlenaObjetoSessionUsuario(rut);
        sqlGatilla = null;
        HttpSession objSesion = request.getSession(true);
        objSesion.setAttribute("usuario", Matriz[1][1].trim());
        objSesion.setAttribute("nombre", Matriz[1][2].trim());
        objSesion.setAttribute("email", Matriz[1][3].trim());
        objSesion.setAttribute("rut", Matriz[1][4].trim());
    } catch (Exception e) {}
        ruta = "IngresoDatos.jsp";    
}else{
     ruta = "index.jsp?mensaje=" + mensaje;
}
response.sendRedirect(ruta);

%>

</head>


</html>