<%-- 
    Document   : index
    Created on : 02/01/2018, 13:58:15
    Author     : JoaoG
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="DAO.UsuariosDAO"%>
<%@page import="Model.Usuarios"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    if (("" + request.getParameter("entrar")).compareTo("Entrar") == 0) {

        UsuariosDAO user = new UsuariosDAO();

        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        if (user.verificaLogin(email, senha)) {

            Usuarios usuario = user.criarSessaoPeloEmail("" + email + "");

            session.setAttribute("id", usuario.getId());
            response.sendRedirect("inicio.jsp");

        } else {

%>
<script>
    alert("E-mail ou Senha incorretos!");
</script> 
<%        }
    }
    if (("" + request.getParameter("cadastrar")).compareTo("Cadastrar") == 0) {

        UsuariosDAO user = new UsuariosDAO();

        if (request.getParameter("nome") != "") {
            if (request.getParameter("email") != "") {
                if (request.getParameter("senha") != "") {
                    if (!user.verificaEmailExiste(request.getParameter("email"))) {

                        Usuarios usuario = new Usuarios();
                        usuario.setNome(request.getParameter("nome"));
                        usuario.setEmail(request.getParameter("email"));
                        usuario.setSenha(request.getParameter("senha"));

                        UsuariosDAO dao = null;
                        dao = new UsuariosDAO();
                        dao.cadastrarUsuarios(usuario);
                        response.sendRedirect("index.jsp?mensagem=5");

                    } else {
                        response.sendRedirect("index.jsp?mensagem=1");
                    }
                } else {
                    response.sendRedirect("index.jsp?mensagem=3");
                }
            } else {
                response.sendRedirect("index.jsp?mensagem=4");
            }
        } else {
            response.sendRedirect("index.jsp?mensagem=2");
        }

    }
%>       
<html>
    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />        
    </head>

    <body>
        <c:import url="cabecalho.jsp" />


        <div class="container">
            <div class="col-md-4">
                <div class="well" style="background: #FFFFFF; border-radius: 0px;">

                    <div class="text-center" style="font-family: 'Pacifico', cursive; font-size: 23px; color: #13a89e;">
                        Login
                    </div>
                    </br>

                    <form method="POST">
                        <div class="form-group">
                            <input type="email" class="form-control" name="email" placeholder="E-mail">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" name="senha" placeholder="Senha">
                        </div>
                        <button name="entrar" value="Entrar" type="submit" class="btn btn-default" style="width: 100%;background-color:#13a89e;color:#ffffff;">Entrar</button>
                    </form>

                    </br>
                    <div class="text-center" style="font-size: 12px;padding-bottom: 12px;">
                        Esqueceu sua senha? <a href="/Adocao/#">Clique aqui</a>
                    </div>
                </div>
            </div>

            <div class="col-md-8">
                <div class="well" style="background: #FFFFFF; border-radius: 0px;">           
                    <div class="row">
                        <div class="col-md-12">
                            <div class="text-center" style="font-family: 'Pacifico', cursive; font-size: 23px; color: #13a89e;">
                                Cadastre-se
                            </div>
                            </br>
                            <%
                                if (request.getParameter("mensagem") != null && !request.getParameter("mensagem").equals("")) {
                                    switch (Integer.parseInt(request.getParameter("mensagem"))) {
                                        case 1:
                            %>
                            <div class="alert alert-danger">
                                <strong>Erro!</strong> E-mail já cadastrado!
                            </div>
                            <%
                                    break;

                                case 2:
                            %>
                            <div class="alert alert-danger">
                                <strong>Erro!</strong> Preencha o campo nome!
                            </div>
                            <%
                                    break;

                                case 3:
                            %>
                            <div class="alert alert-danger">
                                <strong>Erro!</strong> Preencha o campo senha!
                            </div>
                            <%
                                    break;

                                case 4:
                            %>
                            <div class="alert alert-danger">
                                <strong>Erro!</strong> Preencha o campo e-mail!
                            </div>
                            <%
                                    break;
                                case 5:
                            %>
                            <div class="alert alert-success">
                                <strong>Sucesso!</strong> Cadastro conluído, efetue seu Login!
                            </div>
                            <%
                                            break;

                                    }
                                }
                            %>                            
                        </div>

                        <div class="col-md-6 text-center">
                            <img src="https://image.freepik.com/icones-gratis/cao-esboco-patas_318-38096.jpg" width="150">
                        </div>
                        <div class="col-md-6">
                            <form name="form" method="POST">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Digite seu Nome" name="nome">
                                </div>   
                                <div class="form-group">
                                    <input type="email" class="form-control" placeholder="Digite seu E-mail" name="email">
                                </div>   
                                <div class="form-group">
                                    <input type="password" class="form-control" placeholder="Digite sua Senha" name="senha">
                                </div>   
                                <button onClick="return submit_cadastrar()" name="cadastrar" value="Cadastrar" type="submit" class="btn btn-default" style="width: 100%;background-color:#13a89e;color:#ffffff;">Cadastrar</button>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        </br></br> </br></br> 
        <div style="background-color: #FFFFFF; padding: 0px 25px 25px 25px;">
            <div class="container">

                <div class="col-md-4 text-center">
                    </br>
                    <div class="text-center" style="font-family: 'Pacifico', cursive; font-size: 20px; color: #13a89e;">
                        Adote seu bichinho?
                    </div> 
                    </br>
                    <div style="font-family: 'Ubuntu', sans-serif;">      
                        Cada vez mais, há cães abandonados por seus donos, ou inclusive por criadouros ou os que escapam dos canis.
                        O Adote o seu bichinho é uma maneira simplificada para você achar um lar para um animal abandonado.
                    </div>                 
                </div>                 

                <div class="col-md-4 text-center">
                    </br>
                    <div class="text-center" style="font-family: 'Pacifico', cursive; font-size: 20px; color: #13a89e;">
                        O que é?
                    </div>  
                    </br>
                    <div style="font-family: 'Ubuntu', sans-serif;">      
                        O Adote seu bichinho é uma plataforma para cadastro de fichas de animais para
                        compartilhamente. Facilitando o encontro de um novo dono.
                    </div>            
                </div>            

                <div class="col-md-4 text-center">
                    </br>
                    <div class="text-center" style="font-family: 'Pacifico', cursive; font-size: 20px; color: #13a89e;">
                        Como funciona?
                    </div>     
                    </br>
                    <div style="font-family: 'Ubuntu', sans-serif;">      
                        Você cria sua conta e cadastra os dados do animal à ser adotado, após isso é só compartilhar
                        o link para todo mundo que você conhece.
                    </div>                  
                </div>        
            </div>        
        </div>        


        </br></br>

        <div class="container text-center">
            <div class="col-md-4">
            </div>            
            <div class="col-md-1">
                <img src="http://www.iconninja.com/files/578/771/791/facebook-media-social-like-network-fb-icon.png" width="70">
            </div>

            <div class="col-md-1">
                <img src="http://www.iconninja.com/files/402/956/969/instagram-insta-photo-social-media-camera-icon.png" width="70">
            </div>      

            <div class="col-md-1">
                <img src="http://www.iconninja.com/files/622/575/801/twitter-bird-media-tweet-social-icon.png" width="70">
            </div>    

            <div class="col-md-1">
                <img src="http://www.iconninja.com/files/1020/666/470/movie-youtube-media-play-video-online-social-icon.png" width="70">
            </div>       
            <div class="col-md-4">
            </div>                       
        </div>
        
        </br></br>
        <c:import url="rodape.jsp" />

    </body>
</html>
