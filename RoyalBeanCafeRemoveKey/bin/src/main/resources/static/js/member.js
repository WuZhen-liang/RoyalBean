$(function () {
// -----------------Member register-------------------------------
	$('#send1').click(function (e) {
		e.preventDefault();
		var email = $('#email').val();
		var password = $('#pwd').val();
		var params = { 'email': email, 'pwd': password };
		$.ajax({
			type: 'post',
			url: 'memberResgiterAction',
			contentType: 'application/json',
			data: JSON.stringify(params),
			success: function () {
				/*alert(${Addresult});*/
				console.log('Success');
			},
			error: function () {
				console.log('error');
			}
		});

	});

//-----------------------MemberContent register-----------------------------
	$('#send11').click(function (e) {
		e.preventDefault();
		var userID = $('#memberID11').val();
		var userName = $('#userName11').val();
		var phone = $('#phone11').val();
		var birthday = $('#date11').val();
		var city = $('#city11').val();
		var address = $('#address11').val();
		var gender = $('#gender11').val();
		var params = {
			'id': userID,
			'name': userName,
			'phone': phone,
			'birthday': birthday,
			'city': city,
			'address':address,
			'gender': gender,
		};
		$.ajax({
			type: 'post',
			url: 'member_content_resgiter_action',
			contentType: 'application/json',
			data: JSON.stringify(params),
			success: function () {
				console.log('Success');
			},
			error: function () {
				console.log('error');
			}
		});
	});
// --------------------CompanyRegister------------------
	$('#sendcompany').click(function (e) {
		e.preventDefault();
		var companyName = $('#companyName').val();
		var companyNumber = $('#companyNumber').val();
		var password = $('#pwd').val();
		var params = { 
			'name': companyName,
			'number': companyNumber,
			'pwd': password 
		};
		// console.log(params);
		$.ajax({
			type: 'post',
			url: 'company_resgiter_action',
			contentType: 'application/json',
			data: JSON.stringify(params),
			success: function () {
				console.log('Success');
			},
			error: function () {
				console.log('error');
			}
		});
	});
//  ---------------------- Member backgroundSystem ------------------------------
	$('#MemberSeacrch').click(function (e) {
		e.preventDefault();
		findAllMember();
	});

	function findAllMember(){
		$.ajax({
			type: 'post',
			url: 'BackgroundSearchMember_findAlldata',
			dataType:'JSON',
			contentType:'application/json',
			success: function (data) {
				var json = JSON.stringify(data, null, 4);
			 	var i = json.length;

				var parsedObjinArray = JSON.parse(json);
					$('#AllMember').empty("");
					$('#AllMemberContent').empty("");
					$('#AllCompany').empty(""); 
					if(json=null){
					$('#AllMember').append("<tr><td colspan='2'>暫無資料</td></tr>");
					}else{
					var table = $('#AllMember');
					table.append("<thead><tr><th style=\"width: 1%\">#</th>"
					+"<th style=\"width: 20%\">MemberID</th>"
					+"<th style=\"width: 30%\">MemberEmail</th>"
					+"<th>MemberPassword</th>"
					+"<th style=\"width: 8%\" class=\"text-center\">MemberActive</th>"
					+"<th>MemberBlackList</th>"
					+"<th style=\"width: 20%\">"+"</th></tr></thead><tbody id=\"memberbody\"></tbody>");
	
					$.each(parsedObjinArray,function(i,n){
					var tr = 
					
					"<tr>" +"<td>#</td>"+ "<td>" + n.id + "</td>" +
					"<td>" + n.email + "</td>" + "<td>" + n.pwd + "</td>" +
					"<td>" + n.active + "</td>" + "<td>" + n.blackList + "</td>"
					+"<td class=\"project-actions text-right\">"
					+"<a class=\"btn btn-primary btn-sm\" href=\"#\">"
					+"<i class=\"fas fa-folder\"></i>View</a>"
					+"<a class=\"btn btn-info btn-sm\" href=\"#\">"
					+"<i class=\"fas fa-pencil-alt\"></i>Edit</a>"
					+"<a class=\"btn btn-danger btn-sm\" href=\"member_ban/"+ n.id +"\" onclick=\"return false;\">"
					+"<i class=\"fas fa-trash\"></i>Ban</a></td></tr>";
// disable=\"disable\"
					$('#memberbody').append(tr);
					})				
				}
			},
			error: function () {
				console.log('error');
			}
		});
	};

	$('#MemberContentSeacrch').click(function (e) {
		e.preventDefault();
		findAllMemberContent();
	});


	function findAllMemberContent(){
		$.ajax({
			type: 'post',
			url: 'BackgroundMemberContent_findAlldata',
			dataType:'JSON',
			contentType:'application/json',
			success: function (data) {
				var json = JSON.stringify(data, null, 4);
				console.log("SUCCESS : ", json);
			 	var i = json.length;

				var parsedObjinArray = JSON.parse(json);
					$('#AllMember').empty("");
					$('#AllMemberContent').empty("");
					$('#AllCompany').empty(""); 
					if(json=null){
					$('#AllMemberContent').append("<tr><td colspan='2'>暫無資料</td></tr>");
					}else{
					var table = $('#AllMemberContent');
					table.append("<thead><tr><th style=\"width: 5%\">#</th>"
					+"<th style=\"width: 15%\">MemberID</th>"
					+"<th style=\"width: 15%\">MemberName</th>"
					+"<th style=\"width: 15%\">MemberPhone</th>"
					+"<th style=\"width: 8%\">MemberBirthday</th>"
					+"<th style=\"width: 8%\">MemberCity</th>"
					+"<th style=\"width: 20%\">MemberAddress</th>"
					+"<th >MemberGender</th>"
					+"<th style=\"width: 20%\">"+"</th></tr></thead><tbody id=\"memberContentbody\"></tbody>");
	
					$.each(parsedObjinArray,function(i,n){
					var tr = 
					
					"<tr>" +"<td>#</td>"+ "<td>" + n.id + "</td>" +
					"<td>" + n.name + "</td>" + "<td>" + n.phone + "</td>" +
					"<td>" + n.birthday + "</td>" + "<td>" + n.city + "</td>"
					+"<td>" + n.address + "</td>" + "<td>" + n.gender + "</td>"
					+"<td class=\"project-actions text-right\">"
					+"<a class=\"btn btn-primary btn-sm\" href=\"#\">"
					+"<i class=\"fas fa-folder\"></i>View</a>"
					+"<a class=\"btn btn-info btn-sm\" href=\"#\">"
					+"<i class=\"fas fa-pencil-alt\"></i>Edit</a>"
					+"<a class=\"btn btn-danger btn-sm\" href=\"member_ban/"+ n.id +"\" onclick=\"return false;\">"
					+"<i class=\"fas fa-trash\"></i>Ban</a></td></tr>";

					$('#memberContentbody').append(tr);
					})				
				}
			},
			error: function () {
				console.log('error');
			}
		});
	};

	$('#CompanySeacrch').click(function (e) {
		e.preventDefault();
		findAllCompany();
	});


	function findAllCompany(){
		$.ajax({
			type: 'post',
			url: 'company_finded_all',
			dataType:'JSON',
			contentType:'application/json',
			success: function (data) {
				var json = JSON.stringify(data, null, 4);
				// console.log("SUCCESS : ", json);
			 	var i = json.length;

				var parsedObjinArray = JSON.parse(json);
					$('#AllMember').empty("");
					$('#AllMemberContent').empty("");
					$('#AllCompany').empty(""); 
					if(json=null){
					$('#AllCompany').append("<tr><td colspan='2'>暫無資料</td></tr>");
					}else{
					var table = $('#AllCompany');
					table.append("<thead><tr><th style=\"width: 5%\">#</th>"
					+"<th style=\"width: 8%\">Company ID</th>"
					+"<th >Company Password</th>"
					+"<th style=\"width: 15%\">Company Name</th>"
					+"<th style=\"width: 5%\">Company Number</th>"
					+"<th style=\"width: 5%\">Company Active</th>"
					+"<th style=\"width: 5%\">Company BlackList</th>"
					+"<th style=\"width: 20%\">"+"</th></tr></thead><tbody id=\"companybody\"></tbody>");
	
					$.each(parsedObjinArray,function(i,n){
					var tr = 
					
					"<tr>" +"<td>#</td>"+ "<td>" + n.id + "</td>" +
					"<td>" + n.pwd + "</td>" + "<td>" + n.name + "</td>" +
					"<td>" + n.number + "</td>" + "<td>" + n.active + "</td>"
					+"<td>" + n.blackList + "</td>"
					+"<td class=\"project-actions text-right\">"
					+"<a class=\"btn btn-primary btn-sm\" href=\"#\">"
					+"<i class=\"fas fa-folder\"></i>View</a>"
					+"<a class=\"btn btn-info btn-sm\" href=\"#\">"
					+"<i class=\"fas fa-pencil-alt\"></i>Edit</a>"
					+"<a class=\"btn btn-danger btn-sm\" href=\"member_ban/"+ n.id +"\" onclick=\"return false;\">"
					+"<i class=\"fas fa-trash\"></i>Ban</a></td></tr>";
					
					$('#companybody').append(tr);
					})				
				}
			},
			error: function () {
				console.log('error');
			}
		});
	};


});