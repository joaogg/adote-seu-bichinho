<%-- 
    Document   : animalzinho
    Created on : 05/01/2018, 15:02:56
    Author     : JoaoG
--%>

<%@page import="Model.Usuarios"%>
<%@page import="DAO.UsuariosDAO"%>
<%@page import="Model.Animais"%>
<%@page import="DAO.AnimaisDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    </head>

    <body>
        <c:import url="cabecalho.jsp" />

        <%
            if (request.getParameter("r") != null && !request.getParameter("r").equals("")) {

                AnimaisDAO animal = new AnimaisDAO();
                Animais a = animal.dadosDoAnimalPeloEncurtador(request.getParameter("r"));
                
                UsuariosDAO user = new UsuariosDAO();
                Usuarios usuario = user.dadosDoUsuarioPeloId(a.getId_usuario());

        %>
<%=String.format("%.5s", "asdasdasdasdasdasdas asda sda sdasda sadasdasd")%>
        <div class="container">
            <div class="col-md-12">	
                <div class="well" style="background: #FFFFFF; border-radius: 0px;">                    

                    <div class="text-center">
                        <h4>
                            <span class="label label-default" style="width: 100%;background-color:#13a89e;color:#ffffff;">
                                <%=a.getSituacao()%>
                            </span>                    
                        </h4>
                        </br>
                        <img src="http://cachorrosfofos.com.br/wp-content/uploads/2014/09/Fotos-do-cachorro-da-ra%C3%A7a-Pug26.jpg" width="200" class="img-circle">
                        </br></br>

                        <div class="text-center" style="font-family: 'Ubuntu', sans-serif; font-size: 23px;">
                            <%=a.getTipo()%> <%=a.getNome()%>
                        </div>
                        </br>
                        <center>
                            <div style="font-family: 'Ubuntu', sans-serif; font-size: 12px; width:60%;">                    
                                <b>PELAGEM:</b> <%=a.getPelagem()%>
                            </div>   
                            <div style="font-family: 'Ubuntu', sans-serif; font-size: 12px; width:60%;">                    
                                <b>PORTE:</b> <%=a.getPorte()%>
                            </div>                               
                            </br>
                            <div style="font-family: 'Ubuntu', sans-serif; font-size: 12px; width:60%;">                    
                                <%=a.getInformacoes()%>
                            </div>     
                        </center>
                        <hr>
                        <b>CONTATO</b>
                        </br>
                        </br>
                        <b>Rua</b> <%=usuario.getRua()%>
                        <b>Nº</b> <%=usuario.getNumero()%>
                        </br>
                        <b>Bairro</b> <%=usuario.getBairro()%>
                        </br>
                        <%=usuario.getCidade()%> - <%=usuario.getEstado()%>
                        </br></br>
                        <b>Telefone:</b> <%=usuario.getTelefone()%>
                        <hr>

                        <b>COMPARTILHE</b>
                        </br>
                        </br>

                        <img src="http://www.iconninja.com/files/578/771/791/facebook-media-social-like-network-fb-icon.png" width="70">

                        <img src="http://www.iconninja.com/files/402/956/969/instagram-insta-photo-social-media-camera-icon.png" width="70">

                        <img src="http://www.iconninja.com/files/622/575/801/twitter-bird-media-tweet-social-icon.png" width="70">

                        <img src="http://www.iconninja.com/files/1020/666/470/movie-youtube-media-play-video-online-social-icon.png" width="70">

                    </div> 

                    </br></br></br>                    
                    <div id="fb-root"></div>
                    <script>(function (d, s, id) {
                            var js, fjs = d.getElementsByTagName(s)[0];
                            if (d.getElementById(id))
                                return;
                            js = d.createElement(s);
                            js.id = id;
                            js.src = 'https://connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.11&appId=1368304056549736';
                            fjs.parentNode.insertBefore(js, fjs);
                        }(document, 'script', 'facebook-jssdk'));</script>
                    <div class="fb-comments" data-href="http://localhost/Adocao/animalzinho.jsp" data-numposts="5" width="100%"></div>

                </div>
            </div>
        </div>        
        <% }%>
        <c:import url="rodape.jsp" />
    </body>
</html>