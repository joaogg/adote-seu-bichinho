<%-- 
    Document   : concluido
    Created on : 09/01/2018, 14:49:29
    Author     : JoaoG
--%>

<%@page import="Model.Usuarios"%>
<%@page import="DAO.UsuariosDAO"%>
<%@page import="Model.Animais"%>
<%@page import="DAO.AnimaisDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Bootstrap Example</title>
        <meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <body>
        <c:import url="cabecalho.jsp" />

        <div class="container text-center">
            <div class="col-md-8 col-md-offset-2">	
                <div class="well" style="background: #FFFFFF; border-radius: 0px;">                    

                    <div class="text-center" style="font-family: 'Pacifico', cursive; font-size: 30px; color: #13a89e; padding: 5px 5px 5px 5px;">
                        Pronto!
                    </div>


                    <%
                        if (request.getParameter("r") != null && !request.getParameter("r").equals("")) {

                            AnimaisDAO animal = new AnimaisDAO();
                            Animais a = animal.dadosDoAnimalPeloEncurtador(request.getParameter("r"));

                            UsuariosDAO user = new UsuariosDAO();
                            Usuarios usuario = user.dadosDoUsuarioPeloId(a.getId_usuario());

                    %>                    

                    </br>
                    <img src="http://cachorrosfofos.com.br/wp-content/uploads/2014/09/Fotos-do-cachorro-da-ra%C3%A7a-Pug26.jpg" width="200" class="img-circle">
                    </br></br>
                    </br>

                    <div class="text-center" style="font-family: 'Ubuntu', sans-serif; font-size: 14px;">
                        Compartilhe as informações do seu animalzinho nas redes sociais.</br>
                        A chance de encontrarmos um novo lar aumenta com sua divulgação.
                    </div>

                    </br>
                    <b>COMPARTILHE</b>
                    </br>
                    </br>                    

                    <div class="form-group">
                        <input type="text" class="form-control" value="http://localhost/Adocao/concluido.jsp?r=<%=a.getEncurtador()%>">
                    </div>

                    </br>

                    <img src="http://www.iconninja.com/files/578/771/791/facebook-media-social-like-network-fb-icon.png" width="70">

                    <img src="http://www.iconninja.com/files/402/956/969/instagram-insta-photo-social-media-camera-icon.png" width="70">

                    <img src="http://www.iconninja.com/files/622/575/801/twitter-bird-media-tweet-social-icon.png" width="70">

                    <img src="http://www.iconninja.com/files/1020/666/470/movie-youtube-media-play-video-online-social-icon.png" width="70">

                    <% }%>        
                </div>
            </div>

            <div class="col-md-8 col-md-offset-2">	
                <div class="well" style="background: #FFFFFF; border-radius: 0px;">
                    <table width="100%">
                        <tbody>
                            <tr>
                                <td width="30%">
                                    <div style="padding: 10px 10px 10px 10px">	
                                        <form method="POST" action="inicio.jsp">
                                            <br>
                                            <input type="submit" name="Perfil" value="Perfil" class="btn btn-success" style="width: 100%;">
                                        </form>
                                    </div>
                                </td>
                                <td width="30%">
                                    <div style="padding: 10px 10px 10px 10px">	
                                        <form method="POST" action="cadastrarAnimais.jsp">
                                            <br>
                                            <input type="submit" name="Cadastrar Novo Animal" value="Cadastrar Novo Animal" class="btn btn-danger" style="width: 100%;">
                                        </form>
                                    </div>
                                </td>
                                <td width="30%">	
                                    <div style="padding: 10px 10px 10px 10px">	
                                        <form method="POST" action="configuracao.jsp">
                                            <br>
                                            <input type="submit" name="Configurações" value="Configurações" class="btn btn-info" style="width: 100%;">
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>                    
                </div>
            </div>

        </div>        

        <c:import url="rodape.jsp" />
    </body>
</html>