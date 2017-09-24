<%--
  Created by IntelliJ IDEA.
  User: negenesio
  Date: 10/9/17
  Time: 22:57
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="sinMenu"/>

    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/bootstrapvalidator.min.css" />
    <asset:stylesheet src="../usuario/indexRegistracion.css"/>
    <style>
        .divContent {
            text-align: center;
            background-color:  rgba(66, 70, 69, 0.69);
            width: 750px;
        }
        .tableCenter{
            display: inline-table;
        }
    </style>
    <title></title>
</head>

<body>


<center><div class="divContent">
    <table class=tableCenter" style="border-top: 0px;">
        <tbody style="">
        <tr class="tableCenter"">
            <td class="tdPading">
                <g:img dir="images" file="mascotas/addMascota.png" width="130" height="130"/>
            </td>
        </tr>
        <tr class="tableCenter">
            <td class="tdPading">
                <g:img dir="images" file="mascotas/buscarMascota.png" width="130" height="130"/>
            </td>
        </tr>
        <tr class="tableCenter">
            <td class="tdPading">
                <g:img dir="images" file="mascotas/verMascota.png" width="130" height="130"/>
            </td>
        </tr>
        <tr class="tableCenter">
            <td class="tdPading">
                <g:img dir="images" file="mascotas/publicarMascota.png" width="130" height="130"/>
            </td>
        </tr>
        </tbody>
    </table>
</div></center>
</body>
</html>