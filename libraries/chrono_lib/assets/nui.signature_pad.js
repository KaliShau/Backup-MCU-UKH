Nui.Extensions.signature_pad = {};
Nui.Extensions.signature_pad.init = function (node, selector) {
	if (selector == undefined) {
		selector = 'canvas[data-signature]';
	}

	node.querySelectorAll(selector).forEach(function (canvas) {
		signaturePad = new SignaturePad(canvas);
		signaturePad.addEventListener("afterUpdateStroke", e => {
			canvas.closest(".field").querySelector("input[type=hidden]").value = signaturePad.toDataURL();
		})

		pstyle = getComputedStyle(canvas.parentElement)
		canvas.width = canvas.parentElement.offsetWidth - parseFloat(pstyle.paddingLeft) - parseFloat(pstyle.paddingRight);
		canvas.height = canvas.parentElement.offsetHeight - parseFloat(pstyle.paddingTop) - parseFloat(pstyle.paddingBottom);

		if(canvas.closest(".field").querySelector("button[data-action='clear']")){
			canvas.closest(".field").querySelector("button[data-action='clear']").addEventListener("click", e => {
				signaturePad.clear();
				canvas.closest(".field").querySelector("input[type=hidden]").value = "";
			})
		}
	})

}