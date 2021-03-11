<%-- 
    Document   : inicio
    Created on : 05/01/2018, 13:00:04
    Author     : JoaoG
--%>

<%@page import="java.util.List"%>
<%@page import="Model.Animais"%>
<%@page import="DAO.AnimaisDAO"%>
<%@page import="Model.Usuarios"%>
<%@page import="DAO.UsuariosDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:import url="cabecalho.jsp" />

        <div class="container">

            <div class="col-md-6">
                <div class="well" style="background: #FFFFFF; border-radius: 0px;">        

                    <%
                        UsuariosDAO user = new UsuariosDAO();
                        Usuarios usuario = user.dadosDoUsuarioPeloId(Integer.parseInt("" + session.getAttribute("id")));
                    %>      

                    <div class="text-center" style="font-family: 'Ubuntu', sans-serif; font-size: 19px;">
                        <img src="http://tudosobrecachorros.com.br/wp-content/uploads/fila-brasileiro-cachorro.png" width="150" class="img-circle">
                        </br>
                        </br>
                        <%=usuario.getNome()%>
                    </div>


                    </br></br>
                    <a href="cadastrarAnimais.jsp">                        
                        <button name="entrar" value="Entrar" type="submit" class="btn btn-default" style="width: 100%;background-color:#13a89e;color:#ffffff;">Cadastrar Animal</button>
                    </a>
                    <div style="padding-bottom: 5px;"></div>

                    <a href="#">                        
                        <button name="entrar" value="Entrar" type="submit" class="btn btn-default" style="width: 100%;background-color:#13a89e;color:#ffffff;">Linha do Tempo</button>
                    </a>


                </div>
            </div>

            <div class="col-md-6">
                <div class="well" style="background: #FFFFFF; border-radius: 0px;">  
                    <div class="text-center" style="font-family: 'Ubuntu', sans-serif; font-size: 19px;">
                        <img src="http://biodog.com.br/wp-content/uploads/biodog-cachorro-adotado.jpg" width="150" class="img-circle">
                        </br>
                        </br>
                        <%=usuario.getNome()%>
                    </div>


                    </br></br>
                    <a href="configuracao.jsp">                        
                        <button name="entrar" value="Entrar" type="submit" class="btn btn-default" style="width: 100%;background-color:#13a89e;color:#ffffff;">Alterar Perfil</button>
                    </a>
                    <div style="padding-bottom: 5px;"></div>
                    <a href="deslogar.jsp">                        
                        <button name="entrar" value="Entrar" type="submit" class="btn btn-default" style="width: 100%;background-color:#b96765;color:#ffffff;">Deslogar</button>
                    </a>                    


                </div>
            </div>

        </div>

        <div class="container">

            <%

                AnimaisDAO dao = new AnimaisDAO();
                List<Animais> animais = dao.getLista(5);

                for (Animais animal : animais) {

            %> 
            <div class="col-md-4">
                <div class="well" style="background: #FFFFFF; border-radius: 0px;">   
                    <div class="text-center" style="font-family: 'Ubuntu', sans-serif; font-size: 14px;">
                        <%=String.format("%.160s", animal.getInformacoes())%> ...
                    </div>
                    </br>
                    <a href="http://localhost/Adocao/animalzinho.jsp?r=<%=animal.getEncurtador()%>">                        
                        <button name="entrar" value="Entrar" type="submit" class="btn btn-default" style="width: 100%;background-color:#13a89e;color:#ffffff;">Alterar Perfil</button>
                    </a>
                </div>
            </div>                    
            <% }%>

        </div>



        <c:import url="rodape.jsp" />

    </body>
</html>
