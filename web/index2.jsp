<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="model.Usuario"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.Carona"%>
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
                    <a class="navbar-brand" href="index.jsp">Vai de Carona!</a>
                </div>
                
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="http://www.facebook.com/vaidecaronanoface">
                                Curta nossa página no facebook</a>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div>
            
            <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <strong>Gostou da ideia?</strong> Nos dê sua opinião para podermos melhorar nosso trabalho! 
                Responda essa <a href="https://docs.google.com/forms/d/1O1JdqLhtbSDs3DTBRLqIFtpeU0Z2AQOKoOIJrr5-ok8/viewform">pesquisa de opinião.</a>
            </div>
            
            <div class="container">
                <div class="row row-offcanvas row-offcanvas-right">
                    <div class="col-xs-12 col-sm-9">
                        <p class="pull-right visible-xs">
                            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Oferecer Nova</button>
                        </p>
                        <div class="row"><h2 class="text-center visible-lg visible-md">Últimas Caronas Oferecidas</h2></div>
<!--                        <div class="row">
                            <form action="BuscaRapidaServlet" class="" id="form" role="form">
                                <label class="sr-only" for="partida">Busca Rápida</label>
                                <input name="busca" type="text" class="form-control" placeholder="Busca Rápida">
                                <button type="submit" class="invisible" onclick="busca(); return false;"></button>
                            </form>
                        </div>-->
                        <div class="row">
                                <%
                                    List<Carona> listaUsuario = (List<Carona>) request.getAttribute("caronas");
                                    if(listaUsuario!=null){
                                        Iterator<Carona> i = listaUsuario.iterator();
                                        while(i.hasNext()){
                                            Carona c = i.next();
                                            Usuario user = c.getUsuario();
                                            DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
                                            java.sql.Date data = new java.sql.Date(fmt.parse(c.getData()).getTime()); 
                                            fmt = new SimpleDateFormat("dd/MM/yyyy");

                                %>
                            <div class="col-6 col-sm-6 col-lg-4">  
                                <p class="text-center lista-caronas">
                                    <b><%=user.getNome()%> </b>
                                    <br><%=fmt.format(data)%> <%if(c.getHorario()!=null)%><%=c.getHorario()%>
                                    <br>Saindo de: <%=c.getOrigem()%>
                                    <br>Indo para: <%=c.getDestino()%>
                                    <br> <a class="btn btn-xs btn-default" 
                                            href="<%=user.getLink()%>">
                                        Ver facebook &raquo;</a>
                                </p>
                            </div>
                                <% }}%>
                        </div>
                    </div>

                    <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
                        <div class="well sidebar-nav menu-oferecer">
                            <form action="CadastroOfertaCaronaServlet" class="" id="form" role="form">
                                <div class="form-group">
                                    <label class="sr-only" for="partida">Saindo de...</label>
                                    <select name="origem" class="form-control" id="partida">
                                        <option>Saindo de...</option>
                                        <option>Araras</option>
                                        <option>Barueri</option>
                                        <option>Bauru</option>
                                        <option>Campinas</option>
                                        <option>Capivari</option>
                                        <option>Carapicuiba</option>
                                        <option>Diadema</option>
                                        <option>Embu</option>
                                        <option>Franca</option>
                                        <option>Guaruja</option>
                                        <option>Guarulhos</option>
                                        <option>Itaquaquecetuba</option>
                                        <option>Jundiai</option>
                                        <option>Limeira</option>
                                        <option>Marilia</option>
                                        <option>Mauá</option>
                                        <option>Mogi das Cruzes</option>
                                        <option>Osasco</option>
                                        <option>Piracicaba</option>
                                        <option>Praia Grande</option>
                                        <option>Ribeirao Preto</option>
                                        <option>Rio Claro</option>
                                        <option>Santo Andre</option>
                                        <option>Santos</option>
                                        <option>Sao Bernardo do Campo</option>
                                        <option>Sao Carlos</option>
                                        <option>Sao Jose do Rio Preto</option>
                                        <option>Sao Jose dos Campos</option>
                                        <option>Sao Paulo</option>
                                        <option>Sao Vicente</option>
                                        <option>Sorocaba</option>
                                        <option>Sumare</option>
                                        <option>Suzano</option>
                                        <option>Taboao da Serra</option>
                                        <option>Taubate</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="destino">Indo para...</label>
                                    <select name="destino" class="form-control" id="destino"  placeholder="Indo para...">
                                        <option>Indo para...</option>
                                        <option>Araras</option>
                                        <option>Barueri</option>
                                        <option>Bauru</option>
                                        <option>Campinas</option>
                                        <option>Capivari</option>
                                        <option>Carapicuiba</option>
                                        <option>Diadema</option>
                                        <option>Embu</option>
                                        <option>Franca</option>
                                        <option>Guaruja</option>
                                        <option>Guarulhos</option>
                                        <option>Itaquaquecetuba</option>
                                        <option>Jundiai</option>
                                        <option>Limeira</option>
                                        <option>Marilia</option>
                                        <option>Mauá</option>
                                        <option>Mogi das Cruzes</option>
                                        <option>Osasco</option>
                                        <option>Piracicaba</option>
                                        <option>Praia Grande</option>
                                        <option>Ribeirao Preto</option>
                                        <option>Rio Claro</option>
                                        <option>Santo Andre</option>
                                        <option>Santos</option>
                                        <option>Sao Bernardo do Campo</option>
                                        <option>Sao Carlos</option>
                                        <option>Sao Jose do Rio Preto</option>
                                        <option>Sao Jose dos Campos</option>
                                        <option>Sao Paulo</option>
                                        <option>Sao Vicente</option>
                                        <option>Sorocaba</option>
                                        <option>Sumare</option>
                                        <option>Suzano</option>
                                        <option>Taboao da Serra</option>
                                        <option>Taubate</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input name="data" type="text" class="form-control" placeholder="dd/mm/aaaa" id="datepicker">
                                </div>
                                <div class="form-group">
                                    <input name="horario" type="text" class="form-control" placeholder="Horário">
                                </div>
                                <input type="hidden" id="nome" name="nome">
                                <input type="hidden" id="link" name="link">
                                <span class="text-info text-right"><small>*É necessário se conectar com o facebook para cadastrar caronas.</small></span>
                                <button type="submit" class="btn btn-success btn-lg pull-right" onclick="envia(); return false;">Oferecer Carona</button>
                            </form>
                        </div><!--/.well -->
                    </div><!--/span-->
                </div><!--/row-->
            </div> <!-- /container -->
                
            <div class="footer">
                <p>&copy; Vai de Carona (Beta) 2013</p>
            </div>

        </div> <!-- /container -->
        
        
        
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
        <script>
            $(document).ready(function() {
                $('[data-toggle=offcanvas]').click(function() {
                    $('.row-offcanvas').toggleClass('active');
                });
            });
            
            function busca(){
                alert('A busca ainda está em construção. Nos desculpe.');
            }
            
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
                    conectar();
                }
            }

            $(function() {
                $( "#datepicker" ).datepicker({ minDate: new Date(), dateFormat: "dd/mm/yy" });
            });
        </script>
    </body>
</html>