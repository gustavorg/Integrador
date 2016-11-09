/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
                usu.setUsuario(rs.getString("Usuario")); 
                usu.setPwd(rs.getString("Password"));
                usu.setTipo(rs.getString("Tipo"));
            }
        }catch(Exception e){System.out.println(e);}
        return usu;
    }  
         
         
  //SELECT * FROM usuario WHERE Usuario = '" + usuario + "' AND Password = '"+ password + "'
             
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
    
    public Vector<Categoria> Categoria1(){
             Vector<Categoria> vecCat=new Vector<Categoria>();
             String sql="SELECT * FROM categoria WHERE Categoria_id = 1";
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
    
    public Vector<Categoria> Categoria2(){
             Vector<Categoria> vecCat=new Vector<Categoria>();
             String sql="SELECT * FROM categoria WHERE Categoria_id = 2";
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
    
    
    public Vector<Categoria> Categoria3(){
             Vector<Categoria> vecCat=new Vector<Categoria>();
             String sql="SELECT * FROM categoria WHERE Categoria_id = 3";
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
    
    public Vector<Categoria> Categoria4(){
             Vector<Categoria> vecCat=new Vector<Categoria>();
             String sql="SELECT * FROM categoria WHERE Categoria_id = 4";
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
    
    public Vector<Categoria> Categoria5(){
             Vector<Categoria> vecCat=new Vector<Categoria>();
             String sql="SELECT * FROM categoria WHERE Categoria_id = 5";
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
    
    public Vector<Categoria> Categoria6(){
             Vector<Categoria> vecCat=new Vector<Categoria>();
             String sql="SELECT * FROM categoria WHERE Categoria_id = 6";
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
    
    public Vector<Categoria> Categoria7(){
             Vector<Categoria> vecCat=new Vector<Categoria>();
             String sql="SELECT * FROM categoria WHERE Categoria_id = 7";
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
             sql="SELECT a.id as 'id',a.nombre as 'nom',a.descripción as 'desc',a.imagen as 'imagen',a.precio as 'precio', a.categoria as 'categoria',a.stock as 'stock',a.Id_marca as 'idmarca',a.Id_modelo as 'idmodelo',c.nom_modelo as'nommodelo', b.nom_marca as 'nommarca',d.Nombre as 'nomcate' FROM productos a,marca b,modelo c,categoria d  WHERE a.Id_modelo = c.Id_modelo AND a.Id_marca = b.Id_marca AND a.Categoria = d.Categoria_id";
             }else{
             sql="SELECT a.id as 'id',a.nombre as 'nom',a.descripción as 'desc',a.imagen as 'imagen',a.precio as 'precio', a.categoria as 'categoria',a.stock as 'stock',a.Id_marca as 'idmarca',a.Id_modelo as 'idmodelo',c.nom_modelo as'nommodelo', b.nom_marca as 'nommarca',d.Nombre as 'nomcate' FROM productos a,marca b,modelo c,categoria d  WHERE a.Id_modelo = c.Id_modelo AND a.Id_marca = b.Id_marca AND a.Categoria = d.Categoria_id AND d.Categoria_id = '"+ cat +"'";        
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
    public Vector<Producto> Producto1(){
             Vector<Producto> vecPro=new Vector<Producto>();
             String sql="SELECT a.id as 'id',a.nombre as 'nom',a.descripción as 'desc',a.imagen as 'imagen',a.precio as 'precio', a.categoria as 'categoria',a.stock as 'stock',a.Id_marca as 'idmarca',a.Id_modelo as 'idmodelo',c.nom_modelo as'nommodelo', b.nom_marca as 'nommarca',d.Nombre as 'nomcate' FROM productos a,marca b,modelo c,categoria d  WHERE a.Id_modelo = c.Id_modelo AND a.Id_marca = b.Id_marca AND a.categoria = 1 AND a.Categoria = d.Categoria_id";
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
      public Vector<Producto> Producto2(){
             Vector<Producto> vecPro=new Vector<Producto>();
             String sql="SELECT a.id as 'id',a.nombre as 'nom',a.descripción as 'desc',a.imagen as 'imagen',a.precio as 'precio', a.categoria as 'categoria',a.stock as 'stock',a.Id_marca as 'idmarca',a.Id_modelo as 'idmodelo',c.nom_modelo as'nommodelo', b.nom_marca as 'nommarca',d.Nombre as 'nomcate' FROM productos a,marca b,modelo c,categoria d  WHERE a.Id_modelo = c.Id_modelo AND a.Id_marca = b.Id_marca AND a.categoria = 2 AND a.Categoria = d.Categoria_id";
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
     
    public Vector<Producto> Producto3(){
             Vector<Producto> vecPro=new Vector<Producto>();
             String sql="SELECT a.id as 'id',a.nombre as 'nom',a.descripción as 'desc',a.imagen as 'imagen',a.precio as 'precio', a.categoria as 'categoria',a.stock as 'stock',a.Id_marca as 'idmarca',a.Id_modelo as 'idmodelo',c.nom_modelo as'nommodelo', b.nom_marca as 'nommarca',d.Nombre as 'nomcate' FROM productos a,marca b,modelo c,categoria d  WHERE a.Id_modelo = c.Id_modelo AND a.Id_marca = b.Id_marca AND a.categoria = 3 AND a.Categoria = d.Categoria_id";
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
    
    public Vector<Producto> Producto4(){
             Vector<Producto> vecPro=new Vector<Producto>();
             String sql="SELECT a.id as 'id',a.nombre as 'nom',a.descripción as 'desc',a.imagen as 'imagen',a.precio as 'precio', a.categoria as 'categoria',a.stock as 'stock',a.Id_marca as 'idmarca',a.Id_modelo as 'idmodelo',c.nom_modelo as'nommodelo', b.nom_marca as 'nommarca',d.Nombre as 'nomcate' FROM productos a,marca b,modelo c,categoria d  WHERE a.Id_modelo = c.Id_modelo AND a.Id_marca = b.Id_marca AND a.categoria = 4 AND a.Categoria = d.Categoria_id";
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
    
    public Vector<Producto> Producto5(){
             Vector<Producto> vecPro=new Vector<Producto>();
             String sql="SELECT a.id as 'id',a.nombre as 'nom',a.descripción as 'desc',a.imagen as 'imagen',a.precio as 'precio', a.categoria as 'categoria',a.stock as 'stock',a.Id_marca as 'idmarca',a.Id_modelo as 'idmodelo',c.nom_modelo as'nommodelo', b.nom_marca as 'nommarca',d.Nombre as 'nomcate' FROM productos a,marca b,modelo c,categoria d  WHERE a.Id_modelo = c.Id_modelo AND a.Id_marca = b.Id_marca AND a.categoria = 5 AND a.Categoria = d.Categoria_id";
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
    
    public Vector<Producto> Producto6(){
             Vector<Producto> vecPro=new Vector<Producto>();
             String sql="SELECT a.id as 'id',a.nombre as 'nom',a.descripción as 'desc',a.imagen as 'imagen',a.precio as 'precio', a.categoria as 'categoria',a.stock as 'stock',a.Id_marca as 'idmarca',a.Id_modelo as 'idmodelo',c.nom_modelo as'nommodelo', b.nom_marca as 'nommarca',d.Nombre as 'nomcate' FROM productos a,marca b,modelo c,categoria d  WHERE a.Id_modelo = c.Id_modelo AND a.Id_marca = b.Id_marca AND a.categoria = 6 AND a.Categoria = d.Categoria_id";
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
    
    public Vector<Producto> Producto7(){
             Vector<Producto> vecPro=new Vector<Producto>();
             String sql="SELECT a.id as 'id',a.nombre as 'nom',a.descripción as 'desc',a.imagen as 'imagen',a.precio as 'precio', a.categoria as 'categoria',a.stock as 'stock',a.Id_marca as 'idmarca',a.Id_modelo as 'idmodelo',c.nom_modelo as'nommodelo', b.nom_marca as 'nommarca',d.Nombre as 'nomcate' FROM productos a,marca b,modelo c,categoria d  WHERE a.Id_modelo = c.Id_modelo AND a.Id_marca = b.Id_marca AND a.categoria = 7 AND a.Categoria = d.Categoria_id";
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
      
      
      
    public Vector<Producto> DetalleProducto(String modelo){
             Vector<Producto> vecPro=new Vector<Producto>();
             String sql="SELECT a.id as 'id',a.nombre as 'nom',a.descripción as 'desc',a.imagen as 'imagen',a.precio as 'precio',"
                     + " a.categoria as 'categoria',a.stock as 'stock',a.Id_marca as 'idmarca',a.Id_modelo as 'idmodelo',"
                     + "c.nom_modelo as'nommodelo', b.nom_marca as 'nommarca',d.Nombre as 'nomcate' FROM productos a,marca b,"
                     + "modelo c,categoria d  WHERE a.Id_modelo = c.Id_modelo AND a.Id_marca = b.Id_marca AND a.Categoria = d.Categoria_id "
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
    public Vector<ContenidoWeb> MostrarContenido(String id){
             Vector<ContenidoWeb> vecWeb=new Vector<ContenidoWeb>();
             String sql="SELECT * FROM contenido_web WHERE Id = '"+ id +"'";
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
                sql="SELECT a.id as 'id',a.nombre as 'nom',a.descripción as 'desc',a.imagen as 'imagen',a.precio as 'precio', a.categoria as 'categoria',a.stock as 'stock',a.Id_marca as 'idmarca',a.Id_modelo as 'idmodelo',c.nom_modelo as'nommodelo', b.nom_marca as 'nommarca',d.Nombre as 'nomcate' FROM productos a,marca b,modelo c,categoria d  WHERE a.Id_modelo = c.Id_modelo AND a.Id_modelo = '" + modelo + "' AND a.Id_marca = b.Id_marca AND a.Categoria = d.Categoria_id";
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
        String sql="SELECT a.imagen,a.nombre,b.Precio,b.Cantidad,b.SubTotal FROM productos a,detalle_venta b,usuario c WHERE a.id = b.Id_Producto AND a.precio = b.Precio AND c.Usuario = b.Cod_Usuario AND c.Usuario = '" + usuario +"'";
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

    
}
