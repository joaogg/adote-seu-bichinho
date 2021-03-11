<%-- 
    Document   : cadastrarUsuarios
    Created on : 02/01/2018, 14:18:43
    Author     : JoaoG
--%>

<%@page import="DAO.UsuariosDAO"%>
<%@page import="Model.Usuarios"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
            if (("" + request.getParameter("cadastrar")).compareTo("Cadastrar") == 0) {

                Usuarios usuario = new Usuarios();
                
                usuario.setNome(request.getParameter("nome"));
                usuario.setEmail(request.getParameter("email"));
                usuario.setSenha(request.getParameter("senha"));

                UsuariosDAO dao = null;
                dao = new UsuariosDAO();

                dao.cadastrarUsuarios(usuario);
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
    </head>
    
    <body>
        <c:import url="cabecalho.jsp" />
        
        </br>
        </br>
        
        <div class="container">
        <div class="col-md-4 col-md-offset-4">
            <div class="well" style="background: #FFFFFF; border-radius: 0px;">

                <div class="text-center" style="font-family: 'Pacifico', cursive; font-size: 23px; color: #13a89e;">
                    Adote seu Bichinho
                </div>
                </br>
                
            <form name="form" method="POST">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Digite seu Nome" name="nome">
                </div>   
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Digite seu E-mail" name="email">
                </div>   
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Digite sua Senha" name="senha">
                </div>   
                <button onClick="return submit_cadastrar()" name="cadastrar" value="Cadastrar" type="submit" class="btn btn-default" style="width: 100%;background-color:#13a89e;color:#ffffff;">Cadastrar</button>
            </form>

            </div>
        </div>
        </div>
                            <c:import url="rodape.jsp" />

    </body>
</html>