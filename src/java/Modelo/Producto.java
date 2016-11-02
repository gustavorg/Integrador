package Modelo;
public class Producto {
    private Integer id;
    private String nombre;
    private String descripcion;
    private String imagen;
    private Double precio;
    private Integer categoria;
    private Integer stock;
    private Integer Id_marca;
    private Integer Id_modelo;
    private String nom_marca;
    private String nom_modelo;
    private String nom_categoria;
    
    public Producto(Integer id,String nombre,String descripcion,String imagen,Double precio,Integer categoria,Integer stock,Integer Id_marca, Integer Id_modelo, String nom_marca,String nom_modelo,String nom_categoria)
    {
    this.id = id;
    this.nombre = nombre;
    this.descripcion = descripcion;
    this.imagen = imagen;
    this.precio = precio;
    this.categoria = categoria;
    this.stock = stock;
    this.Id_marca = Id_marca;
    this.Id_modelo = Id_modelo;
    this.nom_marca = nom_marca;
    this.nom_modelo = nom_modelo;
    this.nom_categoria = nom_categoria;
    }

    /**
     * @return the id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Integer id) {
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
     * @return the imagen
     */
    public String getImagen() {
        return imagen;
    }

    /**
     * @param imagen the imagen to set
     */
    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    /**
     * @return the precio
     */
    public Double getPrecio() {
        return precio;
    }

    /**
     * @param precio the precio to set
     */
    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    /**
     * @return the categoria
     */
    public Integer getCategoria() {
        return categoria;
    }

    /**
     * @param categoria the categoria to set
     */
    public void setCategoria(Integer categoria) {
        this.categoria = categoria;
    }

    /**
     * @return the stock
     */
    public Integer getStock() {
        return stock;
    }

    /**
     * @param stock the stock to set
     */
    public void setStock(Integer stock) {
        this.stock = stock;
    }

    /**
     * @return the Id_marca
     */
    public Integer getId_marca() {
        return Id_marca;
    }

    /**
     * @param Id_marca the Id_marca to set
     */
    public void setId_marca(Integer Id_marca) {
        this.Id_marca = Id_marca;
    }

    /**
     * @return the Id_modelo
     */
    public Integer getId_modelo() {
        return Id_modelo;
    }

    /**
     * @param Id_modelo the Id_modelo to set
     */
    public void setId_modelo(Integer Id_modelo) {
        this.Id_modelo = Id_modelo;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the nom_marca
     */
    public String getNom_marca() {
        return nom_marca;
    }

    /**
     * @param nom_marca the nom_marca to set
     */
    public void setNom_marca(String nom_marca) {
        this.nom_marca = nom_marca;
    }

    /**
     * @return the nom_modelo
     */
    public String getNom_modelo() {
        return nom_modelo;
    }

    /**
     * @param nom_modelo the nom_modelo to set
     */
    public void setNom_modelo(String nom_modelo) {
        this.nom_modelo = nom_modelo;
    }

    /**
     * @return the nom_categoria
     */
    public String getNom_categoria() {
        return nom_categoria;
    }

    /**
     * @param nom_categoria the nom_categoria to set
     */
    public void setNom_categoria(String nom_categoria) {
        this.nom_categoria = nom_categoria;
    }

}
