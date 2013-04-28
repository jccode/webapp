<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>系统管理-人员管理</title>
		<link rel="stylesheet" href="${webRoot}/static/assert/css/bootstrap.min.css">
		<link rel="stylesheet" href="${webRoot}/static/assert/css/main.css">
		<style type="text/css">
			body {
				/*padding: 50px 0px;*/
				/*background-color: #f5f5f5;*/
			}

			#editForm {
				margin-bottom: 0px;
			}
		</style>
	</head>
	<body>
		<div class="row-fluid container-fixed">
			<div class="span12">
				<div class="querybar">
					<div class="row-fluid">
						<div class="span8">
						</div>
						<div class="span4 btn-right">
							<button type="button" class="btn" id="btn_delete" data-toggle="button">删除</button>
							<button type="button" class="btn" id="btn_edit" data-toggle="button">编辑</button>
							<button type="button" class="btn" id="btn_insert" data-toggle="button">新增</button>
						</div>
					</div>
				</div>
				<div id="userList" class="common-list group-list">
					<ul>
						<c:forEach items="${users }" var="user">
						<li id="item_${user.id }">
							<div class="list-item">
								<div class="pic">
									<img id="img_${user.id }" src="${webRoot}/${user.image}" alt="${user.name }">
								</div>
								<div class="btns hide">
									<i class="icon2-edit" value="${user.id }"></i>
								</div>
								<div class="text">
									<div class="view">
										<p class="header">${user.name }</p>
										<p class="detail">${user.email }</p>
									</div>
								</div>
							</div>
						</li>
						</c:forEach>
					</ul>
				</div>

				<!-- pagination -->
				<div id="page"></div>
				<input type="hidden" id="pageNo" value="${pageNo}">
				<input type="hidden" id="pageSize" value="${pageSize}">
				<input type="hidden" id="pageCount" value="${pageCount}">


				<div id="add_panel" class="panel-bottom hide">
					<form id="userForm" name="user" action="${webRoot}/user" class="group-list" method="POST" enctype="multipart/form-data">
						<div class="pic">
							<div class="img-wapper"><img id="image-preview" src="" data-toggle="tooltip" data-placement="right" data-original-title="图片不能为空" data-validate="imgValid();"></div>
							<div class="img-tips hide">点击上传图片</div>
							<input type="file" id="file-upload" name="file" class="hide">
						</div>
						<div class="btns">
							<button class="btn btn-primary btn-large" id="btn_save_group">保存</button>
						</div>
						<div class="text">
							<div class="row-fluid">
								<div class="span5">
									<div class="control-group control-group-small">
										<label for="" class="control-label">用户名</label>
										<div class="controls"><input type="text" id="userName" name="name" class="input-block-level" data-toggle="tooltip" data-original-title="用户名不能为空" data-validate></div>
									</div>
								</div>
								<div class="span2"></div>
								<div class="span5">
									<div class="control-group control-group-small">
										<label for="" class="control-label">密码</label>
										<div class="controls"><input type="text" id="password" name="password" class="input-block-level" data-toggle="tooltip" data-original-title="密码不能为空" data-validate></div>
									</div>
								</div>
							</div>

							<div class="control-group control-group-small">
								<label for="" class="control-label">email</label>
								<div class="controls">
									<input type="text" name="email" id="email" class="input-block-level" data-toggle="tooltip" data-original-title="email不能为空" data-validate>
								</div>
							</div>

						</div>
					</form>
				</div>


				<form id="editForm" name="user" action="${webRoot}/user" method="POST" enctype="multipart/form-data" class="hide">
					<input type="hidden" name="id">
					<input type="hidden" name="image">
					<input type="file" id="edit-file-upload" name="file" class="hide">

					<div class="edit">
						<div class="row-fluid">
							<div class="span5">
								<div class="control-group control-group-small">
									<label for="" class="control-label">用户名</label>
									<div class="controls"><input type="text" name="name" class="input-block-level" value="" data-toggle="tooltip" data-original-title="用户名不能为空" data-validate></div>
								</div>
							</div>
							<div class="span2"></div>
							<div class="span5">
								<div class="control-group control-group-small">
									<label for="" class="control-label">密码</label>
									<div class="controls"><input type="text" name="password" class="input-block-level" value="" data-toggle="tooltip" data-original-title="密码不能为空" data-validate></div>
								</div>
							</div>
						</div>
						<div class="control-group control-group-small">
							<label for="" class="control-label">email</label>
							<div class="controls">
								<input type="text" name="email" class="input-block-level" value="" data-toggle="tooltip" data-original-title="email不能为空" data-validate>
							</div>
						</div>
					</div>
				</form>

			</div>
		</div><!--/ end of container -->

		<script src="${webRoot }/static/assert/seajs/sea.js" data-config="${webRoot }/static/assert/js/config" data-main="${webRoot }/static/assert/js/user"></script>
		<script type="text/javascript">
			function imgValid() {
				return !!$("#file-upload").get(0).files[0];
			}
		</script>
		<%-- 
		<script type="text/javascript" src="${webRoot}/static/assert/js/jquery-1.8.0.js"></script>
		<script type="text/javascript" src="${webRoot}/static/assert/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${webRoot}/static/assert/js/jquery.bootstrap.extension.js"></script>
		<script type="text/javascript" src="${webRoot}/static/assert/js/jquery.form.js"></script>
		<script type="text/javascript" src="${webRoot}/static/assert/js/jquery.pagination.js"></script>
		<script type="text/javascript" src="${webRoot}/static/assert/js/util.js"></script>
		<script type="text/javascript">

			var webRoot = '${webRoot}', 

				Init = (function($) {

				
				return {
					//main
					run: function () {
						for(var fn in Init) {
							if(fn === "run" || fn.startsWith('_')) continue;
							Init[fn].call(window);
						}
					}, 

					btnEvent: function () {
						$("#btn_insert").toggleButton(insertBtnClick);

						$("#btn_edit").toggleButton(function (checked) {
							showRowEditBtn(checked, "icon2-edit");
						});
						
						$("#btn_delete").toggleButton(function(checked) {
							showRowEditBtn(checked, "icon2-remove");
						});

					},

					imageUpload: function () {
						$(".img-wapper").hover(function () {
							$(this).siblings(".img-tips").removeClass("hide");
						}, function () {
							$(this).siblings(".img-tips").addClass("hide");
						})
						.click(function() {
							$(this).siblings("input[type='file']").click();
						});
					}, 

					imagePreview: function () {
						imagePreview($("#file-upload"), $("#image-preview"));

						// when edit
						$("#edit-file-upload").change(function() {
							var img = this.files[0], 
								reader = new FileReader(), 
								userId = $(this).data("userId");
							
							reader.onload = function(evt) {
								$("#img_" + userId).attr("src", evt.target.result);
							}
							reader.readAsDataURL(img);
						});
					}, 

					resizeEvt: function () {
						$(window).bind("resize", resetHeight);
					}, 

					validate: function () {
						$.validation({
							root: $("#userForm")
						}).init();
					}, 

					submit: function () {

						// insert
						$("#userForm").submit(function () {
							var validated = $.validation({root: $("#userForm") }).check();
							console.log(validated);
							if(validated) {
								var options = {
									success: function (responseText, statusText, xhr, $form) {
										var data = responseText, 
											form = $form.get(0), 
											userName = form.name.value, 
											email = form.email.value;
										var user = {
											"name": userName, 
											"email": email, 
											"image": data.image, 
											"id": data.id
										};
										appendToList(user);
									}
								};
								$(this).ajaxSubmit(options);
							}
							return false;
						});

						// update
						$("#editForm").submit(function() {

							var validated = $.validation({
								root: $("#editForm")
							}).check();
							
							if(validated) {
								var userId = $("input[name='id']", this).val(), 
									options = {
										type: "POST", 
										url: webRoot+"/user/" + userId, 
										success: function(responseText, statusText, xhr, $form) {
											saveItemCallback(userId, $form);
										}
									};
								$(this).ajaxSubmit(options);
							}

							return false;
						});
					}, 

					// edit and delete operate btn
					operateEvent: function() {
						$(document).on("click", "#userList .btns i", function() {
							var $this = $(this), 
								userId = $this.attr("value");
							if($this.hasClass("icon2-remove")) {
								deleteItem(userId);
							} else if($this.hasClass("icon2-edit")) {
								editItem(userId);
							} else if($this.hasClass("icon2-ok")) {
								saveItem(userId);
							} else {
								throw "btns的样式必须是icon2-remove, icon2-edit, icon2-ok之一";
							}
						});
					}, 
					
					// event for edit/update record dynamic
					dynamicUpdateEvent: function() {
						$("#editForm").on("keypress", "input", function(e) {
							var keycode = e.which;
							if(keycode == 13 || keycode == 108) { // Enter
								saveItem($(this).attr("orderId"));
							}
						});
					}, 

					pagination: function() {
						$("#page").pagination({
							className: "pagination-right", 
							page: $("#pageNo").val(), 
							count: $("#pageCount").val(), 
							callback: function (current_page, new_page) {
								$("#pageNo").val(new_page);
								window.location.href = webRoot + "/user?n="+new_page;
							}, 
							refresh: false
						});
					}
				};

			})(jQuery);


			function insertBtnClick (checked) {
				var $addPanel = $("#add_panel"), 
					$userList = $("#userList"), 
					listHeight = $userList.height(), 
					winHeight = $(window).height(), 
					delta = 240;
				if(checked) {
					$userList.data("height", listHeight);

					if(listHeight + delta > winHeight) {
						$userList.height(winHeight - delta).addClass("overflow");
					}
					$addPanel.removeClass("hide");
				} else {
					$userList.height($userList.data("height")).removeClass("overflow");
					$addPanel.addClass("hide");
				}
			}

			function resetHeight () {
				var insertChecked = $("#btn_insert").hasClass("active");
				if(insertChecked) {
					$("#userList").height($(window).height() - 240);
				}
			}

			function showRowEditBtn(checked, className) {
				var $btns = $("#userList .btns");
				if(checked) {
					$btns.removeClass("hide").children("i").removeClass().addClass(className);
				} else {
					$btns.addClass("hide");
				}
			}

			function imgValid() {
				return !!$("#file-upload").get(0).files[0];
			}

			/**
			 */
			function appendToList(user) {
				var $firstItem = $("#userList > ul > li").eq(0), 
					$newNode = $firstItem.clone();
				$firstItem.before($newNode);
				$newNode.attr("id", "item_" + user.id);
				$("img", $newNode).attr("src", webRoot+"/"+user.image);
				$(".header", $newNode).html(user.name);
				$(".detail", $newNode).html(user.email);
				$(".btns i", $newNode).attr("value", user.id);
			}


			function deleteItem(userId) {
				var url = webRoot+"/user/" + userId;
				$.ajax({
					url: url, 
					type: "delete"
				})
				.done(function() {
					$("#item_"+userId).animate({
						opacity: 0, 
						height: 0
					}, 1000, function() {
						$(this).remove();
					});
				})
				.fail(function(jqXHR) {
					alert("删除失败. " + jqXHR.responseText);
				});
			}
			
			function editItem(userId) {
				changeMode(userId, "edit");
				fillEditForm(userId);

				$.validation({
					root: $("#editForm")
				}).init();
			}
			
			function saveItem(userId) {
				$("#editForm").submit();
			}

			function saveItemCallback(userId, $form) {
				changeMode(userId, "view");

				var $item = $("#item_" + userId), 
					editForm = $form.get(0);
				$(".text .header", $item).html(editForm.name.value);
				$(".text .detail", $item).html(editForm.email.value);
			}

			/**
			 * change mode
			 *
			 * @param mode edit | view
			 */
			function changeMode(userId, mode) {

				var $item = $("#item_" + userId), 
					$btn = $(".btns i", $item), 
					$pic = $(".pic", $item);

				if(mode === "edit") {
					$btn.removeClass().addClass("icon2-ok");
					$pic.addClass("pointer").on("click", function() {
						$("#edit-file-upload").data("userId", userId).click();
					});
					$(".text .view", $item).addClass("hide");
					$(".text", $item).append($("#editForm").removeClass("hide"));
				}
				else if(mode === "view") {
					$btn.removeClass().addClass("icon2-edit");
					$pic.removeClass("pointer").off("click");
					$(".text .view", $item).removeClass("hide");
					$("#editForm").addClass("hide");
				}
				else {
					throw "argument mode must be edit or view.";
				}
			}

			function fillEditForm(userId) {
				var $item = $("#item_" + userId), 
					editForm = $("#editForm").get(0), 
					url = webRoot + "/user/" + userId;
				$.getJSON(url).done(function(user) {
					editForm.id.value = user.id;
					editForm.name.value = user.name;
					editForm.password.value = user.password;
					editForm.email.value = user.email;
					editForm.image.value = user.image;
				});
			}


			jQuery(function ($) {

				Init.run();
			});

		</script>
		--%>
		
	</body>
</html>