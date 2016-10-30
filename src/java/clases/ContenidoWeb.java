package clases;
public class ContenidoWeb {
    private String id;
    private String nompagina;
    private String contenido;
    public ContenidoWeb(String id,String nompagina,String contenido){
        this.id = id;
        this.nompagina = nompagina;
        this.contenido = contenido;
    }

    public String getId() {return id;}
    public void setId(String id) {this.id = id;}
    public String getNompagina() {return nompagina;}
    public void setNompagina(String nompagina) {this.nompagina = nompagina;}
    public String getContenido() { return contenido;}
    public void setContenido(String contenido) {this.contenido = contenido;}
}
