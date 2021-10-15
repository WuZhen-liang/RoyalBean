<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		function getFormData($form){
		    var unindexed_array = $form.serializeArray();
		    var indexed_array = {};

		    $.map(unindexed_array, function(n, i){
		        indexed_array[n['name']] = n['value'];
		    });

		    return indexed_array;
		}
		$("#send").click(function() {
			//var insertData = $("form").serialize();
			
			var $form = $("form");
			var data = getFormData($form);
			console.log(data);
			$.ajax({
				type : 'post',
				url : '/ajaxinsertshoppd',
 				data : JSON.stringify(data),
				contentType : 'application/json',
				success : function() {
					console.log("success");
				},
				error : function() {
					//alert('error');  
					console.log("error");
				}
			});
		})
	});
</script>
</head>
<body>
	<form class="needs-validation" method="POST">
		<div class="row">
			<div class="col-md-6 mb-3">
				<label>Product name *</label> <input type="text"
					class="form-control" name="shopPdName">
				<div class="invalid-feedback">Valid first name is required.</div>
			</div>
			<div class="col-md-6 mb-3">
				<label>Product Price *</label> <input type="text"
					class="form-control" name="shopPdPrice">
				<div class="invalid-feedback">Valid last name is required.</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 mb-3">
				<label>Product Count *</label> <input class="form-control"
					name="shopPdCount">
				<div class="invalid-feedback">Valid first name is required.</div>
			</div>
			<div class="col-md-6 mb-3">
				<label>Product Weight *</label> <input type="text"
					class="form-control" name="shopPdWeight">
				<div class="invalid-feedback">Valid last name is required.</div>
			</div>
		</div>
		<div class="mb-3">
			<div class="input-group">
				<label>Picture *</label> <input name='shopPdPicture' type="text">
				<div class="invalid-feedback" style="width: 100%;">Your
					Picture is required.</div>
			</div>
		</div>
		<div class="mb-3">
			<div class="row">
				<div class="col-md-4 mb-3">
					<label>Type *</label> <select class="wide w-100" name="shopPdType">
						<option value="Choose..." data-display="Select">Choose...</option>
						<option value="咖啡豆">咖啡豆</option>
						<option value="咖啡">咖啡</option>
						<option value="蛋糕">蛋糕</option>
					</select>
					<div class="invalid-feedback">Please select a valid Type.</div>
				</div>
				<div class="col-md-4 mb-3">
					<label>Baking *</label> <select class="wide w-100"
						name="shopPdBaking">
						<option value="Choose..." data-display="Select">Choose...</option>
						<option value="淺烘焙">淺烘焙</option>
						<option value="肉桂烘焙">肉桂烘焙</option>
						<option value="微中烘焙">微中烘焙</option>
						<option value="濃度烘焙">濃度烘焙</option>
						<option value="城市烘焙">城市烘焙</option>
						<option value="深城市烘焙">深城市烘焙</option>
						<option value="法式烘焙">法式烘焙</option>
						<option value="義式烘焙">義式烘焙</option>
					</select>
					<div class="invalid-feedback">Please provide a valid Baking.
					</div>
				</div>
				<div class="col-md-4 mb-3">
					<label>SaveMethod *</label> <select class="wide w-100"
						name="shopPdSaveMethod">
						<option data-display="Select" value="Choose...">Choose...</option>
						<option value="冷凍">冷凍</option>
						<option value="冷藏">冷藏</option>
						<option value="常溫">常溫</option>
					</select>
					<div class="invalid-feedback">SaveMethod code required.</div>
				</div>
			</div>
		</div>
		<div class="mb-3">
			<label>Depiction *</label>
			<textarea class="wide w-100" name="shopPdDepiction"></textarea>
			<div class="invalid-feedback">Please enter your shipping
				address.</div>
		</div>
		<div class="mb-3">
			<label>Ingredient *</label> <input class="wide w-100"
				name="shopPdIngredient">
			<div class="invalid-feedback">Please enter your shipping
				address.</div>
		</div>
		<div class="mb-3">
			<label>Origin *</label> <input class="wide w-100"
				name="shopPdOrigin">
			<div class="invalid-feedback">Please enter your shipping
				address.</div>
		</div>
		<div class="mb-3">
			<label>ExpTime *</label> <input class="wide w-100"
				name="shopPdExpTime">
			<div class="invalid-feedback">Please enter your shipping
				address.</div>
		</div>
		<div class="mb-3">
			<label>Shipment *</label> <input class="wide w-100"
				name="shopPdShipment">
			<div class="invalid-feedback">Please enter your shipping
				address.</div>
		</div>
		<div class="mb-3">
			<label>Notice *</label>
			<textarea class="wide w-100" name="shopPdNotice"></textarea>
			<div class="invalid-feedback">Please enter your shipping
				Notice.</div>
		</div>
		<!-- <hr class="mb-1"> </form> -->

	</form>
	
		<div class="mb-3">
			<center>
				<button value="Send" id="send">Submit</button>
				<div class="invalid-feedback">Please enter your shipping
					address.</div>
			</center>
		</div>
</body>
</html>