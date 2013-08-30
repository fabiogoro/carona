<%-- 
    Document   : index
    Created on : 15/08/2013, 17:46:02
    Author     : Fabio
--%>

<%@include file="logado.jspf"  %>
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
                    <li class="active"><a href="oferece_carona.jsp">Oferecer</a></li>
                    <li><a href="procura_carona.jsp">Procurar</a></li>
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
            <strong>Olá! Gostou da ideia?</strong> Nos dê sua opinião para podermos melhorar nosso trabalho! Responda essa <a href="#">pesquisa de opinião.</a>
        </div>


        <div class="body-content">
            <div class="col-lg-3"></div>
            <form action="CadastroOfertaCaronaServlet" class="form-horizontal col-lg-6" id="form" role="form">
                <div class="form-group">
                    <label class="sr-only" for="partida">Saindo de...</label>
                    <select name="origem" class="form-control" id="partida">
                        <option>Saindo de...</option>
                        <option>Barueri</option>
                        <option>Bauru</option>
                        <option>Campinas</option>
                        <option>Carapicuíba</option>
                        <option>Diadema</option>
                        <option>Embu</option>
                        <option>Franca</option>
                        <option>Guarujá</option>
                        <option>Guarulhos</option>
                        <option>Itaquaquecetuba</option>
                        <option>Jundiaí</option>
                        <option>Limeira</option>
                        <option>Marília</option>
                        <option>Mauá</option>
                        <option>Mogi das Cruzes</option>
                        <option>Osasco</option>
                        <option>Piracicaba</option>
                        <option>Praia Grande</option>
                        <option>Ribeirão Preto</option>
                        <option>Santo André</option>
                        <option>Santos</option>
                        <option>São Bernardo do Campo</option>
                        <option>São Carlos</option>
                        <option>São José do Rio Preto</option>
                        <option>São José dos Campos</option>
                        <option>São Paulo</option>
                        <option>São Vicente</option>
                        <option>Sorocaba</option>
                        <option>Sumaré</option>
                        <option>Suzano</option>
                        <option>Taboão da Serra</option>
                        <option>Taubaté</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="sr-only" for="destino">Indo para...</label>
                    <select name="destino" class="form-control" id="destino"  placeholder="Indo para...">
                        <option>Indo para...</option>
                        <option>Barueri</option>
                        <option>Bauru</option>
                        <option>Campinas</option>
                        <option>Carapicuíba</option>
                        <option>Diadema</option>
                        <option>Embu</option>
                        <option>Franca</option>
                        <option>Guarujá</option>
                        <option>Guarulhos</option>
                        <option>Itaquaquecetuba</option>
                        <option>Jundiaí</option>
                        <option>Limeira</option>
                        <option>Marília</option>
                        <option>Mauá</option>
                        <option>Mogi das Cruzes</option>
                        <option>Osasco</option>
                        <option>Piracicaba</option>
                        <option>Praia Grande</option>
                        <option>Ribeirão Preto</option>
                        <option>Santo André</option>
                        <option>Santos</option>
                        <option>São Bernardo do Campo</option>
                        <option>São Carlos</option>
                        <option>São José do Rio Preto</option>
                        <option>São José dos Campos</option>
                        <option>São Paulo</option>
                        <option>São Vicente</option>
                        <option>Sorocaba</option>
                        <option>Sumaré</option>
                        <option>Suzano</option>
                        <option>Taboão da Serra</option>
                        <option>Taubaté</option>
                    </select>
                </div>
                <div class="form-group">
                    <input name="data" type="text" class="form-control" placeholder="dd/mm/aaaa" id="datepicker">
                </div>
                <button type="submit" class="btn btn-success btn-lg pull-right" onclick="envia(); return false;">Oferecer Carona</button>
            </form>
            <div class="col-lg-3"></div>

        </div><!-- /.body-content -->

    </div> <!-- /container -->
    
    <div class="footer container">
        <p>&copy; Vai de Carona (Beta) 2013</p>
    </div>

    <script src="js/holder.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/facebook.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script>
        function envia(){
            if($('#partida option:selected').text()===$('#destino option:selected').text()){
                alert('Destino é igual à partida!');
            } else if($('#partida option:selected').text()==='Saindo de...'){
                alert('Escolha de onde está saindo.');
            } else if($('#destino option:selected').text()==='Indo para...'){
                alert('Escolha para onde está indo.');
            } else if(!/(0?[1-9]|[12][0-9]|3[01])\/(0?[1-9]|1[012])\/((19|20)\d\d)$/.test($('#datepicker').val())){
                alert('Data deve estar na forma dd/mm/aaaa.');
            } else {
                $('#form').submit(); 
            }
        }
        
        $(function() {
            $( "#datepicker" ).datepicker({ minDate: new Date(), dateFormat: "dd/mm/yy" });
        });
    </script>
  </body>
</html>