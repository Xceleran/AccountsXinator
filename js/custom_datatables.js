// Call the dataTables jQuery plugin
$(document).ready(function() {
  $('#dataTable').DataTable({
  	"paging": false,
  	
  	"scrollx":        true,
	"bPaginate": false,
    "bFilter": false,
    "bInfo": false



  });
});
