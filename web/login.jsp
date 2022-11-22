<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Entrar</title>
        <link rel="stylesheet" href="estilos.css"/>
    </head>
    <body>
        
        <div class="container">
            <div class="box">
                <h2 class="h2">Minha Aplicação</h2>
                <form action="valida_login.do" method="post" class="form">
                    Login <input type="text" size="20" name="login" required/><br/>
                    <br>
                    Senha <input type="password" size="20" name="senha" required/><br/>
                    <br>
                    <input type="submit" value="Entrar"  class="button"/>
                </form>
            </div>
        </div>
    </body>
</html>