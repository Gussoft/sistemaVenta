package Modelo;

public class Producto {
    int idp;
    String nop;
    double pre;
    int stock;
    String esta;
    
    public Producto(){
    
    }

    public Producto(int idp, String nop, double pre, int stock, String esta) {
        this.idp = idp;
        this.nop = nop;
        this.pre = pre;
        this.stock = stock;
        this.esta = esta;
    }

    public int getIdp() {
        return idp;
    }

    public void setIdp(int idp) {
        this.idp = idp;
    }

    public String getNop() {
        return nop;
    }

    public void setNop(String nop) {
        this.nop = nop;
    }

    public double getPre() {
        return pre;
    }

    public void setPre(double pre) {
        this.pre = pre;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getEsta() {
        return esta;
    }

    public void setEsta(String esta) {
        this.esta = esta;
    }
    
            
}
