<%-- 
    Document   : cadastrarAnimais
    Created on : 05/01/2018, 16:34:29
    Author     : JoaoG
--%>

<%@page import="Model.Animais"%>
<%@page import="DAO.AnimaisDAO"%>
<%@page import="java.util.Random"%>
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
    <%
        if (("" + request.getParameter("cadastrar")).compareTo("Cadastrar") == 0) {

            String tipo = request.getParameter("tipo");
            String nome = request.getParameter("nome");
            String porte = request.getParameter("porte");
            String pelagem = request.getParameter("pelagem");
            String informacoes = request.getParameter("informacoes");

            if (request.getParameter("tipo") != "") {
                if (request.getParameter("nome") != "") {
                    if (request.getParameter("pelagem") != "") {
                        if (request.getParameter("informacoes") != "") {

                            Animais animal = new Animais();

                            Random rand = new Random();
                            int random = rand.nextInt(90000) + 10000;

                            String encurtador = request.getParameter("tipo") + " " + request.getParameter("nome") + " "
                                    + request.getParameter("porte") + " " + request.getParameter("pelagem") + " "
                                    + random;

                            encurtador = encurtador.toLowerCase();
                            encurtador = encurtador.replaceAll("[^a-zZ-Z1-9 ]", "");
                            encurtador = encurtador.replace(" ", "-");

                            animal.setId_usuario(Integer.parseInt(""+session.getAttribute("id")));
                            animal.setEncurtador(encurtador);
                            animal.setTipo(request.getParameter("tipo"));
                            animal.setNome(request.getParameter("nome"));
                            animal.setPorte(request.getParameter("porte"));
                            animal.setPelagem(request.getParameter("pelagem"));
                            animal.setInformacoes(request.getParameter("informacoes"));
                            animal.setSituacao("ABERTA");

                            AnimaisDAO dao = null;
                            dao = new AnimaisDAO();
                            dao.cadastrarAnimais(animal);
                            response.sendRedirect("concluido.jsp?r="+encurtador+"");

                        } else {
                            response.sendRedirect("cadastrarAnimais.jsp?mensagem=1");
                        }
                    } else {
                        response.sendRedirect("cadastrarAnimais.jsp?mensagem=2");
                    }
                } else {
                    response.sendRedirect("cadastrarAnimais.jsp?mensagem=3");
                }
            } else {
                response.sendRedirect("cadastrarAnimais.jsp?mensagem=4");
            }

        }

    %>
    <body>
        <c:import url="cabecalho.jsp" />

        <div class="container">
            <div class="col-md-12">	
                <div class="well" style="background: #FFFFFF; border-radius: 0px;">                    
                    <%                                if (request.getParameter("mensagem") != null && !request.getParameter("mensagem").equals("")) {
                            switch (Integer.parseInt(request.getParameter("mensagem"))) {
                                case 1:
                    %>
                    <div class="alert alert-danger">
                        <strong>Erro!</strong> Preencha o campo informações!
                    </div>
                    <%
                            break;

                        case 2:
                    %>
                    <div class="alert alert-danger">
                        <strong>Erro!</strong> Preencha o campo pelagem!
                    </div>
                    <%
                            break;

                        case 3:
                    %>
                    <div class="alert alert-danger">
                        <strong>Erro!</strong> Preencha o campo nome!
                    </div>
                    <%
                            break;

                        case 4:
                    %>
                    <div class="alert alert-danger">
                        <strong>Erro!</strong> Preencha o campo tipo!
                    </div>
                    <%
                            break;
                        case 5:
                    %>
                    <div class="alert alert-success">
                        <strong>Sucesso!</strong> Cadastro do animal concluído!
                    </div>
                    <%
                                    break;

                            }
                        }
                    %>  
                    <form name="form" method="POST" accept-charset="ISO-8859-1">
                        <div class="form-group">
                            <div style="font-family: 'Ubuntu', sans-serif;"> 
                                Tipo:
                            </div>
                            <input type="text" class="form-control" placeholder="Tipo de animal: Cachorro, Gato, Pássaro." name="tipo">
                        </div>   
                        <div class="form-group">
                            <div style="font-family: 'Ubuntu', sans-serif;"> 
                                Nome:
                            </div>
                            <input type="text" class="form-control" placeholder="Nome do animal: Vira-Lata, Buldog, Loro." name="nome">
                        </div>   
                        <div class="form-group">
                            <div style="font-family: 'Ubuntu', sans-serif;"> 
                                Porte:
                            </div>
                            <select class="form-control" name="porte">
                                <option value="Pequeno">Pequeno</option>	
                                <option value="Medio">Médio</option>
                                <option value="Grande">Grande</option>
                            </select>
                        </div>   
                        <div class="form-group">
                            <div style="font-family: 'Ubuntu', sans-serif;"> 
                                Características da Pelagem:
                            </div>
                            <input type="text" class="form-control" placeholder="Pelagem: Marrom com algumas manchas pretas" name="pelagem">
                        </div>                          
                        <div class="form-group">
                            <div style="font-family: 'Ubuntu', sans-serif;"> 
                                Mais Informações:
                            </div>
                            <textarea class="form-control" rows="5" id="informacoes" name="informacoes"></textarea>
                        </div>    
                        <button onClick="return submit_cadastrar()" name="cadastrar" value="Cadastrar" type="submit" class="btn btn-default" style="width: 100%;background-color:#13a89e;color:#ffffff;">Cadastrar Animal</button>                   
                    </form>


                </div>
            </div>
        </div>        

        <c:import url="rodape.jsp" />
    </body>
</html>