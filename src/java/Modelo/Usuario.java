package Modelo;
public class Usuario {
   private int id;
   private String nombre;
   private String apa;
   private String ama;
   private String usuario;
   private String pwd;
   private String email;
   private String tipo;
   
       public Usuario() {
    }
   
   
   public Usuario(int id,String nombre,String apa,String ama,String usuario,String pwd,String email,String tipo){
    
       this.id = id;
       this.nombre = nombre;
       this.apa = apa;
       this.ama = ama;
       this.usuario = usuario;
       this.pwd = pwd;
       this.email = email;
       this.tipo = tipo;
   }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the apa
     */
    public String getApa() {
        return apa;
    }

    /**
     * @param apa the apa to set
     */
    public void setApa(String apa) {
        this.apa = apa;
    }

    /**
     * @return the ama
     */
    public String getAma() {
        return ama;
    }

    /**
     * @param ama the ama to set
     */
    public void setAma(String ama) {
        this.ama = ama;
    }

    /**
     * @return the usuario
     */
    public String getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    /**
     * @return the pwd
     */
    public String getPwd() {
        return pwd;
    }

    /**
     * @param pwd the pwd to set
     */
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the tipo
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
}
