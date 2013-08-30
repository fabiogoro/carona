<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Site de caronas feito por alunos da UFSCar Sorocaba">
        <meta name="author" content="Vai de Carona!">

        <title>Vai de Carona!</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="default.css" rel="stylesheet">
    </head>

    <body>
        <div id="fb-root"></div>
        <script src="js/holder.js"></script>
        <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="http://connect.facebook.net/en_US/all.js"></script>
        <script src="js/facebook.js"></script>
        <script>var logado = false;</script>

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
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="entrando.jsp">Entrar</a>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div>

            <!-- Jumbotron -->
            <div class="jumbotron">
                <h1>Vai viajar?</h1>
                <p class="lead">Procure sua carona com a gente! Carona é mais conforto, menos poluição e mais amizades!
                <br>O <b>Vai de Carona</b> é a forma mais pratica de encontrar e compartilhar sua carona!</p>
                <p><a class="btn btn-large btn-success" href="entrando.jsp">Comece já!</a></p>
            </div>


            <div class="body-content">

                <!-- Example row of columns -->
                <div class="row">
                    <div class="col-lg-4">
                        <h2>Mobile</h2>
                        <p>Garantimos uma boa experiência para o usuário, tanto no computador, quanto no celular! Faça o teste! Use seu celular!</p>
                    </div>
                    <div class="col-lg-4">
                        <h2>Facebook</h2>
                        <p>Veja o facebook de quem está oferecendo a carona! Assim é possível conhecer a pessoa com quem você vai pegar carona. </p>
                    </div>
                    <div class="col-lg-4">
                        <h2>Teste já!</h2>
                        <p>Veja como funciona, cadastre ou encontre sua carona. Nos dê sua opinião e nos ajude a construir um site da forma como você precisa.</p>
                    </div>
                </div>

            </div>

            <div class="footer">
                <p>&copy; Vai de Carona (Beta) 2013</p>
            </div>

        </div> <!-- /container -->
        
    </body>
</html>