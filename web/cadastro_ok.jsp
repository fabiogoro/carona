<%@page import="model.OfertaCarona"%>
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
                    <a class="navbar-brand" href="#">Vai de Carona!</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Cadastro <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li class="col-lg-12">
                                    <form action="CadastroOfertaCaronaServlet" role="form">
                                        <div class="form-group">
                                            <label class="sr-only" for="partida">Saindo de...</label>
                                            <select name="origem" class="form-control" id="partida">
                                                <option>Saindo de...</option>
                                                <option>São Paulo</option>
                                                <option>Sorocaba</option>
                                                <option>Campinas</option>
                                                <option>São Carlos</option>
                                                <option>Bauru</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label class="sr-only" for="destino">Indo para...</label>
                                            <select name="destino" class="form-control" id="destino"  placeholder="Indo para...">
                                                <option>Indo para...</option>
                                                <option>Sorocaba</option>
                                                <option>Campinas</option>
                                                <option>São Carlos</option>
                                                <option>Bauru</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <input name="data" type="date" class="form-control" placeholder="Search">
                                        </div>
                                        <input type="hidden" name="idUser" id="idUser1">
                                        <button type="submit" class="btn btn-success">Submit</button>
                                    </form>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Busca <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li class="col-lg-12">
                                    <form action="BuscaCaronaServlet" role="form">
                                        <div class="form-group">
                                            <label class="sr-only" for="partida">Saindo de...</label>
                                            <select class="form-control" id="partida">
                                                <option>Saindo de...</option>
                                                <option>São Paulo</option>
                                                <option>Sorocaba</option>
                                                <option>Campinas</option>
                                                <option>São Carlos</option>
                                                <option>Bauru</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label class="sr-only" for="destino">Indo para...</label>
                                            <select class="form-control" id="destino"  placeholder="Indo para...">
                                                <option>Indo para...</option>
                                                <option>Sorocaba</option>
                                                <option>Campinas</option>
                                                <option>São Carlos</option>
                                                <option>Bauru</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <input type="date" class="form-control" placeholder="Search">
                                        </div>
                                        <button type="submit" class="btn btn-success">Submit</button>
                                    </form>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Bem-vindo, <b id="logged-user">Usuário</b> <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="index.jsp" onclick="logout();">Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div>

            <div class="alert alert-info">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <strong>Olá! Para onde você vai?</strong> Utilize o menu acima, ou procure nos seu favorito aqui em baixo!
            </div>


            <div class="body-content">
                <div class="row">
                    <div class="col-lg-12">

                        <h2>Cadastro efetuado!</h2>
                        <%
                            OfertaCarona c = (OfertaCarona) request.getAttribute("carona");
                        %>
                        <p>Você cadastrou uma carona para o dia <b><%=c.getData()%> </b>, saindo de <%=c.getOrigem()%>, indo para <%=c.getDestino()%></p>
                    </div>
                </div>

            </div><!-- /.body-content -->

            <!-- Site footer -->
            <div class="footer">
                <p>&copy; Vai de Carona 2013</p>
            </div>

        </div> <!-- /container -->

        <script src="js/holder.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/facebook.js"></script>
    </body>
</html>