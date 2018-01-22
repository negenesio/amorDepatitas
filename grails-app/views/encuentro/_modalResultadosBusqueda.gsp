<%@ page import="amordepatitas.Imagenes;" contentType="text/html;charset=UTF-8" %>
<div class="modal fade modalResultadoBusqueda" id="modalResultadoBusqueda" tabindex="-1" role="dialog" aria-labelledby="modalResultadoBusqueda" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-sm" style="width: 500px">
        <div class="modal-content" style="width: 700px">
            <div class="modal-body">
                    <div class="modal-content">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">
                                    <g:set var="imagenes" value="${Imagenes.findAllByMascota(mascotaBusqueda)}"/>
                                    <g:if test="${imagenes}">
                                        <g:each in="${imagenes}" var="imagen" status="i">
                                            <g:if test="${i == 0}">
                                                <div class="item active">
                                                    <center><img src="${createLink(controller: 'imagenes', action: 'viewImage', params: ['id': imagen.id])}" width="200" height="200px"/></center>
                                                </div>
                                            </g:if>
                                            <g:else>
                                                <div class="item">
                                                    <center><img src="${createLink(controller: 'imagenes', action: 'viewImage', params: ['id': imagen.id])}" width="200" height="200px"/></center>
                                                </div>
                                            </g:else>
                                        </g:each>
                                    </g:if>
                                    <g:if test="${!imagenes}">
                                        <div class="item active">
                                            <center><asset:image src="mascotas/noImageDog.png" width="200" height="200"/></center>
                                        </div>
                                    </g:if>
                            </div>
                            <!-- Controls -->
                            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                        <div>
                            <center>
                                <table>
                                    <thead>
                                        <th><asset:image src="mascotas/x.png" width="48" height="48" onclick="createMatch()"/></th>
                                        <th><asset:image src="mascotas/heart.png" width="48" height="48" onclick="createMatch()"/></th>
                                    </thead>
                                </table>
                            </center>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</div>
<script>
    function createMatch(buscador, encontrado, estado) {
        jQuery.ajax(
            {
                type:'POST',
                data:'buscador=' + buscador +'&encontrado='+encontrado +'&estado='+estado,
                url:'/amorDePatitas/encuentro/crearMatchEncuentros',
                success:function(data,textStatus)
                {
                    window.location.href = "/amorDePatitas/encuentro/buscarEncuentro?mascotaId="+data.next;
                },
                error:
                    function(XMLHttpRequest,textStatus,errorThrown){

                    }
            });
    }
</script>