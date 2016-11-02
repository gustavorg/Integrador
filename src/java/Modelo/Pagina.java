package Modelo;
public class Pagina {
    private String nompagina;
    private String titulo;
    
    public Pagina(String nompagina,String titulo){
        this.nompagina = nompagina;
        this.titulo = titulo;
    }

    public String getNompagina() {return nompagina;}
    public void setNompagina(String nompagina) {this.nompagina = nompagina;}
    public String getTitulo() {return titulo;}
    public void setTitulo(String titulo) {this.titulo = titulo;}
}
