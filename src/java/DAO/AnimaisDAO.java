/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Animais;
import Util.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author JoaoG
 */
public class AnimaisDAO {
    private Connection connection;

    public AnimaisDAO() throws Exception {
        try{
            this.connection = ConnectionFactory.getConnection();
        }catch(Exception exception){
            throw new Exception(exception.getMessage());
        }       
    }    
    
    public void cadastrarAnimais(Animais animais) {
        String sql = "INSERT INTO ANIMAIS "+ "(ENCURTADOR, TIPO, NOME, PORTE, PELAGEM, INFORMACOES, SITUACAO, ID_USUARIO)" 
                + " values (?,?,?,?,?,?,?,?)";

        try {

            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setString(1, animais.getEncurtador());
            stmt.setString(2, animais.getTipo());
            stmt.setString(3, animais.getNome());
            stmt.setString(4, animais.getPorte());
            stmt.setString(5, animais.getPelagem());
            stmt.setString(6, animais.getInformacoes());
            stmt.setString(7, animais.getSituacao());
            stmt.setInt(8, animais.getId_usuario());
                        
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    } 
    
   public Animais dadosDoAnimalPeloEncurtador(String encurtador) throws SQLException {        
        PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM ANIMAIS WHERE ENCURTADOR=?");    
        stmt.setString(1, encurtador);
        ResultSet rs = stmt.executeQuery();
            Animais animal = new Animais();
        
        while (rs.next()) {
            animal.setId(rs.getInt("id"));            
            animal.setId_usuario(rs.getInt("id_usuario"));            
            animal.setEncurtador(rs.getString("encurtador"));            
            animal.setTipo(rs.getString("tipo"));            
            animal.setNome(rs.getString("nome"));            
            animal.setPorte(rs.getString("porte"));            
            animal.setPelagem(rs.getString("pelagem"));            
            animal.setInformacoes(rs.getString("informacoes"));            
            animal.setSituacao(rs.getString("situacao"));            
        }
        rs.close();
        stmt.close();
        return animal;    
    }    
   
    public List<Animais> getLista(int r) {
        try {
            List<Animais> animais = new ArrayList<Animais>();
            PreparedStatement stmt = this.connection.
                    prepareStatement("SELECT * FROM ANIMAIS WHERE ID_USUARIO=? ORDER BY ID_USUARIO ASC");
            stmt.setInt(1, r);

            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                // criando o objeto Contato
                Animais animal = new Animais();
                animal.setEncurtador(rs.getString("encurtador"));               
                animal.setTipo(rs.getString("tipo"));               
                animal.setNome(rs.getString("nome"));               
                animal.setPorte(rs.getString("porte"));               
                animal.setPelagem(rs.getString("pelagem"));               
                animal.setInformacoes(rs.getString("informacoes"));               
                animal.setSituacao(rs.getString("situacao"));               

                // adicionando o objeto à lista
                animais.add(animal);
            }
            rs.close();
            stmt.close();
            return animais;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    } 
   
   
}
