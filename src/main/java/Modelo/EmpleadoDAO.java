package Modelo;

import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmpleadoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    int r;

    public Empleado Validar(String user, String dni) {
        Empleado em = new Empleado();
        String sql = "select * from empleado where user=? and dni=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, dni);
            rs = ps.executeQuery();
            while (rs.next()) {
                em.setId(rs.getInt("IdEmpleado"));
                em.setUser(rs.getString("User"));
                em.setDni(rs.getString("Dni"));
                em.setNom(rs.getString("Nombres"));
            }
        } catch (Exception e) {
        }
        return em;
    }

    //CRUD
    public List listar() {
        String sql = "Select * from empleado";
        List<Empleado> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Empleado em = new Empleado();
                em.setId(rs.getInt(1));
                em.setDni(rs.getString(2));
                em.setNom(rs.getString(3));
                em.setTel(rs.getString(4));
                em.setEstado(rs.getString(5));
                em.setUser(rs.getString(6));
                lista.add(em);
            }
        } catch (Exception ex) {
        }
        return lista;
    }

    public int agregar(Empleado e) {
        String sql = "insert into empleado(Dni,Nombres,Telefono,Estado,user)values(?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, e.getDni());
            ps.setString(2, e.getNom());
            ps.setString(3, e.getTel());
            ps.setString(4, e.getEstado());
            ps.setString(5, e.getUser());
            ps.executeUpdate();
        } catch (Exception ex) {

        }
        return r;
    }

    public Empleado listarId(int id) {
        Empleado emp = new Empleado();
        //String sql = "select * from empleado where IdEmpleado=" + id;
        StringBuilder sql = new StringBuilder("select *  from empleado WHERE IdEmpleado = ");
        sql.append(id).append("");
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql.toString());
            rs = ps.executeQuery();
            while (rs.next()) {
                emp.setDni(rs.getString(2));
                emp.setNom(rs.getString(3));
                emp.setTel(rs.getString(4));
                emp.setEstado(rs.getString(5));
                emp.setUser(rs.getString(6));
            }
        } catch (Exception ex) {
            System.out.println("Error listar Id: " + ex);
        }
        return emp;
    }

    public int actualizar(Empleado e) {
        String sql = "update empleado set Dni=?, Nombres=?, Telefono=?, Estado=?, User=? where IdEmpleado=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            
            ps.setString(1, e.getDni());
            ps.setString(2, e.getNom());
            ps.setString(3, e.getTel());
            ps.setString(4, e.getEstado());
            ps.setString(5, e.getUser());
            ps.setInt(6, e.getId());
            ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Error al Actualizar :" + ex);
        }
        return r;
    }

    public void delete(int id) {
        //String sql = "delete from empleado where(IdEmpleado=" + id + ")";
        StringBuilder sql = new StringBuilder("delete  from empleado WHERE (IdEmpleado = ");
        sql.append(id).append(")");
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql.toString());
            ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Error al Eliminar :" + ex);
        }
    }
}
