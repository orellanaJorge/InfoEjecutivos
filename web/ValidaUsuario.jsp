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
String nombreEjecutivo = "";
String codArea = "";
String tel = "";
String sucursal = "";
String email1 = "";
String email2 = "";
String fecha = "";
String paterno = "";
String materno = "";

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

       

        if(Matriz[1][1].trim().equals("FIN")){            
        }else{
             nombreEjecutivo = Matriz[1][1].trim();
             codArea = Matriz[1][2].trim();
             tel = Matriz[1][3].trim();
             sucursal =Matriz[1][4].trim();
             email1 =  Matriz[1][5].trim();
             email2 =  Matriz[1][5].trim();
             fecha = Matriz[1][6].trim();
             paterno = Matriz[1][7].trim();
             materno =  Matriz[1][8].trim();
        }
        
    } catch (Exception e) {mensaje+= e;}
     ruta = "IngresoDatos.jsp?nombreEjecutivo="+nombreEjecutivo+"&codArea="+codArea+"&tel="+tel+"&sucursal="+sucursal+"&email1="+email1+"&email2="+email2+"&fecha="+fecha+"&paterno="+paterno+"&materno="+materno+"&rut="+rut;
}else{
     ruta = "index.jsp?mensaje=" + mensaje;
}
response.sendRedirect(ruta);
%>
</head>
</html>