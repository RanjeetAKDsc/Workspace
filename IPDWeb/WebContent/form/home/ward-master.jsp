
<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
String dbConnVar = "IPD-OPD";
try {
%>
<head>
<jsp:include page="../common/cssfiles.jsp"></jsp:include>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>
<style>
table, th, td {
	border: 1px solid white;
	border-collapse: collapse;
	background-color: #ffffff;
}
</style>
<style>
table.a {
	table-layout: auto;
	width: 100%;
}
</style>
</head>
<jsp:include page="../common/mobile-header.jsp"></jsp:include>
<body id="kt_body"
	style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/ipd-opd/media/bg/bg-9.jpg)"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed subheader-enabled page-loading">

	
	<div
		class="container">
		
				<h2 class="text-gray font-weight-bold my-2 mr-5">Ward Master</h2>
				
			
				<div class="card card-custom gutter-b">
					<div class="card-body">
						<div class="example mb-10">
						<div class="example-preview">
							<div class="card card-custom">
									<form class="form" id="kt_form_1">
										<div class="card-body">
											<div class="row">
												<div class="col-xl-6">
													<div class="form-group">
														<label>Ward Code :</label> <input type="text"
															id="ward_code" class="form-control form-control-solid"
															placeholder="Enter Ward Code" />
															<span class="form-text text-muted">Please Select Ward Code.</span>
													</div>
												</div>
												<div class="col-xl-6">
													<div class="form-group">
														<label>Ward Name :</label> <input type="text"
															id="ward_name" class="form-control form-control-solid"
															placeholder="Enter Ward Name" />
															<span class="form-text text-muted">Please Select Ward Name.</span>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-6">
																	<div class="form-group">
																		<label>Ward Type :</label><span class="text-danger">*</span>
																		<select class="form-control form-control-solid"
																			name="ward_type" id="ward_type">
																			<option value="" disabled selected hidden>Select Ward Type</option>
																		</select>
																		<span class="form-text text-muted">Please Select Ward Type.</span>
																	</div>
																</div>
												<div class="form-group col-xl-6">
													<label>Number Of Rooms :</label><input type="text"
														id="number_of_rooms" class="form-control form-control-solid"
														placeholder="Enter Number Of Rooms" />
														<span class="form-text text-muted">Please Select Number Of Rooms.</span>

												</div>
											</div>

											<div class="row">
												<div class="col-xl-6">
																	<div class="form-group">
																		<label>Floor :</label><span class="text-danger">*</span>
																		<select class="form-control form-control-solid"
																			name="floor" id="floor">
																			<option value="" disabled selected hidden>Select Floor</option>
																		</select>
																		<span class="form-text text-muted">Please Select Floor.</span>
																	</div>
																</div>
												
											</div>
										
										</div>
										<div class="text-center">
											<button type="button" id="addWard"
												class="btn btn-primary mr-2" style="background-color: #AB48FF; ">Submit</button>
												<button type="submit" id="updateWard"
												class="btn btn-primary mr-2"
												style="background-color: #AB48FF;">Update</button>
											<button type="button" class="btn btn-primary mr-2" style="background-color: #AB48FF; " id="cancel">Cancel</button>
										</div>
									</form>
									<!--end::Form-->
								</div>
						
						</div>
						
						</div>
					</div>
				</div>

								<div class="card card-custom gutter-b">
									<div class="card-body">
										<div class="input-icon ml-10" style="width: 30%;">
											<input type="text" class="form-control form-control-solid"
												placeholder="Search..." id="txt_searchall" /> <span>
												<i class="flaticon2-search-1 text-muted"></i>
											</span>
										</div>
										<br />
										<!--begin: datatable-->
										<table data-toggle="table" class='a'
											data-classes="table table-hover table-condensed "
											data-striped="true" data-sort-name="Quality"
											data-sort-order="desc" data-pagination="false"
											data-scroll="false" data-height=550 id="table-id">
											<thead>
												<tr>
													<th class="col-sm-1 text-center" data-field="sr-no"
														data-sortable="true">Sr No</th>
													<th class="col-sm-3 text-center" data-field="ward-code"
														data-sortable="true">Ward Code</th>
													<th class="col-sm-3 text-center" data-field="ward-name"
														data-sortable="true">Ward Name</th>
													<th class="col-sm-3 text-center" data-field="ward-type"
														data-sortable="true">Ward Type</th>
													<th class="col-sm-3 text-center" data-field="number-of-rooms"
														data-sortable="true">Number Of Rooms</th>
													<th class="col-sm-3 text-center" data-field="floor"
														data-sortable="true">Floor</th>
													<th class="col-sm-3 text-center" data-field="action"
														data-sortable="true">Action</th>
													
													

												</tr>

											</thead>
											<tbody class="data">


											</tbody>
										</table>
										<!--end: datatable-->
									</div>
								</div>

		</div>
		<!--end::Container-->


		<!--end::Content-->
		<!--begin::Footer-->
		<div style="position: fixed; bottom: 0; width: 100%;" class="fixed">
			<jsp:include page="../common/footer.jsp"></jsp:include>
		</div>
		<!--end::Footer-->

	
	<!--end::Page-->

	<!--begin::Scrolltop-->
	<div id="kt_scrolltop" class="scrolltop">
		<span class="svg-icon"> <!--begin::Svg Icon | path:assets/media/svg/icons/Navigation/Up-2.svg-->
			<svg xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
				height="24px" viewBox="0 0 24 24" version="1.1">
					<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
						<polygon points="0 0 24 0 24 24 0 24" />
						<rect fill="#000000" opacity="0.3" x="11" y="10" width="2"
					height="10" rx="1" />
						<path
					d="M6.70710678,12.7071068 C6.31658249,13.0976311 5.68341751,13.0976311 5.29289322,12.7071068 C4.90236893,12.3165825 4.90236893,11.6834175 5.29289322,11.2928932 L11.2928932,5.29289322 C11.6714722,4.91431428 12.2810586,4.90106866 12.6757246,5.26284586 L18.6757246,10.7628459 C19.0828436,11.1360383 19.1103465,11.7686056 18.7371541,12.1757246 C18.3639617,12.5828436 17.7313944,12.6103465 17.3242754,12.2371541 L12.0300757,7.38413782 L6.70710678,12.7071068 Z"
					fill="#000000" fill-rule="nonzero" />
					</g>
				</svg> <!--end::Svg Icon-->
		</span>
	</div>

	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/ipd-opd/js/pages/features/custom/spinners.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/ipd-opd/js/pages/crud/forms/widgets/form-repeater.js?v=7.2.7"></script>
	<script
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/ipd-opd/js/pages/crud/forms/widgets/select2.js?v=7.2.8"></script>
<script type="text/javascript">
	
	var basePath='<%=basePath%>';    
	var base='<%=base%>';  
	
	
	$('#updateWard').hide();
	$("#addWard").show();
	
		$('#addWard').click(function() {

							var ward_code = $('#ward_code').val();
							var ward_name = $('#ward_name').val();
							var ward_type = $('#ward_type').val();
							var number_of_rooms = $('#number_of_rooms').val();
							var floor = $('#floor').val();
							
							var flag = 1; // Addition

						if(ward_code != "" && ward_name != ""){
							$.ajax({
								// http://localhost:8080/ipdAPI/ipdapi/insertUpdateWard
								url : base +"/ipdAPI/ipdapi/insertUpdateWard",
								
								type : "post",
								dataType : "json",
								async : false,
								data : {
									"ward_code" : ward_code,
                                    "ward_name" : ward_name,
                                    "ward_type": ward_type,
                                    "number_of_rooms" : number_of_rooms,
                                    "floor" : floor,
                                    
									"flag" : flag
								},
								
								error : function(xhr) {
									var msg = "Data insertion failed Error : "
											+ xhr.status
											+ " "
											+ xhr.statusText;
									alert(msg);
								},
								success : function(response) {
									if (response != null) {

										if (response >= 1) {

											var msg = "Ward Data inserted Successfully.";
											alert(msg);
											

										} 
									}
								}

							});
						}

						})

		"use strict";
		//Class definition
		
		var ward_id;
var html = "";

$.ajax({
	
	url : base +"/ipdAPI/ipdapi/getWard",
	
	type : "post",
	dataType : "json",
	async : false,
	data : {"ward_id": ward_id},
	success:function(data)
	{
		
		const row = data.find(d => d.ward_id == ward_id);
		data.forEach((row)=> {
			 html +="<tr id= tr-id-2 class= tr-class-2>"
			 html += "<td>"+row.ward_id+"</td>"; 
			 html += "<td>"+row.ward_code+"</td>";
			 html += "<td>"+row.ward_name+"</td>";
			 html += "<td>"+row.ward_type+"</td>";
			 html += "<td>"+row.number_of_rooms+"</td>";
	         html += "<td>"+row.floor+"</td>";
	         html += '<td><a href="javascript:update('+row.ward_id+');" class="btn_ward btn-sm btn-clean btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" height="20px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="20" height="20"/><path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#B5B5C3" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "/><rect fill="#000000" opacity="0.3" x="5" y="20" width="15" height="2" rx="1"/></g></svg></span>'
         

     	       	+ '<a href="javascript:deleteById('+row.ward_id+');" class="btn_ward btn-sm btn-clean btn-icon" title="Delete"><span class="svg-icon svg-icon-md"> <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" height="20px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="20" height="20"/><path d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z" fill="#B5B5C3" fill-rule="nonzero"/>\ <path d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z" fill="#000000" opacity="0.3"/></g> </svg></span></a></td>';
	            html +="</tr>"
		
		});
		 $(".data").html(html);
	}
	
});	

$(document).ready(function (){
	   var table = $('#table-id').DataTable();
	   
	  
	});

		 
		 function update(id){
			 
				$('.btn_ward').hide();
				

				
				$('#updateWard').show();
				$("#addWard").hide();
				
				$.ajax({
			        type:"POST",
			        dataType: "json",
			        data:{"ward_id": id},
					async : false,
					url : base +"/ipdAPI/ipdapi/getWard",
			        success:function(data)
			        {
			        	
			            const row = data.find(d => d.ward_id ==id);
			           
			            $("#ward_code").val(row.ward_code);
			        	$("#ward_name").val(row.ward_name);
			        	$("#ward_type").val(row.ward_type);
			        	$("#number_of_rooms").val(row.number_of_rooms);
			        	$("#floor").val(row.floor);
			        	
			        }
			     });
				
				 
				 // let update_by_id = temp_edit_id;
				 // console.log(update_by_id);
				$('#updateWard')
				.click(
						function() {
							 
							
							var ward_code = $('#ward_code').val();
							var ward_name = $('#ward_name').val();
							var ward_type = $('#ward_type').val();
							var number_of_rooms = $('#number_of_rooms').val();
							var floor = $('#floor').val();
							
							var flag = 2; // Addition

							$.ajax({
								url : base +"/ipdAPI/ipdapi/insertUpdateWard",
								
										type : "post",
										dataType : "json",
										async : false,
										data : {
											"ward_code" : ward_code,
											"ward_name" : ward_name,
											"ward_type" : ward_type,
											"number_of_rooms" : number_of_rooms,
											"floor" : floor,
											
											
											"flag" : flag,
											"ward_id": id
										},
										error : function(xhr) {
											var msg = "(Data updation failed. Error : "
													+ xhr.status
													+ " "
													+ xhr.statusText;
											alert(msg);
										},
										success : function(response) {
											if (response != null) {

												if (response >= 1) {

													var msg = "Ward Data updated Successfully.";
													alert(msg);

												} 
											}
										}
								   
									});
			   

						})
		 
		 }
		 
	

	"use strict";
		 
		$('#cancel')
		.click(
				function() {		
				window.location.reload();
				})
		 
		// Delete data by ward_id
		function deleteById(id){
			if (confirm("Press OK to confirm!")) {
			$.ajax({
				url : base + "/ipdAPI/ipdapi/insertUpdateWard",
				
				type : "post",
				dataType : "json",
				async : false,
				data : {
					"ward_code": "",
                    "ward_name": "",
                    "ward_type": "",
                    "number_of_rooms": "",
                    "floor": "",
                    
					"ward_id" : id,
					"flag" : 3
				},
				
				error : function(xhr) {
					var msg = "Data deletion failed. Error : "
							+ xhr.status
							+ " "
							+ xhr.statusText;
					alert(msg);
				},
				success : function(response) {
					if (response != null) {

						if (response >=1) {

							var msg = "Ward Data deleted Successfully.";
							alert(msg);
							location.reload(true);

						} 
					}
				}

			});
			} else {
				  window.location.reload();
			  }
		}
		$(document).ready(function(){

			  // Search all columns
			  $('#txt_searchall').keyup(function(){
			    // Search Text
			    var search = $(this).val();

			    // Hide all table tbody rows
			    $('table tbody tr').hide();

			    // Count total search result
			    var len = $('table tbody tr:not(.notfound) td:contains("'+search+'")').length;

			    if(len > 0){
			      // Searching text in columns and show match row
			      $('table tbody tr:not(.notfound) td:contains("'+search+'")').each(function(){
			        $(this).closest('tr').show();
			      });
			    }else{
			      $('.notfound').show();
			    }

			  });

			});
		$.expr[":"].contains = $.expr.createPseudo(function(arg) {
			   return function( elem ) {
			     return $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
			   };
			});

	</script>
</body>
</html>

<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>




