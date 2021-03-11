/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Usuarios;
import Util.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author JoaoG
 */
public class UsuariosDAO {
    private Connection connection;

    public UsuariosDAO() throws Exception {
        try{
            this.connection = ConnectionFactory.getConnection();
        }catch(Exception exception){
            throw new Exception(exception.getMessage());
        }    
    }

    public void cadastrarUsuarios(Usuarios usuario) {
        String sql = "INSERT INTO USUARIOS "+ "(NOME, EMAIL, SENHA)"+ " values (?,?,?)";

        try {

            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getSenha());

            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
   public Usuarios criarSessaoPeloEmail(String email) throws SQLException {        
        PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM USUARIOS WHERE EMAIL=?");    
        stmt.setString(1, email);
        ResultSet rs = stmt.executeQuery();
            Usuarios usuario = new Usuarios();
        
        while (rs.next()) {
            usuario.setEmail(rs.getString("email"));            
            usuario.setId(rs.getInt("id"));
            usuario.setNome(rs.getString("nome"));
            usuario.setSenha(rs.getString("senha"));        
        }
        rs.close();
        stmt.close();
        return usuario;    
    }     
    
   public Usuarios dadosDoUsuarioPeloId(int id) throws SQLException {        
        PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM USUARIOS WHERE ID=?");    
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
            Usuarios usuario = new Usuarios();
        
        while (rs.next()) {
            usuario.setId(rs.getInt("id"));
            usuario.setEmail(rs.getString("email"));            
            usuario.setNome(rs.getString("nome"));
            usuario.setSenha(rs.getString("senha"));
            usuario.setRua(rs.getString("rua"));
            usuario.setBairro(rs.getString("bairro"));
            usuario.setCidade(rs.getString("cidade"));
            usuario.setEstado(rs.getString("estado"));
            usuario.setNumero(rs.getString("numero"));
            usuario.setTelefone(rs.getString("telefone"));
        }
        rs.close();
        stmt.close();
        return usuario;    
    }       
   
   public boolean verificaLogin(String email, String senha) throws SQLException {     
        boolean result;
        PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM USUARIOS WHERE EMAIL=? AND SENHA=?");    
        stmt.setString(1, email);
        stmt.setString(2, senha);
        ResultSet rs = stmt.executeQuery();
       
        Usuarios usuario = new Usuarios();
        
        result = false;
        
        while (rs.next()) {
            result = true;
        }
        
        rs.close();
        stmt.close();
        return result;    
    }  
   
   public boolean verificaEmailExiste(String email) throws SQLException {     
        boolean result;
        PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM USUARIOS WHERE EMAIL=?");    
        stmt.setString(1, email);
        ResultSet rs = stmt.executeQuery();
        
        Usuarios usuario = new Usuarios();
        
        result = false;
        
        while (rs.next()) {
            result = true;
        }
        
        rs.close();
        stmt.close();
        return result;    
    }      
   
    public void alterarDadosUsuario(Usuarios usuario) {
        String sql = "UPDATE USUARIOS SET NOME=?, EMAIL=?, RUA=?, BAIRRO=?, CIDADE=?, ESTADO=?, NUMERO=?, TELEFONE=? "
                + " WHERE ID=?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getRua());            
            stmt.setString(4, usuario.getBairro());            
            stmt.setString(5, usuario.getCidade());            
            stmt.setString(6, usuario.getEstado());            
            stmt.setString(7, usuario.getNumero());            
            stmt.setString(8, usuario.getTelefone());            
            stmt.setInt(9, usuario.getId());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }   
   
   
}
