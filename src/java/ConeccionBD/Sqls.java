package ConeccionBD;

import ConeccionBD.OperacionBD.*;

public class Sqls {
    public String[][] SQL_LlenaObjetoSessionUsuario(String rut) {
        String[][] Matriz = new String[200][200];
        try{
            OperacionBD OperaBD = new OperacionBD();
            String sql = " select NOMBRE, COD_AREA, TELEFONO, SUCURSAL, EMAIL, FECHA, PATERNO, MATERNO, RUT ";
            sql+= " from INF_DATOS ";
            sql += " WHERE rut = '" + rut.trim() + "' ";
            Matriz = OperaBD.SQL_Dev_Matriz_Env_Sql(sql, 9, 4);
            OperaBD = null;
        }catch  (Exception e) {
            Matriz[99][99] = "Error SQL_LlenaObjetoSessionUsuario: " + e;
        }
        return Matriz;
    }

    public String[][] SQL_LlenaObjetoCodigosAreas() {
        String[][] Matriz = new String[200][200];
        String sql = "";
        try{
            OperacionBD OperaBD = new OperacionBD();            
            sql = "SELECT ID, CODIGO, REGION, PROVINCIA FROM INF_COD_AREA ORDER BY ID ";
            Matriz = OperaBD.SQL_Dev_Matriz_Env_Sql(sql, 4, 4);
            OperaBD = null;
        }catch  (Exception e) {
            Matriz[99][99] = "Error SQL_LlenaObjetoCodigosAreas: " + e;
        }
        return Matriz;
    }

     public String[][] SQL_LlenaObjetoSucursales(String region) {
        String[][] Matriz = new String[200][200];
        String sql = "";
        try{
            OperacionBD OperaBD = new OperacionBD();

            if(region.trim().equals("")){
                sql = "select codigo , descripcion , region from INF_SUCURSALES ";
            }else{
                sql = "select codigo , descripcion , region from INF_SUCURSALES where region =  " + region.trim();    
            }

            Matriz = OperaBD.SQL_Dev_Matriz_Env_Sql(sql, 3, 4);
            OperaBD = null;
        }catch  (Exception e) {
            Matriz[99][99] = "Error SQL_LlenaObjetoSucursales: " + e;
        }
        return Matriz;
    }




    public String[][] SQL_InsertaRegistro(String nombre, String area, String fono , String sucursal, String email, String paterno, String materno, String rut ) {
        String[][] Matriz = new String[200][200];
        try{            
            OperacionBD OperaBD = new OperacionBD();
            String sql = "select rut from INF_DATOS where rut = '" + rut + "'";
            Matriz = OperaBD.SQL_Dev_Matriz_Env_Sql(sql, 1, 4);
            if(Matriz[1][1].trim().equals("FIN")){
                sql = " insert into INF_DATOS (NOMBRE, COD_AREA, TELEFONO, SUCURSAL, EMAIL, fecha , paterno , materno, rut) ";
                sql+= " values ('" + nombre.trim()+ "' , '" + area.trim()+ "' , '" + fono.trim()+ "' , '" + sucursal + "' , '" + email.trim()+ "' , sysdate , '" + paterno.trim() +"' , '" + materno.trim() + "' , '" + rut.trim() + "' )";
            }else{
                sql = "update INF_DATOS set NOMBRE='" +  nombre.trim() + "' , cod_area='"+ area.trim()+"', telefono='"+fono.trim()+ "' , sucursal='"+sucursal+"', email='"+email.trim();
                sql+= "', fecha=sysdate , paterno='"+paterno.trim() + "' , materno='"+materno.trim()+"' where rut='" + rut.trim()+"'";
            }
            OperaBD.SQL_Ejecuta_Accion_Update_Insert_Delete(sql, 4, 0, 0);
            OperaBD = null;
        }catch  (Exception e) {
            Matriz[99][99] = "Error SQL_InsertaRegistro: " + e;
        }
        return Matriz;
    }



}
