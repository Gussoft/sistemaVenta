$(document).ready(function(){
    $('#example').DataTable({
        "language":{
            "lengthMenu": "Mostar _MENU_ Registros",
            "zeroRecords": "No se encontraron Resultados",
            "info": "Mostrando registro _START_ al _END_ del total de _TOTAL_ Registros",
            "infoEmpty": "Mostrando Registros del 0 al 0 del total de 0 Registros",
            "infoFiltered": "(Filtrando un Total de _MAX_ Registros)",
            "sSearch": "Buscar :",
            "oPaginate":{
                "sFirst": "Primero",
                "sLast": "Ultimo",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "sProcessing": "Procesando...",
        }
    });
});