package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Config.Conexion;

public class ProductoDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
    public Producto buscar(int id){
        Producto pr = new Producto();
        //StringBuilder ss = new StringBuilder("select * from pro");
        String sql = "Select * from producto where IdProducto='" + id + "'";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            //con.prepareStatement(sql.toString());
            rs = ps.executeQuery();
            while (rs.next()) {
                pr.setIdp(rs.getInt(1));
                pr.setNop(rs.getString(2));
                pr.setPre(rs.getDouble(3));
                pr.setStock(rs.getInt(4));
                pr.setEsta(rs.getString(5));
            }
        } catch (Exception e) {
            System.out.println("error al Buscar Id :" + e);
        }
        return pr;
    }
    public int actualizarstock(int id, int stock){
        String sql = "update producto set Stock=? where (IdProducto=?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, stock);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("error al Actualizar Stock :" + e);
        }
        return r;
    }
    //CRUD
    public List listar(){
        String sql = "Select * from producto";
        List<Producto> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto pr = new Producto();
                pr.setIdp(rs.getInt(1));
                pr.setNop(rs.getString(2));
                pr.setPre(rs.getDouble(3));
                pr.setStock(rs.getInt(4));
                pr.setEsta(rs.getString(5));
                lista.add(pr);
            }
        } catch (Exception e) {
           System.out.println("Error: " + e);
        }
        return lista;
    }

    public int agregar(Producto p){
        String sql = "insert into producto(Nombres, Precio, Stock, Estado) value(?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getNop());
            ps.setDouble(2, p.getPre());
            ps.setInt(3, p.getStock());
            ps.setString(4, p.getEsta());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al Add: " + e);
        }
        return r;
    }
    public Producto listarid(int id){
        Producto pr = new Producto();
        String sql = "Select * from producto where IdProducto=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                pr.setIdp(rs.getInt(1));
                pr.setNop(rs.getString(2));
                pr.setPre(rs.getDouble(3));
                pr.setStock(rs.getInt(4));
                pr.setEsta(rs.getString(5));
            }
        } catch (Exception e) {
            System.out.println("Error al Listar: " + e);
        }
        return pr;
    }
    public int actualizar (Producto p){
        String sql = "update producto set Nombres=?, Precio=?, Stock=?, Estado=? where IdProducto=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getNop());
            ps.setDouble(2, p.getPre());
            ps.setInt(3, p.getStock());
            ps.setString(4, p.getEsta());
            ps.setInt(5, p.getIdp());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al Actualizar: " + e);
        }
        return r;
    }
    public void delete(int id){
        String sql = "delete from producto where IdProducto=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al Eliminar: " + e);
        }
    }
}
