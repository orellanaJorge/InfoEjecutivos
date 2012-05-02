<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Sistema de Actualizacion de Informacion</title>
<link href="css/estilo001.css" rel="stylesheet" type="text/css" />
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
  
  
 
<br>
<br>
<br>
<% 
String mensaje = request.getParameter("mensaje");
if( (mensaje==null) || (mensaje.length()==0) ){mensaje = "";}
%>
<form name="form1" method="post" action="ValidaUsuario.jsp">
<table width="356" border="0" align="center">
  <tr>
    <td width="97">&nbsp;</td>
    <td width="14">&nbsp;</td>
    <td width="231">&nbsp;</td>
  </tr>
  <tr>
    <td>Ingrese Rut</td>
    <td>:</td>
    <td><input name="rut" type="text" id="rut" size="10" maxlength="10" /> 
      &nbsp;&nbsp;&nbsp;Ej: 13452178-5</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3"><table width="61" border="0" align="center">
      <tr>
        <td width="55">
            <a  href="javascript:document.forms[0].submit()" onmouseover="MM_swapImage('Entrar','','images/b001_b.png',1)" onmouseout="MM_swapImgRestore()">
                <img src="images/b001_a.png" alt="Entrar" name="Entrar" width="58" height="21" border="0" id="Entrar" />
            </a>
        </td>
      </tr>
    </table></td>
    </tr>
</table>
</form>
<br>
<br>
<table width="356" border="0" align="center">
  <tr>
    <td width="181"><%=mensaje%></td>
  </tr>
</table>
  </div>
  <div id="footer">
    </div>
</div>

</body>
</html>
