package ConeccionBD;

import ConeccionBD.OperacionBD.*;

public class Sqls {
    public String[][] SQL_LlenaObjetoSessionUsuario(String rut) {
        String[][] Matriz = new String[200][200];
        try{
            OperacionBD OperaBD = new OperacionBD();
            String sql = "select ";
            sql += " a.id_usuario, ";
            sql += " a.nombre ,  ";
            sql += " a.email ,  ";
            sql += " a.rut   ";
            sql += " from INF_EJ_USUARIOS a   ";
            sql += " WHERE a.rut = '" + rut.trim() + "' ";
            Matriz = OperaBD.SQL_Dev_Matriz_Env_Sql(sql, 4, 4);
            OperaBD = null;
        }catch  (Exception e) {
            Matriz[99][99] = "Error SQL_LlenaObjetoSessionUsuario: " + e;
        }
        return Matriz;
    }

    public String[][] SQL_LlenaObjetoCodigosAreas() {
        String[][] Matriz = new String[200][200];
        try{
            OperacionBD OperaBD = new OperacionBD();
            String sql = "SELECT ID, CODIGO, REGION, PROVINCIA FROM INF_COD_AREA ORDER BY ID ";
            Matriz = OperaBD.SQL_Dev_Matriz_Env_Sql(sql, 4, 4);
            OperaBD = null;
        }catch  (Exception e) {
            Matriz[99][99] = "Error SQL_LlenaObjetoCodigosAreas: " + e;
        }
        return Matriz;
    }

     public String[][] SQL_LlenaObjetoSucursales() {
        String[][] Matriz = new String[200][200];
        try{
            OperacionBD OperaBD = new OperacionBD();
            String sql = "SELECT CDG_LUGAR , NMB_LUGAR FROM INF_EJ_LUGAR ";
            Matriz = OperaBD.SQL_Dev_Matriz_Env_Sql(sql, 2, 4);
            OperaBD = null;
        }catch  (Exception e) {
            Matriz[99][99] = "Error SQL_LlenaObjetoSucursales: " + e;
        }
        return Matriz;
    }




    public String[][] SQL_InsertaRegistro(String nombre, String area, String fono , String sucursal, String email ) {
        String[][] Matriz = new String[200][200];
        try{            
            OperacionBD OperaBD = new OperacionBD();
            String sql = " insert into INF_DATOS (NOMBRE, COD_AREA, TELEFONO, SUCURSAL, EMAIL, fecha) ";
            sql+= " values ('" + nombre.trim()+ "' , '" + area.trim()+ "' , '" + fono.trim()+ "' , '" + sucursal + "' , '" + email.trim()+ "' , sysdate )";
            OperaBD.SQL_Ejecuta_Accion_Update_Insert_Delete(sql, 4, 0, 0);
            OperaBD = null;
        }catch  (Exception e) {
            Matriz[99][99] = "Error SQL_InsertaRegistro: " + e;
        }
        return Matriz;
    }



}
