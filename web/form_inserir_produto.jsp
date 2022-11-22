<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Produto</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <h1>Novo Produto</h1>
        <form action="inserir_produto.do" method="post">
            Nome        <input type="text" name="nome" size="60" required/><br/>
            Descrição   <input type="text" name="descricao" size="60" required/><br/>
            Quantidade  <input type="text" name="quantidade" size="60" value="0" required/><br/>
            Valor       <input type="text" name="valor" size="60" value="0" required/><br/>
            <input type="submit" value="Salvar"/>
        </form>
    </body>
</html>
