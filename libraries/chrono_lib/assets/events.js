function HideField(form, selector){
	let field = form.querySelector(selector)
	if(field.closest(".field.holder")){
		field.closest(".field.holder").classList.add("hidden");
	}else{
		field.classList.add("hidden");
	}
}
function ShowField(form, selector){
	let field = form.querySelector(selector)
	if(field.closest(".field.holder")){
		field.closest(".field.holder").classList.remove("hidden");
	}else{
		field.classList.remove("hidden");
	}
}
function EnableField(form, selector){
	let field = form.querySelector(selector)
	if(field.closest(".field.holder")){
		field.closest(".field.holder").classList.remove("disabled");
	}else{
		field.classList.remove("disabled");
	}
	field.disabled = false;
}
function DisableField(form, selector){
	let field = form.querySelector(selector)
	if(field.closest(".field.holder")){
		field.closest(".field.holder").classList.add("disabled");
	}else{
		field.classList.add("disabled");
	}
	field.disabled = true;
}
function DisableValidation(form, selector){
	let field = form.querySelector(selector)
	field.setAttribute('disable-validations', '1');
	field.closest(".field.holder").classList.remove("error");
	if(field.closest(".field.holder").querySelector('.errormsg')){
		field.closest(".field.holder").querySelector('.errormsg').remove();
	};
	if(field.closest(".field.holder").querySelector('.errormark')){
		field.closest(".field.holder").querySelector('.errormark').classList.add('hidden');
	};
}
function EnableValidation(form, selector){
	let field = form.querySelector(selector)
	field.removeAttribute('disable-validations');
	if(field.closest(".field.holder").querySelector('.errormark')){
		field.closest(".field.holder").querySelector('.errormark').classList.remove('hidden');
	};
}
function CallFunction(name, form, selector){
	let field = form.querySelector(selector)
	if(typeof window[name] === 'function'){
		window[name](field)
	}
}
function SetValue(form, selector, values){
	let field = form.querySelector(selector)
	field.value = values[0]
}
function ClearValue(form, selector){
	let field = form.querySelector(selector)
	field.value = ""
}
function SubmitForm(form, selector){
	let field = form.querySelector(selector)
	field.closest("form").submit()
}
function SelectAll(checksone){
	document.querySelectorAll("input[name='"+checksone.getAttribute("name")+"']").forEach(check => {
		Nui.Checkbox.getInstance(check.closest(".nui.checkbox")).toggle()
	})
}
function AJAX(form, selector, url, fname){
	let field = form.querySelector(selector)
	field.closest("form").classList.add("loading");

	let postBody = new FormData(field.closest("form"))
	postBody.delete("chronopage")
	const xhttp = new XMLHttpRequest();

	xhttp.addEventListener("readystatechange", (e) => {
		field.closest("form").classList.remove("loading");
		if (e.target.readyState == 4 && e.target.status == 200) {
			if(typeof window[fname] === 'function'){
				window[fname](e.target.responseText, field)
			}
		}
	})

	xhttp.open("POST", url);
	xhttp.send(postBody);
}
function Reload(form, selector, url){
	let field = form.querySelector(selector)
	form.classList.add("loading");

	let postBody = new FormData(form)
	postBody.delete("chronopage")
	const xhttp = new XMLHttpRequest();

	xhttp.addEventListener("readystatechange", (e) => {
		form.classList.remove("loading");

		if (e.target.readyState == 4 && e.target.status == 200) {
			let results = Nui.Core.create_element(e.target.responseText, true)
			
			if(field.closest(".field.holder")){
				Array.from(results).forEach(item => {
					field.closest(".field.holder").before(item)
					Nui_boot(item)
				})
				Nui.Form.getInstance(form).init()
				field.closest(".field.holder").remove()
			}else{
				Array.from(results).forEach(item => {
					field.before(item)
					Nui_boot(item)
				})
				Nui.Form.getInstance(form).init()
				field.remove()
			}
		}
	})

	xhttp.open("POST", url);
	xhttp.send(postBody);
}
function LoadOptions(form, selector, url){
	let field = form.querySelector(selector)
	field.closest("form").classList.add("loading");

	let postBody = new FormData(field.closest("form"))
	postBody.delete("chronopage")
	const xhttp = new XMLHttpRequest();

	xhttp.addEventListener("readystatechange", (e) => {
		field.closest("form").classList.remove("loading");
		if (e.target.readyState == 4 && e.target.status == 200) {
			let options = JSON.parse(e.target.responseText)
			
			field.querySelectorAll("option").forEach((option) => {
				option.remove()
			})
			if (Array.isArray(options)) {
				Object.keys(options).forEach(key => {
					let opt = Nui.Core.create_element('<option value="'+options[key]["value"]+'">'+options[key]["text"]+'</option>')
					field.append(opt)
				})
				Nui.Dropdown.getInstance(field).init()
			} else {
				
			}
		}
	})

	xhttp.open("POST", url);
	xhttp.send(postBody);
}

function SetupEvent(form, selector, event, fn){
	let fields = form.querySelectorAll(selector);
	if(fields){
		document.addEventListener(event, e => {
			if(e.target.matches(selector) && e.target.matches(':not([type="hidden"])')){
				fn();
			}
		})
		// fields.forEach(f => {
		// 	document.addEventListener(event, e => {
		// 		console.log(selector, e.target, e.target.matches(':not([type="hidden"])'))
		// 		if(e.target.matches(selector) && e.target.matches(':not([type="hidden"])')){
		// 			fn();
		// 		}
		// 	})
		// });
	}
}

function GetValues(form, selector){
	let fields = form.querySelectorAll(selector);
	if(fields){
		let values = [];
		fields.forEach(f => {
			if(f.getAttribute('type') == 'checkbox' || f.getAttribute('type') == 'radio'){
				if(f.checked){
					values.push(f.value);
				}
			}else{
				if(f.value.length > 0){
					values.push(f.value);
				}
			}
		});
		return values;
	}

	return [];
}

function NotEmpty(s){
	return (s.length > 0)
}

function isEmpty(form, selector){
	let field = form.querySelector(selector)
	let values = GetValues(form, selector);
	return (values.length == 0);
}

function HasValue(form, selector, tvalues){
	let field = form.querySelector(selector)
	let values = GetValues(form, selector);
	let result = false;
	tvalues.forEach(v => {
		if(values.includes(v)){
			result = true;
			return;
		}
	});
	return result;
}

function Matches(form, selector, regex){
	let field = form.querySelector(selector)
	let values = GetValues(form, selector);
	let r = new RegExp(regex);
    return r.test(values[0]);
}