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
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Busca <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li class="col-lg-12">
                                    <form class="" role="form">
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
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Login <b class="caret"></b></a>
                            <div class="dropdown-menu">
                                <div role="presentation" class="dropdown-header">Entre com Facebook</div>
                                <div class="fb-login-button" size="large" data-show-faces="false" data-width="200" data-max-rows="1">
                                </div>

                                <div class="divider"></div>
                                <div role="presentation" class="dropdown-header">Ou com seus dados</div>
                                <form role="form">
                                    <div class="form-group col-lg-11">
                                        <label class="sr-only" for="usuario">Usuário</label>
                                        <input type="text" class="form-control" id="usuario" placeholder="Usuário">
                                    </div>
                                    <div class="form-group col-lg-11">
                                        <label class="sr-only" for="senha">Senha</label>
                                        <input type="password" class="form-control" id="senha" placeholder="Senha">
                                    </div>
                                    <div class="form-group col-lg-11">
                                        <button type="submit" class="btn btn-success">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div>

            <!-- Jumbotron -->
            <div class="jumbotron">
                <h1>Vai viajar?</h1>
                <p class="lead">Procure sua carona com a gente! Carona é mais conforto, menos poluição e mais amizades!
                <br>O <b>Vai de Carona</b> é a forma mais pratica de encontrar e compartilhar sua carona!</p>
                <p><a class="btn btn-large btn-success" href="#">Comece já!</a></p>
            </div>


            <div class="body-content">

                <!-- Example row of columns -->
                <div class="row">
                    <div class="col-lg-4">
                        <h2>Compartilhe</h2>
                        <p>Crie sua carona aqui no site, ela será compartilhada com todos os usuários do site. E também poderá ser compartilhada no facebook! </p>
                        <p><a class="btn btn-default" href="#">Cadastre sua carona &raquo;</a></p>
                    </div>
                    <div class="col-lg-4">
                        <h2>Encontre</h2>
                        <p>Qual o seu destino? A gente te ajuda a encontrar alguém pra chegar lá! É prático e rápido </p>
                        <p><a class="btn btn-default" href="#">Encontre sua carona &raquo;</a></p>
                    </div>
                    <div class="col-lg-4">
                        <h2>Participe</h2>
                        <p>Faça já seu cadastro e participe da comunidade conosco! Você pode utilizar sua conta do facebook, é muito fácil participar!</p>
                        <p><a class="btn btn-default" href="#">Comece sua conta &raquo;</a></p>
                    </div>
                </div>

            </div><!-- /.body-content -->

            <!-- Site footer -->
            <div class="footer">
                <p>&copy; Vai de Carona 2013</p>
            </div>

        </div> <!-- /container -->
        
    </body>
</html>