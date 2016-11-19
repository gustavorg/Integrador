package Modelo;
import Clases.Producto;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

/**
 *
 * @author GRLIMA
 */
public class HRService {
             Statement stm;
         ResultSet rs;
          PreparedStatement pr;
         CallableStatement cst ;
         Conexion cn = new Conexion();
         Connection conex = cn.MySQLConnect();
         
    public  Usuario VerificarUsuario(String usuario){
        Usuario usu = new Usuario();
        try{
            cst = conex.prepareCall("CALL LOGEAR_USUARIO (?)");
            cst.setString(1, usuario);
            ResultSet rs = cst.executeQuery();
            
            while(rs.next()){
                usu.setUsuario(rs.getString("Cod_Usuario")); 
                usu.setPwd(rs.getString("Password"));
                usu.setTipo(rs.getString("Tipo"));
            }
        }catch(Exception e){System.out.println(e);}
        return usu;
    }             
    public Vector<Pagina> InfoPag(){
             Vector<Pagina> vecPag=new Vector<Pagina>();
             String sql="SELECT * FROM pagina";
        try{
            pr=conex.prepareStatement(sql);
            rs=pr.executeQuery();
            while(rs.next()){
                Pagina pag = new Pagina(rs.getString("Nom_Pagina"),rs.getString("Titulo"));
                pag.setNompagina(rs.getString("Nom_Pagina"));
                pag.setTitulo(rs.getString("Titulo"));
                vecPag.add(pag);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
                conex.close();
            }catch(Exception ex){

            }
        }
        return vecPag;
    }
    public Vector<Categoria> Categorias(){
             Vector<Categoria> vecCat=new Vector<Categoria>();
             String sql="SELECT * FROM categoria ";
        try{
            pr=conex.prepareStatement(sql);
            rs=pr.executeQuery();
            while(rs.next()){
                Categoria ca = new Categoria(rs.getInt("Categoria_id"),rs.getString("Nombre"),rs.getString("Descripcion"));
                ca.setId(rs.getInt("Categoria_id"));
                ca.setNom(rs.getString("Nombre"));
                ca.setDesc(rs.getString("Descripcion"));
                vecCat.add(ca);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
                conex.close();
            }catch(Exception ex){

            }
        }
        return vecCat;
    }
    
    public Vector<Categoria> CategoriaNom(int id){
             Vector<Categoria> vecCat=new Vector<Categoria>();
             String sql="SELECT * FROM categoria WHERE Categoria_id = '" + id +"'";
        try{
            pr=conex.prepareStatement(sql);
            rs=pr.executeQuery();
            while(rs.next()){
                Categoria ca = new Categoria(rs.getInt("Categoria_id"),rs.getString("Nombre"),rs.getString("Descripcion"));
                ca.setId(rs.getInt("Categoria_id"));
                ca.setNom(rs.getString("Nombre"));
                ca.setDesc(rs.getString("Descripcion"));
                vecCat.add(ca);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
                conex.close();
            }catch(Exception ex){

            }
        }
        return vecCat;
    }
    
    public Vector<Producto> Productos(String cat){
             Vector<Producto> vecPro=new Vector<Producto>();
             String sql;
             if(cat == "0"){
             sql="SELECT a.Id_producto as 'id',a.nombre as 'nom',a.descripción as 'desc',a.imagen as 'imagen',a.precio as 'precio', a.Categoria_id as 'categoria',a.stock as 'stock',a.Id_marca as 'idmarca',a.Id_modelo as 'idmodelo',c.nom_modelo as'nommodelo', b.nom_marca as 'nommarca',d.Nombre as 'nomcate' FROM productos a,marca b,modelo c,categoria d  WHERE a.Id_modelo = c.Id_modelo AND a.Id_marca = b.Id_marca AND a.Categoria_id = d.Categoria_id";
             }else{
             sql="SELECT a.Id_producto as 'id',a.nombre as 'nom',a.descripción as 'desc',a.imagen as 'imagen',a.precio as 'precio', a.Categoria_id as 'categoria',a.stock as 'stock',a.Id_marca as 'idmarca',a.Id_modelo as 'idmodelo',c.nom_modelo as'nommodelo', b.nom_marca as 'nommarca',d.Nombre as 'nomcate' FROM productos a,marca b,modelo c,categoria d  WHERE a.Id_modelo = c.Id_modelo AND a.Id_marca = b.Id_marca AND a.Categoria_id = d.Categoria_id AND d.Categoria_id = '"+ cat +"'";        
             }
             try{
            pr=conex.prepareStatement(sql);
            rs=pr.executeQuery();
            while(rs.next()){
                Producto pro = new Producto(rs.getInt("id"),rs.getString("nom"),rs.getString("desc"),rs.getString("imagen"),rs.getDouble("precio"),rs.getInt("categoria"),rs.getInt("stock"),rs.getInt("idmarca"),rs.getInt("idmodelo"),rs.getString("nommarca"),rs.getString("nommodelo"),rs.getString("nomcate"));
                pro.setId(rs.getInt("id"));
                pro.setNombre(rs.getString("nom"));
                pro.setDescripcion(rs.getString("desc"));
                pro.setImagen(rs.getString("imagen"));
                pro.setPrecio(rs.getDouble("precio"));
                pro.setCategoria(rs.getInt("categoria"));
                pro.setStock(rs.getInt("stock"));
                pro.setId_marca(rs.getInt("idmarca"));
                pro.setId_modelo(rs.getInt("idmodelo"));
                pro.setNom_marca(rs.getString("nommarca"));
                pro.setNom_modelo(rs.getString("nommodelo"));
                pro.setNom_categoria(rs.getString("nomcate"));
                vecPro.add(pro);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
                conex.close();
            }catch(Exception ex){

            }
        }
        return vecPro;
    } 
    public Vector<Producto> ProductoMasVendidos(int id){
             Vector<Producto> vecPro=new Vector<Producto>();
             String sql="SELECT COUNT(b.Id_producto) as c,b.Id_producto,a.nombre as nom,a.descripción as descr,a.imagen as imagen,d.Nom_modelo as nommodelo,a.precio as precio FROM productos a,detalle_venta b,categoria c,modelo d WHERE a.Id_producto = b.Id_producto AND a.Id_modelo = d.Id_modelo AND c.Categoria_id = a.Categoria_id AND c.Categoria_id = '" + id +"' GROUP BY a.Id_producto ORDER BY c DESC LIMIT 4";
        try{
            pr=conex.prepareStatement(sql);
            rs=pr.executeQuery();
            while(rs.next()){
                Producto pro = new Producto(null,rs.getString("nom"),rs.getString("descr"),rs.getString("imagen"),rs.getDouble("precio"),null,null,null,null,null,rs.getString("nommodelo"),null);
                pro.setId(null);
                pro.setNombre(rs.getString("nom"));
                pro.setDescripcion(rs.getString("descr"));
                pro.setImagen(rs.getString("imagen"));
                pro.setPrecio(rs.getDouble("precio"));
                pro.setCategoria(null);
                pro.setStock(null);
                pro.setId_marca(null);
                pro.setId_modelo(null);
                pro.setNom_marca(null);
                pro.setNom_modelo(rs.getString("nommodelo"));
                pro.setNom_categoria(null);
                vecPro.add(pro);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
                conex.close();
            }catch(Exception ex){

            }
        }
        return vecPro;
    }
      
    public Vector<Producto> DetalleProducto(String modelo){
             Vector<Producto> vecPro=new Vector<Producto>();
             String sql="SELECT a.Id_producto as 'id',a.nombre as 'nom',a.descripción as 'desc',a.imagen as 'imagen',a.precio as 'precio',"
                     + " a.Categoria_id as 'categoria',a.stock as 'stock',a.Id_marca as 'idmarca',a.Id_modelo as 'idmodelo',"
                     + "c.nom_modelo as'nommodelo', b.nom_marca as 'nommarca',d.Nombre as 'nomcate' FROM productos a,marca b,"
                     + "modelo c,categoria d  WHERE a.Id_modelo = c.Id_modelo AND a.Id_marca = b.Id_marca AND a.Categoria_id = d.Categoria_id "
                     + "AND c.nom_modelo ='"+ modelo+"'";
        try{
            pr=conex.prepareStatement(sql);
            rs=pr.executeQuery();
            while(rs.next()){
                Producto pro = new Producto(rs.getInt("id"),rs.getString("nom"),rs.getString("desc"),rs.getString("imagen"),rs.getDouble("precio"),rs.getInt("categoria"),rs.getInt("stock"),rs.getInt("idmarca"),rs.getInt("idmodelo"),rs.getString("nommarca"),rs.getString("nommodelo"),rs.getString("nomcate"));
                pro.setId(rs.getInt("id"));
                pro.setNombre(rs.getString("nom"));
                pro.setDescripcion(rs.getString("desc"));
                pro.setImagen(rs.getString("imagen"));
                pro.setPrecio(rs.getDouble("precio"));
                pro.setCategoria(rs.getInt("categoria"));
                pro.setStock(rs.getInt("stock"));
                pro.setId_marca(rs.getInt("idmarca"));
                pro.setId_modelo(rs.getInt("idmodelo"));
                pro.setNom_marca(rs.getString("nommarca"));
                pro.setNom_modelo(rs.getString("nommodelo"));
                pro.setNom_categoria(rs.getString("nomcate"));
                vecPro.add(pro);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
                conex.close();
            }catch(Exception ex){

            }
        }
        return vecPro;
    } 
    public Vector<ContenidoWeb> MostrarContenido(String id,String usuario){
             Vector<ContenidoWeb> vecWeb=new Vector<ContenidoWeb>();
             String sql="SELECT * FROM contenido_web WHERE Nom_Pagina = '"+ id +"' AND Cod_Usuario = '"+ usuario +"'";
        try{
            pr=conex.prepareStatement(sql);
            rs=pr.executeQuery();
            while(rs.next()){
                ContenidoWeb web = new ContenidoWeb(rs.getString("Id"),rs.getString("Nom_Pagina"),rs.getString("Contenido"));
                web.setId(rs.getString("Id"));
                web.setNompagina(rs.getString("Nom_Pagina"));
                web.setContenido(rs.getString("Contenido"));
                vecWeb.add(web);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
                conex.close();
            }catch(Exception ex){

            }
        }
        return vecWeb;
    }
    
    public Vector<ContenidoWeb> MostrarNosotros(String id,String usuario){
             Vector<ContenidoWeb> vecWeb=new Vector<ContenidoWeb>();
             String sql="SELECT * FROM contenido_web WHERE Id = '"+ id +"' AND Cod_Usuario = '"+ usuario +"'";
        try{
            pr=conex.prepareStatement(sql);
            rs=pr.executeQuery();
            while(rs.next()){
                ContenidoWeb web = new ContenidoWeb(rs.getString("Id"),rs.getString("Nom_Pagina"),rs.getString("Contenido"));
                web.setId(rs.getString("Id"));
                web.setNompagina(rs.getString("Nom_Pagina"));
                web.setContenido(rs.getString("Contenido"));
                vecWeb.add(web);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
                conex.close();
            }catch(Exception ex){

            }
        }
        return vecWeb;
    }
    
    public Vector<ContenidoWeb> MostrarCarrousel(String id){
             Vector<ContenidoWeb> vecWeb=new Vector<ContenidoWeb>();
             String sql="SELECT * FROM contenido_web WHERE Nom_Pagina = '"+ id +"'";
        try{
            pr=conex.prepareStatement(sql);
            rs=pr.executeQuery();
            while(rs.next()){
                ContenidoWeb web = new ContenidoWeb(rs.getString("Id"),rs.getString("Nom_Pagina"),rs.getString("Contenido"));
                web.setId(rs.getString("Id"));
                web.setNompagina(rs.getString("Nom_Pagina"));
                web.setContenido(rs.getString("Contenido"));
                vecWeb.add(web);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
                conex.close();
            }catch(Exception ex){

            }
        }
        return vecWeb;
    }
    
        public ArrayList<Producto> getAllProductos(){
        ArrayList<Producto> productos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql="SELECT a.id as 'id',a.nombre as 'nom',a.descripción as 'desc',a.imagen as 'imagen',a.precio as 'precio', a.categoria as 'categoria',a.stock as 'stock',a.Id_marca as 'idmarca',a.Id_modelo as 'idmodelo',c.nom_modelo as'nommodelo', b.nom_marca as 'nommarca',d.Nombre as 'nomcate' FROM productos a,marca b,modelo c,categoria d  WHERE a.Id_modelo = c.Id_modelo AND a.Id_marca = b.Id_marca AND a.Categoria = d.Categoria_id";
            pst = conex.prepareCall(sql);
            rs = pst.executeQuery();
            while(rs.next()){
                productos.add(new Producto(rs.getInt("id"),rs.getString("nom"),rs.getString("desc"),rs.getString("imagen"),rs.getDouble("precio"),rs.getInt("categoria"),rs.getInt("stock"),rs.getInt("idmarca"),rs.getInt("idmodelo"),rs.getString("nommarca"),rs.getString("nommodelo"),rs.getString("nomcate")));
            }
        } catch (Exception e) {
            
        } finally{
            try {
                if(rs != null) rs.close();
                if(pst != null) pst.close();
                if(conex != null) conex.close();
            } catch (Exception e) {
                System.out.println("ERROR allproductos");
            }
        }       
        return productos;        
    }
    
    
     public Producto ProCarrito(String modelo){
             String sql;
             Producto producto = null;
             try{
                sql="SELECT a.Id_producto as 'id',a.nombre as 'nom',a.descripción as 'desc',a.imagen as 'imagen',a.precio as 'precio', a.Categoria_id as 'categoria',a.stock as 'stock',a.Id_marca as 'idmarca',a.Id_modelo as 'idmodelo',c.nom_modelo as'nommodelo', b.nom_marca as 'nommarca',d.Nombre as 'nomcate' FROM productos a,marca b,modelo c,categoria d  WHERE a.Id_modelo = c.Id_modelo AND a.Id_modelo = '" + modelo + "' AND a.Id_marca = b.Id_marca AND a.Categoria_id = d.Categoria_id";
                pr=conex.prepareStatement(sql);
                rs=pr.executeQuery();
                while(rs.next()){
                producto = new Producto(rs.getInt("id"),rs.getString("nom"),rs.getString("desc"),rs.getString("imagen"),rs.getDouble("precio"),rs.getInt("categoria"),rs.getInt("stock"),rs.getInt("idmarca"),rs.getInt("idmodelo"),rs.getString("nommarca"),rs.getString("nommodelo"),rs.getString("nomcate"));
                }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try {
                if(rs != null) rs.close();
                if(pr != null) pr.close();
                if(conex != null) conex.close();
            } catch (Exception e) {
                System.err.println("ERROR PROCARRITO");
            }
        }
             return producto;
    } 
    
      public boolean insertarVenta(Venta v){
        boolean resp = false;
        
        try{
            cst = conex.prepareCall("CALL REGISTRAR_VENTA (?,?)");
            cst.setString(1, v.getUsuario());
            cst.setDouble(2, v.getTotal());
            int i = cst.executeUpdate();
            
            if(i == 1){
                resp = true;
            }else{
                resp = false;
            }
            
        }catch(Exception e){System.out.println(e);}
        return resp;
    }
      
    public Vector<Miscompras> MisCompras(String usuario){
        Vector<Miscompras> vecComp=new Vector<Miscompras>();
        String sql="SELECT a.imagen,a.nombre,b.Precio,b.Cantidad,b.SubTotal FROM productos a,detalle_venta b,usuario c,venta d WHERE d.Num_V = b.Num_V AND a.Id_producto = b.Id_producto AND a.precio = b.Precio  AND d.Cod_Usuario = c.Cod_Usuario AND c.Cod_Usuario = '" + usuario +"'";
    try{
            pr=conex.prepareStatement(sql);
            rs=pr.executeQuery();
            while(rs.next()){
                Miscompras comp = new Miscompras();
                comp.setImagen(rs.getString("imagen"));
                comp.setNomprod(rs.getString("nombre"));
                comp.setPrecio(rs.getDouble("Precio"));
                comp.setCantidad(rs.getInt("Cantidad"));
                comp.setSubtotal(rs.getDouble("SubTotal"));
                vecComp.add(comp);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
                conex.close();
            }catch(Exception ex){

            }
        }
        return vecComp;
    }
    
        public Vector<Venta> Ventas(){
        Vector<Venta> vecV=new Vector<Venta>();
        String sql="SELECT CONCAT(b.Nombre, ' ' ,b.Apellido_Paterno,' ' ,b.Apellido_Materno) as 'Cod',a.Total,a.Fecha ,a.Num_V FROM venta a, usuario b WHERE b.Cod_Usuario = a.Cod_Usuario AND  a.Fecha IS NOT NULL";
    try{
            pr=conex.prepareStatement(sql);
            rs=pr.executeQuery();
            while(rs.next()){
                Venta ven = new Venta();
                ven.setUsuario(rs.getString("Cod"));
                ven.setTotal(rs.getDouble("Total"));
                ven.setFecha(rs.getString("Fecha"));
                ven.setId(rs.getInt("Num_V"));
                vecV.add(ven);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
                conex.close();
            }catch(Exception ex){

            }
        }
        return vecV;
    }
    
        public String IdVenta(){
            String sql ="Select Num_V from venta order by Fecha desc limit 1";
            String id= "";
            try{
            pr=conex.prepareStatement(sql);
            rs=pr.executeQuery();
            while(rs.next()){
                Venta ven = new Venta();
                ven.setId(rs.getInt("Num_V"));
                id = String.valueOf(ven.getId());
            } 
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
                conex.close();
            }catch(Exception ex){

            }
        }
            return id;
        }

     public Vector<DetalleVenta> DetalleVenta(String id){
        Vector<DetalleVenta> vecV=new Vector<DetalleVenta>();
        String sql="SELECT DISTINCT b.nombre as nom,b.imagen as img,b.Precio as precio,a.Cantidad as cant,a.SubTotal as subt FROM dbcmsproductos.detalle_venta a ,productos b,usuario c\n" +
        "WHERE Num_V = '" + id + "' AND b.id_producto = a.Id_producto";
    try{
            pr=conex.prepareStatement(sql);
            rs=pr.executeQuery();
            while(rs.next()){
                DetalleVenta ven = new DetalleVenta();
                ven.setNomprod(rs.getString("nom"));
                ven.setImagen(rs.getString("img"));
                ven.setPrecio(rs.getDouble("precio"));
                ven.setCant(rs.getInt("cant"));
                ven.setSubtotal(rs.getDouble("subt"));
                vecV.add(ven);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
                conex.close();
            }catch(Exception ex){

            }
        }
        return vecV;
    }
     
      public void ActualizarNosotros(String usuario,String id,String contenido){
    try{
            pr = conex.prepareStatement(
              "UPDATE contenido_web SET Contenido = ? WHERE Cod_Usuario = ? AND Id = ? ");

            // set the preparedstatement parameters
            pr.setString(1,contenido);
            pr.setString(2,usuario);
            pr.setString(3,id);

            // call executeUpdate to execute our sql update statement
            pr.executeUpdate();
            pr.close(); 
        }catch(Exception e){System.out.println(e);}finally{
            try{
                stm.close();
                conex.close();
            }catch(Exception ex){

            }
        }
    }
    
      public String general(String id){
            String sql ="SELECT * FROM contenido_web WHERE Id = '"+ id +"'";
            String contenido = "";
            try{
            pr=conex.prepareStatement(sql);
            rs=pr.executeQuery();
            while(rs.next()){
                contenido = rs.getString("Contenido");
            } 
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
                conex.close();
            }catch(Exception ex){

            }
        }
            return contenido;
        }
      public void ActualizarGeneral(String nompag,String colorfondo,String colorletra,String tamanoletra,String tipoletra,String cmfondo,String cmletra){
          try{
            cst = conex.prepareCall("CALL UPDATE_GENERAL (?,?,?,?,?,?,?)");
            cst.setString(1, nompag);
            cst.setString(2, colorfondo);
            cst.setString(3, colorletra);
            cst.setString(4, tamanoletra);
            cst.setString(5, tipoletra);
            cst.setString(6, cmfondo);
            cst.setString(7, cmletra);
            cst.executeQuery();
        }catch(Exception e){System.out.println(e);}finally{
            try{
                cst.close();
                conex.close();
            }catch(Exception ex){

            }
        }
      }
      
      public Vector<Producto> BuscarProducto(String search){
             Vector<Producto> vecPro=new Vector<Producto>();
             String sql="SELECT a.Id_producto as 'id',a.nombre as 'nom',a.descripción as 'desc',a.imagen as 'imagen',a.precio as 'precio',"
                     + " a.Categoria_id as 'categoria',a.stock as 'stock',a.Id_marca as 'idmarca',a.Id_modelo as 'idmodelo',"
                     + "c.nom_modelo as'nommodelo', b.nom_marca as 'nommarca',d.Nombre as 'nomcate' FROM productos a,marca b,"
                     + "modelo c,categoria d  WHERE a.Id_modelo = c.Id_modelo AND a.Id_marca = b.Id_marca AND a.Categoria_id = d.Categoria_id "
                     + "AND c.nom_modelo LIKE '"+ search +"%' ";
        try{
            pr=conex.prepareStatement(sql);
            rs=pr.executeQuery();
            while(rs.next()){
                Producto pro = new Producto(rs.getInt("id"),rs.getString("nom"),rs.getString("desc"),rs.getString("imagen"),rs.getDouble("precio"),rs.getInt("categoria"),rs.getInt("stock"),rs.getInt("idmarca"),rs.getInt("idmodelo"),rs.getString("nommarca"),rs.getString("nommodelo"),rs.getString("nomcate"));
                pro.setId(rs.getInt("id"));
                pro.setNombre(rs.getString("nom"));
                pro.setDescripcion(rs.getString("desc"));
                pro.setImagen(rs.getString("imagen"));
                pro.setPrecio(rs.getDouble("precio"));
                pro.setCategoria(rs.getInt("categoria"));
                pro.setStock(rs.getInt("stock"));
                pro.setId_marca(rs.getInt("idmarca"));
                pro.setId_modelo(rs.getInt("idmodelo"));
                pro.setNom_marca(rs.getString("nommarca"));
                pro.setNom_modelo(rs.getString("nommodelo"));
                pro.setNom_categoria(rs.getString("nomcate"));
                vecPro.add(pro);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
                conex.close();
            }catch(Exception ex){

            }
        }
        return vecPro;
    }
      
    public void Registrarusuario(String alias,String nom,String apm,String app,String pwd,String email,String tipo){
            try{
            pr = conex.prepareStatement(
              "INSERT INTO usuario VALUES (?,?,?,?,?,?,?)");

            // set the preparedstatement parameters
            pr.setString(1,alias);
            pr.setString(2,nom);
            pr.setString(3,apm);
            pr.setString(4,app);
            pr.setString(5,pwd);
            pr.setString(6,email);
            pr.setString(7,tipo);
            
            // call executeUpdate to execute our sql update statement
            pr.executeUpdate();
            pr.close(); 
        }catch(Exception e){System.out.println(e);}finally{
            try{
                stm.close();
                conex.close();
            }catch(Exception ex){

            }
        }
    }
}
