<%@include file="logado.jspf"  %>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Vai de Carona!</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="default.css" rel="stylesheet">

        <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    </head>

    <body>
        <div id="fb-root"></div>
        <script>var logado = true;</script>

        <div class="container">

            <div class="navbar" role="navigation">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index_logged.jsp">Vai de Carona!</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="oferece_carona.jsp">Oferecer</a></li>
                        <li class="active"><a href="procura_carona.jsp">Procurar</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                Bem-vindo, <b id="logged-user"><%=u.getNome()%></b> <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="index.jsp" onclick="logout();">Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div>

            <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <strong>Olá! Gostou da ideia?</strong> Nos dê sua opinião para podermos melhorar nosso trabalho! 
                Responda essa <a href="https://docs.google.com/forms/d/1O1JdqLhtbSDs3DTBRLqIFtpeU0Z2AQOKoOIJrr5-ok8/viewform">pesquisa de opinião.</a>
            </div>


            <div class="body-content">
                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-6">

                       <h2> <%=request.getParameter("origem") %> - <%=request.getParameter("destino")%> (<%=request.getParameter("data") %>)</h2>
                        <%
                            List<Usuario> listaUsuario = (List<Usuario>) request.getAttribute("usuarios");
                            if(listaUsuario!=null){
                                Iterator<Usuario> i = listaUsuario.iterator();
                                while(i.hasNext()){
                                    Usuario user = i.next();

                        %>
                        <p>O usuário <b><%=user.getNome()%> </b> oferece uma carona. <a class="btn btn-xs btn-default" href="<%=user.getLink()%>">Ver facebook &raquo;</a></p>
                        <% }} else { %>
                            <p>Nenhum resultado encontrado!</p>
                        <% } %>
                    </div>
                    <div class="col-lg-3"></div>
                </div>

            </div><!-- /.body-content -->

        </div>
                    
        <div class="footer container">
            <p>&copy; Vai de Carona (Beta) 2013</p>
        </div>

        <script src="js/holder.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/facebook.js"></script>
    </body>
</html>