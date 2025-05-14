document.addEventListener("DOMContentLoaded", function (event) {
	let count = 0
	document.querySelectorAll(".form_item").forEach((item) => {
		if(parseInt(item.dataset.pid) > count){
			count = parseInt(item.dataset.pid)
		}
	})
	document.querySelectorAll(".form_page").forEach((item) => {
		if(parseInt(item.dataset.pid) > count){
			count = parseInt(item.dataset.pid)
		}
	})
	count++

	let buildPagesCount = function(){
		// build the pages counter
		let pcount = {}
		document.querySelector(".form_designer").querySelectorAll(".page_box").forEach((page, key) => {
			let pg = page.querySelector("input[name$='[pagegroup]']").value
			if(!Object.hasOwn(pcount, pg)){
				pcount[pg] = 0
			}
			pcount[pg]++

			if(pg.length > 0){
				page.querySelector(".page_counter").innerHTML = pg+" "+pcount[pg]
			}else{
				page.querySelector(".page_counter").innerHTML = pcount[pg]
			}
		})
	}

	let initBehaviorsSelect = function(parent){
		parent.querySelectorAll("select[data-behaviors]").forEach((select) => {
			select.addEventListener("optionSelected", (e) => {
				const xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function () {
					if (this.readyState == 4 && this.status == 200) {
						let behavior = Nui.Core.create_element(this.responseText)
						select.closest(".config").querySelector(".behaviors_list").append(behavior)
						Nui.Accordion.getInstance(select.closest(".config").querySelector(".behaviors_list")).init();
						Nui_boot(behavior)
					}
				};
				xhttp.open("GET", document.querySelector(".form_designer").getAttribute("data-url") + "&action=load_behavior&id="+select.closest(".draggable").dataset.pid+"&behavior="+e.detail+"&type="+select.closest(".draggable").querySelector("[name$='[type]']").value+"&name="+select.closest(".draggable").querySelector("[name$='[name]']").value);
				xhttp.send();
			})
			select.addEventListener("optionUnselected", (e) => {
				select.closest(".draggable").querySelector(".behavior_config[data-type='"+e.detail+"']").remove()
			})
		})
	}

	let setPageHeight = function(page){
		let height = 0;
		[...page.children].filter(e => e.matches("[data-tab]")).forEach(tab => {
			tab.style.display = "block !important"
			let dimensions = tab.getBoundingClientRect()
			tab.style.display = ""
			if(dimensions.height > height){
				height = dimensions.height
			}
		})
		// menuHeight = page.children[0].getBoundingClientRect().height
		// page.style.minHeight = (menuHeight + height)+"px"

		;[...page.children].filter(e => e.matches("[data-tab]")).forEach(tab => {
			tab.style.minHeight = height+"px"
		})
	}

	let setPagesHeights = function(){
		document.querySelector(".form_designer").querySelectorAll(".page_box").forEach((page, k) => {
			setPageHeight(page)
		})
	}

	// initialize page counter
	buildPagesCount()
	// initialize behaviors selectors
	initBehaviorsSelect(document)
	// init pages heights
	setPagesHeights()

	document.querySelector(".add_page").addEventListener("click", (e) => {
		let pageClone = document.querySelector(".page_box").cloneNode(true)
		let pid = pageClone.querySelector('[name$="[id]"]').value
		pageClone.querySelector('[name$="[id]"]').value = count;
		pageClone.querySelectorAll('[name^="elements['+pid+']"]').forEach(field => {
			field.setAttribute("name", field.getAttribute("name").replace('['+pid+']', ('['+count+']')))
		});
		pageClone.querySelector('[name^="elements['+count+'][title]"]').value = 'Page'+count
		pageClone.querySelector('[name^="elements['+count+'][alias]"]').value = 'page'+count
		pageClone.querySelector('.page-alias-display').innerText = 'page'+count
		pageClone.querySelectorAll("[data-pid]").forEach((parea) => {
			parea.dataset.pid = count;
			[...parea.children].forEach(child => {
				if(child.matches(".draggable")){
					child.remove()
				}
			})
			// while(parea.firstChild){
			// 	if(parea.lastChild.matches(".draggable")){
			// 		parea.removeChild(parea.lastChild);
			// 	}
			// }
		})
		pageClone.querySelectorAll("div").forEach((parea) => {
			if(parea.hasAttribute("style")){
				parea.setAttribute("style", "min-height:200px")
			}
		})
		
		document.querySelector(".form_designer").append(pageClone)
		Nui_boot(pageClone)
		count++

		buildPagesCount()

		// setPagesHeights()
	})

	new Nui.Draggables(".page_box", ".form_designer", {
		draggerSelector: ".drag_page",
		onClone : (draggable) => {
			document.querySelector(".form_designer").querySelectorAll(".page_box").forEach((item) => {
				item.classList.add("disabled")
			})
			return Nui.Core.create_element(`<div class="nui segment bordered rounded slate bold">Page</div>`)
		},
		"onDrop" : (draggable) => {
			buildPagesCount()
			document.querySelector(".form_designer").querySelectorAll(".page_box").forEach((item) => {
				item.classList.remove("disabled")
			})

			// setPagesHeights()
		},
	})

	new Nui.Draggables(".draggable.form_item", ".droppable", {
		draggerSelector: ".drag_item",
		sortableSelector: ".draggable",
		"onDrop" : (draggable) => {
			draggable.querySelector('[name$="[parent]"]').value = draggable.parentElement.getAttribute("data-pid")
			draggable.querySelector('[name$="[section]"]').value = draggable.parentElement.getAttribute("data-section")
		},
		"onClone" : (draggable) => {
			return Nui.Core.create_element(`<div class="nui segment bordered rounded slate bold">`+draggable.dataset.title+`</div>`)
		},
		// "onEnterDroppable" : (draggable, droppable) => {
		// 	document.querySelectorAll(".form_item:not(.area):not(.action)").forEach((item) => {
		// 		item.classList.add("disabled")
		// 	})
		// },
		// "onExitDroppable" : (draggable, droppable) => {
		// 	document.querySelectorAll(".form_item:not(.area):not(.action)").forEach((item) => {
		// 		item.classList.remove("disabled")
		// 	})
		// },
	})
	new Nui.Draggables(".draggable.original_item", ".droppable", {
		// draggerSelector: ".drag_item",
		sortableSelector: ".draggable",
		"onDrop" : (clone) => {
			const xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function () {
				if (this.readyState == 4 && this.status == 200) {
					let codePieces = this.responseText.split("<!--config-->")
					let item = Nui.Core.create_element(codePieces[0])

					clone.replaceWith(item)
					Nui_boot(item)

					initBehaviorsSelect(item)
					
					count++

					setPageHeight(item.closest(".page_box"))
				}
			};
			let url = document.querySelector(".form_designer").getAttribute("data-url") + "&action=load_element&"
			let url_params = new URLSearchParams({
				"id": count,
				"pid": clone.closest("[data-pid]").dataset.pid,
				"type": clone.dataset.type,
				"name": clone.dataset.name,
				"section": clone.closest("[data-section]").dataset.section,
			})
			
			xhttp.open("GET", url+url_params.toString())

			// let link = document.querySelector(".form_designer").getAttribute("data-url") + "&action=load_element&type="+clone.dataset.type+"&name="+clone.dataset.name+"&id="+count+"&pid="+clone.closest("[data-pid]").dataset.pid
			
			// link = link+"&section="+clone.closest("[data-section]").dataset.section

			// xhttp.open("GET", link);
			xhttp.send();
		},
		"onEnterDroppable" : (draggable, droppable) => {
			document.querySelectorAll(".form_item").forEach((item) => {
				// item.classList.add("disabled")
				item.querySelector(".actions").classList.add("invisible");
			})
		},
		"onExitDroppable" : (draggable, droppable) => {
			document.querySelectorAll(".form_item").forEach((item) => {
				// item.classList.remove("disabled")
				item.querySelector(".actions").classList.remove("invisible");
			})
		},
	})

	document.addEventListener("click", function (e) {
		if (e.button === 0 && e.target.matches(".remove_item")) {
			let item = e.target.closest(".draggable")
			if (item != null){
				item.remove()
			}
		}
	})

	document.addEventListener("click", function (e) {
		if (e.button === 0 && e.target.matches(".edit_item")) {
			let item = e.target.closest(".draggable")
			if (item != null){
				// item.querySelectorAll(".config")[item.querySelectorAll(".config").length - 1].classList.toggle("hidden")
				item.classList.toggle("selected")
			}
		}
	})

	// document.addEventListener("click", function (e) {
	// 	if (e.button === 0 && e.target.matches(".copy_item")) {
	// 		let item = e.target.closest(".draggable")
	// 		let clone = item.cloneNode(true)
			
	// 		let item_id = item.getAttribute("data-pid")
	// 		// copy_html = copy_html.replace('['+item_id+']', '['+count+']')
	// 		clone.setAttribute("data-pid", count)
	// 		clone.querySelector("input[name='elements["+item_id+"][id]']").value = count
	// 		clone.querySelectorAll("input, textarea, select").forEach(input => {
	// 			if(input.hasAttribute("name")){
	// 				input.setAttribute("name", input.getAttribute("name").replace('['+item_id+']', '['+count+']'))
	// 			}
	// 			if(input.hasAttribute("id")){
	// 				let id = input.getAttribute("id")
	// 				input.setAttribute("id", input.getAttribute("id").replace('elements_'+item_id+'_', 'elements_'+count+'_'))

	// 				clone.querySelector("label[for='"+id+"']").setAttribute("for", id.replace('elements_'+item_id+'_', 'elements_'+count+'_'))
	// 			}
	// 		})
	// 		let dummy = Nui.Core.create_element(`<div></div>`)
	// 		dummy.append(clone)
	// 		let copy_html = dummy.innerHTML
	// 		let copy = Nui.Core.create_element(copy_html)
	// 		item.after(copy)
	// 		console.log(copy)
	// 		Nui_boot(copy)
	// 		initBehaviorsSelect(copy)
	// 		count++
	// 		// console.log(copy_html)
	// 	}
	// })

	document.addEventListener("mouseover", function (e) {
		let item = e.target.closest(".form_item")
		if (item != null){
			[...item.children].filter(e => e.matches(".actions"))[0].classList.remove("hidden")
		}
	})

	document.addEventListener("mouseout", function (e) {
		let item = e.target.closest(".form_item")
		if (item != null){
			[...item.children].filter(e => e.matches(".actions"))[0].classList.add("hidden")
		}
	})

	document.addEventListener("click", function (e) {
		if (e.button === 0 && e.target.matches(".remove_page")) {
			let item = e.target.closest(".page_box")
			if (item != null){
				item.remove()
			}
		}
	})

	document.addEventListener("click", function (e) {
		if (e.button === 0 && e.target.matches(".minimize_page")) {
			let item = e.target.closest(".page_box")
			if (item != null){
				item.classList.add("minimized")
				item.querySelector("input[name$='[minimized]']").value = 1
				item.querySelector(".maximize_page").classList.remove("hide_maximized")
			}
		}
	})

	document.addEventListener("click", function (e) {
		if (e.button === 0 && e.target.matches(".maximize_page")) {
			let item = e.target.closest(".page_box")
			if (item != null){
				item.querySelector("input[name$='[minimized]']").value = ""
				item.querySelector(".maximize_page").classList.add("hide_maximized")
				item.classList.remove("minimized")
			}
		}
	})

	document.querySelectorAll(".page_box").forEach(page_box => {
		if(page_box.querySelector("input[name$='[minimized]']").value == "1"){
			page_box.classList.add("minimized")
		}else{
			page_box.querySelector(".maximize_page").classList.add("hide_maximized")
		}
	})

	// document.addEventListener("scroll", e => {
	// 	let tools_box = document.querySelector(".tools_box")
	// 	let ydiff = window.screenY - tools_box.parentElement.getBoundingClientRect().top
	// 	if(ydiff > -20){
	// 		tools_box.style.top = (window.screenY - tools_box.parentElement.getBoundingClientRect().top + 20) + "px"
	// 	}else{
	// 		tools_box.style.top = "0px"
	// 	}
	// })

	document.addEventListener("optionSelected", e => {
		if (e.target.matches("[data-formbuilder_dynamicevents]")) {
			dropdown = e.target
			event_name = e.detail
			id = dropdown.getAttribute("data-formbuilder_dynamicevents")
			if(!dropdown.closest("[data-pid='"+id+"']").querySelector('[data-pid="'+id+'"][data-section="'+event_name+'"]')){
				let color = 'blue'
				let title = event_name
				if(dropdown.querySelector('option[value="'+event_name+'"][data-html]')){
					new_label = Nui.Core.create_element(dropdown.querySelector('option[value="'+event_name+'"][data-html]').getAttribute("data-html"))
					color = new_label.getAttribute("class").replace("nui label", "")
					title = new_label.innerText
				}
				new_event = Nui.Core.create_element('<div class="nui p1 flex vertical spaced bottom block dashed bordered rounded droppable sortable '+color+'" data-pid="'+id+'" data-section="'+event_name+'" data-title="'+title+'" style="min-height:50px;" data-hint=""></div>')
				dropdown.closest("[data-pid='"+id+"']").append(new_event)
			}
		}
	})
	document.addEventListener("optionUnselected", e => {
		if (e.target.matches("[data-formbuilder_dynamicevents]")) {
			dropdown = e.target
			event_name = e.detail
			id = dropdown.getAttribute("data-formbuilder_dynamicevents")
			dropdown.closest("[data-pid='"+id+"']").querySelector("[data-section='"+event_name+"']").remove()
		}
	})

	document.addEventListener("input", e => {
		if (e.target.matches("input[name$='[label]']")) {
			label = e.target
			if(label.closest(".fields") && label.closest(".fields").querySelector("input[name$='[fieldname]']") && label.closest("form").hasAttribute("data-autofieldname")){
				label.closest(".fields").querySelector("input[name$='[fieldname]']").value = label.value.toLowerCase()
				.normalize('NFD') // Normalize to split letters and diacritical marks
				.replace(/[\u0300-\u036f]/g, '') // Remove diacritical marks
				.replace(/^[^a-zA-Z]+/, '') // Remove leading non-alphabetic characters
				.replace(/[^a-z0-9_-]+/g, '_') // Replace invalid characters with underscores
				.replace(/_+$/, ''); // Remove trailing underscores
				
				// .toLowerCase().replace(/^[^a-zA-Z]+/, '').replace(/[^a-z0-9_-]+/g, '_').replace(/_+$/, ''); 
			}
		}
	})

	document.addEventListener("change", e => {
		if (e.target.matches("input[name$='[pagegroup]']")) {
			buildPagesCount()
		}
	})

	document.addEventListener("input", e => {
		if (e.target.matches("input[name$='[alias]']")) {
			e.target.closest(".page_box").querySelector(".page-alias-display").innerText = e.target.value
		}
	})

	document.addEventListener("click", e => {
		if (e.target.matches(".show-settings")) {
			link = e.target
			if(link.closest(".draggable").querySelector(".settings-box")){
				link.closest(".draggable").querySelector(".settings-box").classList.toggle("hidden")
			}
		}
	})

	document.addEventListener("input", e => {
		if (e.target.matches("input[name$='[settings][name]']")) {
			input = e.target
			input.closest(".draggable").querySelector(".show-settings").innerText = e.target.value
		}
	})

	// function SetStylesLabels(input){
	// 	labels = []
	// 	input.closest(".item").querySelectorAll("[name*='[style][css]']:not(textarea[name$='[output]'])").forEach(property => {
	// 		if(property.value.length > 0){
	// 			labels.push(property.closest(".field").querySelector("small").innerHTML)
	// 		}
	// 	})
	// 	input.closest(".item").querySelector(".title").querySelectorAll(".nui.label").forEach(label => {
	// 		label.remove()
	// 	});
	// 	labels.forEach(label => {
	// 		input.closest(".item").querySelector(".title").append(Nui.Core.create_element('<div class="nui label green">'+label+'</div>'))
	// 	})
	// }

	document.querySelectorAll("[name*='[style][css]']:not(textarea[name$='[output]'])").forEach(input => {
		if(input.value.length > 0){
			input.closest(".item").querySelector(".title").append(Nui.Core.create_element('<div class="nui label green">'+input.closest(".field").querySelector("small").innerHTML+'</div>'))
		}
	})
	
	document.addEventListener("change", e => {
		if (e.target.matches("[name*='[style][css]']")) {
			input = e.target
			let css = []
			input.closest("[data-screen]").querySelectorAll("[name*='[style][css]']:not(textarea[name$='[output]'])").forEach(property => {
				if(property.value.length > 0){
					css.push(property.getAttribute("name").split("[").pop().replace(/\]/, '')+":"+property.value)
				}
			})
			input.closest("[data-screen]").querySelector("textarea[name$='[output]']").value = css.join(";")+";"

			labels = []
			input.closest(".item").querySelectorAll("[name*='[style][css]']:not(textarea[name$='[output]'])").forEach(property => {
				if(property.value.length > 0){
					labels.push(property.closest(".field").querySelector("small").innerHTML)
				}
			})
			input.closest(".item").querySelector(".title").querySelectorAll(".nui.label").forEach(label => {
				label.remove()
			});
			labels.forEach(label => {
				input.closest(".item").querySelector(".title").append(Nui.Core.create_element('<div class="nui label green">'+label+'</div>'))
			})
		}
	})

	document.addEventListener("change", e => {
		if (e.target.matches("select[name$='[style][screen]']")) {
			e.target.closest(".config").querySelectorAll("[data-screen]").forEach(element => {
				element.classList.add("hidden")
			});
			e.target.closest(".config").querySelector("[data-screen='"+e.target.value+"']").classList.remove("hidden")
		}
	})

	document.addEventListener("change", e => {
		if (e.target.matches("select[name*='[style][css]'][name$='[display]']")) {
			e.target.closest(".item").querySelectorAll(".options").forEach(element => {
				element.classList.add("hidden")
			});
			if(e.target.closest(".item").querySelector(".options."+e.target.value+"-options")){
				e.target.closest(".item").querySelector(".options."+e.target.value+"-options").classList.remove("hidden")
			}
		}
	})
	document.addEventListener("change", e => {
		if (e.target.matches("select[name$='[child-of]']")) {
			e.target.closest(".item").querySelectorAll(".child-options").forEach(element => {
				element.classList.add("hidden")
			});
			if(e.target.closest(".item").querySelector(".child-options."+e.target.value+"-options")){
				e.target.closest(".item").querySelector(".child-options."+e.target.value+"-options").classList.remove("hidden")
			}
		}
	})

	new Nui.Draggables(".clonable.sortable", ".clonable_container", {
		draggerSelector: ".drag_item",
		sortableSelector: ".clonable.sortable",
	})

	document.addEventListener("input", e => {
		if (e.target.matches("input[data-eventname]")) {
			let div = e.target.closest(".draggable").querySelector(".droppable[data-eventname='"+e.target.getAttribute("data-eventname")+"']")
			div.setAttribute("data-section", e.target.value)
			div.setAttribute("data-title", e.target.value)
			if(div.children.length > 0){
				Array.from(div.children).forEach(child => {
					if(child.matches("div.draggable")){
						child.querySelector('input[name$="[section]"]').value = e.target.value
					}
				})
			}
		}
	})

	document.addEventListener("cloneAdded", e => {
		if (e.target.matches(".clonable")) {
			let clone = e.detail
			if(clone.querySelector('input[data-eventname]')){
				let ts = Date.now()
				clone.querySelector('input[data-eventname]').setAttribute("data-eventname", ts)
				let droppable = `<div class="nui p1 flex vertical spaced bottom block dashed bordered rounded droppable sortable blue" data-pid="`+e.target.closest(".draggable").getAttribute("data-pid")+`" data-section="" data-title="" data-eventname="`+ts+`" style="min-height:50px;" data-hint=""></div>`
				e.target.closest(".draggable").append(Nui.Core.create_element(droppable))
			}
		}
	})

	document.addEventListener("cloneRemoved", e => {
		if (e.target.matches(".clonable")) {
			let clone = e.detail
			if(clone.querySelector('input[data-eventname]')){
				clone.closest(".draggable").querySelector('.droppable[data-eventname="'+clone.querySelector('input[data-eventname]').value+'"]').remove()
			}
		}
	})
})