<%-- 
    Document   : configuracao
    Created on : 09/01/2018, 16:07:03
    Author     : JoaoG
--%>

<%@page import="Model.Usuarios"%>
<%@page import="DAO.UsuariosDAO"%>
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
        <%
            UsuariosDAO user = new UsuariosDAO();
            Usuarios usuario = user.dadosDoUsuarioPeloId(Integer.parseInt("" + session.getAttribute("id")));

            if (("" + request.getParameter("cadastrar")).compareTo("Cadastrar") == 0) {

                String nome = request.getParameter("nome");
                String email = request.getParameter("email");
                String rua = request.getParameter("rua");
                String bairro = request.getParameter("bairro");
                String cidade = request.getParameter("cidade");
                String estado = request.getParameter("estado");
                String numero = request.getParameter("numero");
                String telefone = request.getParameter("telefone");

                if (request.getParameter("nome") != "") {
                    if (request.getParameter("email") != "") {
                        if (request.getParameter("rua") != "") {
                            if (request.getParameter("bairro") != "") {
                                if (request.getParameter("cidade") != "") {
                                    if (request.getParameter("numero") != "") {
                                        if (request.getParameter("telefone") != "") {

                                            Usuarios us = new Usuarios();

                                            us.setId(Integer.parseInt("" + session.getAttribute("id")));

                                            UsuariosDAO dao = null;
                                            dao = new UsuariosDAO();
                                            dao.alterarDadosUsuario(usuario);
                                            response.sendRedirect("configuracao.jsp?mensagem=8");

                                        } else {
                                            response.sendRedirect("configuracao.jsp?mensagem=7");
                                        }
                                    } else {
                                        response.sendRedirect("configuracao.jsp?mensagem=6");
                                    }
                                } else {
                                    response.sendRedirect("configuracao.jsp?mensagem=5");
                                }
                            } else {
                                response.sendRedirect("configuracao.jsp?mensagem=4");
                            }
                        } else {
                            response.sendRedirect("configuracao.jsp?mensagem=3");
                        }
                    } else {
                        response.sendRedirect("configuracao.jsp?mensagem=2");
                    }
                } else {
                    response.sendRedirect("configuracao.jsp?mensagem=1");
                }

            }
        %>      
    </head>
    <body>
        <c:import url="cabecalho.jsp" />

        <div class="container">
            <div class="col-md-12">	
                <div class="well" style="background: #FFFFFF; border-radius: 0px;">  
                    <%                               
                        if (request.getParameter("mensagem") != null && !request.getParameter("mensagem").equals("")) {
                            switch (Integer.parseInt(request.getParameter("mensagem"))) {
                                case 1:
                    %>
                    <div class="alert alert-danger">
                        <strong>Erro!</strong> Preencha o campo Nome!
                    </div>
                    <%
                            break;

                        case 2:
                    %>
                    <div class="alert alert-danger">
                        <strong>Erro!</strong> Preencha o campo E-mail!
                    </div>
                    <%
                            break;

                        case 3:
                    %>
                    <div class="alert alert-danger">
                        <strong>Erro!</strong> Preencha o campo Rua!
                    </div>
                    <%
                            break;

                        case 4:
                    %>
                    <div class="alert alert-danger">
                        <strong>Erro!</strong> Preencha o campo Bairro!
                    </div>
                    <%
                            break;

                        case 5:
                    %>
                    <div class="alert alert-danger">
                        <strong>Erro!</strong> Preencha o campo Cidade!
                    </div>                    
                    <%
                            break;

                        case 6:
                    %>
                    <div class="alert alert-danger">
                        <strong>Erro!</strong> Preencha o campo Número!
                    </div>            
                    <%
                            break;

                        case 7:
                    %>
                    <div class="alert alert-danger">
                        <strong>Erro!</strong> Preencha o campo Telefone!
                    </div>                    
                    <%
                            break;
                        case 8:
                    %>
                    <div class="alert alert-success">
                        <strong>Sucesso!</strong> Concluído!
                    </div>
                    <%
                                    break;

                            }
                        }
                    %>  
                    <form name="form" method="POST" accept-charset="ISO-8859-1">

                        <div class="form-group">
                            <div style="font-family: 'Ubuntu', sans-serif;"> 
                                Nome:
                            </div>
                            <input type="text" class="form-control" value="<%=usuario.getNome()%>" name="nome">
                        </div>   

                        <div class="form-group">
                            <div style="font-family: 'Ubuntu', sans-serif;"> 
                                E-mail:
                            </div>
                            <input type="text" class="form-control" value="<%=usuario.getEmail()%>" name="email">
                        </div>   

                        <table width="100%">
                            <tbody>
                                <tr>
                                    <td width="40%">                        

                                        <div class="form-group" style="padding: 5px 5px 5px 5px"">
                                            <div style="font-family: 'Ubuntu', sans-serif;"> 
                                                Rua:
                                            </div>
                                            <input type="text" class="form-control" value="<%=usuario.getRua()%>" name="rua">
                                        </div>    
                                    </td>
                                    <td width="20%">                        

                                        <div class="form-group" style="padding: 5px 5px 5px 5px">
                                            <div style="font-family: 'Ubuntu', sans-serif;"> 
                                                Bairro:
                                            </div>
                                            <input type="text" class="form-control" value="<%=usuario.getBairro()%>" name="bairro">
                                        </div>    
                                    </td>
                                    <td width="15%">                        

                                        <div class="form-group" style="padding: 5px 5px 5px 5px">
                                            <div style="font-family: 'Ubuntu', sans-serif;"> 
                                                Cidade:
                                            </div>
                                            <input type="text" class="form-control" value="<%=usuario.getCidade()%>" name="cidade">
                                        </div>    
                                    </td>
                                    <td width="8%"> 
                                        <div class="form-group" style="padding: 5px 5px 5px 5px">
                                            <div style="font-family: 'Ubuntu', sans-serif;"> 
                                                Estado:
                                            </div>
                                            <select class="form-control" name="estado"/>
                                            <option value="AC">AC</option>
                                            <option value="AL">AL</option>
                                            <option value="AP">AP</option>
                                            <option value="AM">AM</option>
                                            <option value="BA">BA</option>
                                            <option value="CE">CE</option>
                                            <option value="DF">DF</option>
                                            <option value="GO">GO</option>
                                            <option value="ES">ES</option>
                                            <option value="MA">MA</option>
                                            <option value="MT">MT</option>
                                            <option value="MS">MS</option>
                                            <option value="MG">MG</option>
                                            <option value="PA">PA</option>
                                            <option value="PB">PB</option>
                                            <option value="PR">PR</option>
                                            <option value="PE">PE</option>
                                            <option value="PI">PI</option>
                                            <option value="RJ">RJ</option>
                                            <option value="RN">RN</option>
                                            <option value="RS">RS</option>
                                            <option value="RO">RO</option>
                                            <option value="RR">RR</option>
                                            <option value="SP">SP</option>
                                            <option value="SC">SC</option>
                                            <option value="SE">SE</option>
                                            <option value="TO">TO</option>
                                            </select>
                                        </div>    
                                    </td>
                                <tr> 
                            </tbody>
                        </table>


                        <div class="form-group">
                            <div style="font-family: 'Ubuntu', sans-serif;"> 
                                Número:
                            </div>
                            <input type="text" class="form-control" value="<%=usuario.getNumero()%>" name="numero">
                        </div>    

                        <div class="form-group">
                            <div style="font-family: 'Ubuntu', sans-serif;"> 
                                Telefone:
                            </div>
                            <input type="text" class="form-control" value="<%=usuario.getTelefone()%>" name="telefone">
                        </div>    

                        <button onClick="return submit_cadastrar()" name="cadastrar" value="Cadastrar" type="submit" class="btn btn-default" style="width: 100%;background-color:#13a89e;color:#ffffff;">Salvar Dados</button>                   
                    </form>                    
                    <table width="100%">
                        <tbody>
                            <tr>
                                <td width="30%">
                                    <div style="padding: 10px 10px 10px 0px">	
                                        <form method="POST" action="inicio.jsp">
                                            <br>
                                            <input type="submit" name="Perfil" value="Perfil" class="btn btn-success" style="width: 100%;">
                                        </form>
                                    </div>
                                </td>
                                <td width="30%">
                                    <div style="padding: 10px 0px 10px 10px">	
                                        <form method="POST" action="cadastrarAnimais.jsp">
                                            <br>
                                            <input type="submit" name="Cadastrar Animal" value="Cadastrar Animal" class="btn btn-danger" style="width: 100%;">
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