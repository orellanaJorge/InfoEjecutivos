<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Sistema de Actualizacion de Informacion</title>
<link href="css/principalestilo.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}
function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
</script>
</head>
<body onload="MM_preloadImages('images/b001_b.png','images/b002_b.png','images/b003_b.png')">

<div id="main-wrapper">
	<div id="header"></div>
  <div id="center">

<%
ConeccionBD.Sqls sqlGatilla = new ConeccionBD.Sqls();
String nombre = "";
String email = "";

String nombreEjecutivo = request.getParameter("nombreEjecutivo");
String codArea = request.getParameter("codArea");
String tel = request.getParameter("tel");
String sucursal = request.getParameter("sucursal");
String email1 = request.getParameter("email1");
String email2 = request.getParameter("email2");
String mensaje = request.getParameter("mensaje");
String paterno = request.getParameter("paterno");
String materno = request.getParameter("materno");
String rut = request.getParameter("rut");


if( (rut==null) || (rut.length()==0) ){rut = "";}
if( (nombreEjecutivo==null) || (nombreEjecutivo.length()==0) ){nombreEjecutivo = "";}
if( (codArea==null) || (codArea.length()==0) ){codArea = "";}
if( (tel==null) || (tel.length()==0) ){tel = "";}
if( (sucursal==null) || (sucursal.length()==0) ){sucursal = "";}
if( (email1==null) || (email1.length()==0) ){email1 = "";}
if( (email2==null) || (email2.length()==0) ){email2 = "";}
if( (mensaje==null) || (mensaje.length()==0) ){mensaje = "";}
if( (paterno==null) || (paterno.length()==0) ){paterno = "";}
if( (materno==null) || (materno.length()==0) ){materno = "";}



if (rut == null) {
    response.sendRedirect("index.jsp");
} else {
    /*
     nombreEjecutivo = (String) objSesion.getAttribute("nombre");
     codArea = (String) objSesion.getAttribute("cod_area");
     tel = (String) objSesion.getAttribute("telefono");
     sucursal = (String) objSesion.getAttribute("sucursal");
     email1 = (String) objSesion.getAttribute("email");
     email1 = (String) objSesion.getAttribute("email");
     paterno = (String) objSesion.getAttribute("paterno");
     materno = (String) objSesion.getAttribute("materno");
     rut = (String) objSesion.getAttribute("rut");
  */
}
%>

 <form name="f1" method="post" action="">
	  <table width="650" border="0" align="center">
	    <tr>
	      <td colspan="4">
          <span style="font-weight: bold">Ingrese Sus Antecedentes</span></td>
        </tr>
	    <tr>
	      <td colspan="4">&nbsp;</td>
        </tr>
	    <tr>
	      <td width="13">&nbsp;</td>
	      <td width="108" height="21">Nombre Ejecutivo</td>
	      <td width="4">:</td>
	      <td width="507"><input type="text" name="nombreEjecutivo" id="nombreEjecutivo" size="65" maxlength="65" value=<%=nombreEjecutivo%> ></td>
        </tr>
	    <tr>
	      <td>&nbsp;</td>
	      <td height="21">Apellido Paterno</td>
	      <td>:</td>
	      <td><input type="text" name="paterno" id="paterno" size="65" maxlength="65" value=<%=paterno%> ></td>
        </tr>
	    <tr>
	      <td>&nbsp;</td>
	      <td height="21">Apellido Materno</td>
	      <td>:</td>
	      <td><input type="text" name="materno" id="materno" size="65" maxlength="65" value=<%=materno%> ></td>
        </tr>
	    <tr>
	      <td>&nbsp;</td>
	      <td height="21">Sucursal</td>
	      <td>&nbsp;</td>
	      <td><select name="sucursal" id="sucursal" onChange="action = 'IngresoDatos.jsp'; submit()">
	        <option value="" selected> Seleccione --></option>
	        <%
            String region = "";
            String[][] Matriz = new String[200][200];
            Matriz = sqlGatilla.SQL_LlenaObjetoSucursales();
            int col = 1;
            while (!Matriz[col][1].trim().equals("FIN")){%>
	        <%if(sucursal.trim().equals(Matriz[col][1].trim())){%>
	        <option selected value=<%=Matriz[col][1].trim()%>><%="  " + Matriz[col][2].trim()%></option>
	        <%region = Matriz[col][3].trim();}else{%>
	        <option value=<%=Matriz[col][1].trim()%>><%="  " + Matriz[col][2].trim()%></option>
	        <%}%>
	        <%col++;}%>
          </select></td>
        </tr>
	    <tr>
	      <td height="27">&nbsp;</td>
	      <td height="27">Cod. Area</td>
	      <td>:</td>
	      <td>

              <select name="codArea" id="codArea">
              <option value="" selected> Seleccione --></option>

            <%

            Matriz = sqlGatilla.SQL_LlenaObjetoCodigosAreas(region);
            col = 1;
            while (!Matriz[col][1].trim().equals("FIN")){%>
             <%if(codArea.trim().equals(Matriz[col][1].trim())){%>
                <option selected  value=<%=Matriz[col][1].trim()%>><%="  " + Matriz[col][2].trim() + "    ( " + Matriz[col][3].trim() + ", " + Matriz[col][4].trim() + " ) " %></option>
             <%}else{%>
                <option value=<%=Matriz[col][1].trim()%>><%="  " + Matriz[col][2].trim() + "    ( " + Matriz[col][3].trim() + ", " + Matriz[col][4].trim() + " ) " %></option>
             <%}%>
            <%col++;}%>
            </select>

              </td>
        </tr>
	    <tr>
	      <td height="27">&nbsp;</td>
	      <td height="27">Telefono Fijo</td>
	      <td>:</td>
	      <td><input type="text" name="tel" id="tel" size="10" maxlength="10" value=<%=tel%> ></td>
        </tr>
	    <tr>
	      <td height="24">&nbsp;</td>
	      <td>Email</td>
	      <td>:</td>
	      <td><input type="text" name="email1" id="email1" size="40" maxlength="40" value=<%=email1%> >
	        @bancoestado.cl</td>
        </tr>
	    <tr>
	      <td height="24">&nbsp;</td>
	      <td>Repita su Email</td>
	      <td>:</td>
	      <td><input type="text" name="email2" id="email2" size="40" maxlength="40" value=<%=email2%> >
          @bancoestado.cl</td>
        </tr>
	    <tr>
	      <td>&nbsp;</td>
              <%
              if(mensaje.trim().equals("")){
                       }else{
                mensaje= "Falta : " + mensaje;
}
%>
	      <td colspan="3" style="color: #F00; font-weight: bold;"><%=mensaje%>
          <input name="rut" type="hidden" id="rut" value="<%=rut%>" /></td>
        </tr>
      </table>
 <table width="61" border="0" align="center">
          <tr>             
              <td width="55">
                  <input type="submit" name="button" id="button" value="Aceptar" onclick="action = 'ValidaDatos.jsp'; submit()" />
              </td>
          </tr>
        </table>

 </form>


  </div>
  <div id="footer">
    </div>
</div>

</body>
</html>