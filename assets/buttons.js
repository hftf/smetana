var failed = false;

function fixwidth(el) {
	if (!failed) {
		try {
			el.width = el.contentDocument.rootElement.width.baseVal.value;
		}
		catch (e) {
			failed = true;
		}
	}
}
