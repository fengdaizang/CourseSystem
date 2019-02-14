$(function(){
	$('form').bootstrapValidator({
	message: 'This value is not valid',
	feedbackIcons: {
		valid: 'glyphicon glyphicon-ok',
		invalid: 'glyphicon glyphicon-remove',
 		validating: 'glyphicon glyphicon-refresh'
	},
	fields: {
		username:{
			container:'#accountLabel',
			message: '用户名验证失败',
			validators: {
				notEmpty: {
					message: '用户名不能为空'
				},
				regexp: {
	                regexp: /^[a-zA-Z0-9_-]{4,16}$/,
	                message: '请输入4-16位(字母,数字,下划线,减号)'
	            }
 			} 			
		},
		password: {
			container:'#passwordLabel',
			validators: {
				notEmpty: {
					message: '密码不能为空'
				},
				regexp: {
	                regexp: /^([A-Z]|[a-z]|[0-9]|[`-=[];,.~!@#$%^*()_+}{:?]){6,16}$/,
	                message: '请输入6-16位(字母,数字,符号)'
	            }
			}
		},		
		confirmPassword: {
			container:'#confirmPasswordLabel',
			validators: {
				notEmpty: {
					message: '密码不能为空'
				},
				identical: {
					field: 'password',
					message: '两次密码不相同'
				},
			}
		},
		name: {
			container:'#nameLabel',
			validators: {
				notEmpty: {
					message: '姓名不能为空'
				}
			}
		},
		email: {
			container:'#emailLabel',
			message: '邮箱验证失败',
			validators: {
				notEmpty: {
					message: '邮箱不能为空'
				},
				regexp: {
	                regexp:/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/,
	                message: '请输入正确的邮箱格式'
	            }
 			} 			
		},
		birthday: {
			container:'#birthdayLabel',
			validators: {
				notEmpty: {
					message: '请选择生日'
				}
 			}
		},
		jcaptcha: {
			container:'#jcaptchaLabel',
			validators: {
				notEmpty: {
					message: '请输入验证码'
				}
 			}
		},
		gender: {
			container:'#genderLabel',
			validators: {
				notEmpty: {
					message: '请阅读并同意协议'
				}
			}
		}
	}
});
});