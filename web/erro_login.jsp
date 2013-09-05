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
                    <a class="navbar-brand" href="index.jsp">Vai de Carona!</a>
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

            <div class="alert alert-danger">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <strong>Ouve um erro no seu login!</strong> <a href="#">Esqueceu sua senha?</a>
            </div>
            
            <div class="jumbotron">
                <div class="col-lg-5">
                    <p>Informe seus dados para entrar no sistema.</p>
                    <form class="form-horizontal" action="LoginServlet" role="form">
                        <div class="form-group">
                            <label class="sr-only" for="usuario">Usuário</label>
                            <input type="text" class="form-control" id="usuario" placeholder="Usuário" name="usuario">
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="senha">Senha</label>
                            <input type="password" class="form-control" id="senha" placeholder="Senha" name="senha">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-success">Entrar</button>
                        </div>
                    </form>
                </div>
                <div class="col-lg-2"></div>
                <div class="col-lg-5">
                    <p>Primeira vez? Cadastre-se com seu facebook.</p>
                    <form class="form-horizontal" action="CadastroUserServlet" role="form" id="form">
                        <div id="nomeUsuario" class="form-group">
                            <a href="#" onclick="interligar(); return false;">Conectar facebook</a>
                        </div>
                        <div id="hide">
                            <div class="form-group">
                                <p>Por favor crie um usuário e uma senha.</p>
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="usuariocad">Usuário</label>
                                <input type="text" class="form-control" id="usuariocad" placeholder="Usuário" name="usuario">
                                <span class="help-block"><h6 id="help-usuario"></h6></span>
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="senhacad">Senha</label>
                                <input type="password" class="form-control" id="senhacad" placeholder="Senha" name="senha">
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="repeteSenha">Repetir senha</label>
                                <input type="password" class="form-control" id="repeteSenha" placeholder="Repetir senha">
                                <span class="help-block"><h6 id="help"></h6></span>
                            </div>
                            <div class="form-group">
                                <input type="hidden" id="nome" name="nome">
                                <input type="hidden" id="link" name="link">
                                <button type="submit" class="btn btn-success" onclick="tentaEnviar(); return false;">Cadastrar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
        <div class="footer container">
            <p>&copy; Vai de Carona (Beta) 2013</p>
        </div>
        
        <script>
            $(document).ready(function() {
                
                $('#usuariocad').keyup(function(){
                    $.ajax({
                        type: "GET",
                        url: "VerificaUsuarioServlet",
                        dataType: "html",
                        data: {usuario: $('#usuariocad').val()}
                    }).done(function(data){
                        $('#help-usuario').html(data);
                    });
                });
                
                $('#repeteSenha').keyup(function(){
                    if($('#repeteSenha').val() !== $('#senhacad').val()){
                        $('#help').html('As senhas não estão iguais.');
                    } else {
                        $('#help').html('');
                    }
                });
            });
            
            function tentaEnviar(){
                if($('#repeteSenha').val() !== $('#senhacad').val()){
                    alert('As senhas não estão iguais.');
                    return false;
                }
                $.ajax({
                    type: "GET",
                    url: "VerificaUsuarioServlet",
                    dataType: "html",
                    data: {usuario: $('#usuariocad').val()}
                }).done(function(data){
                    if(data!==''){
                        alert(data);
                        return false;
                    }
                    $('#form').submit(); 
                }); 
            }
        </script>
    </body>
</html>