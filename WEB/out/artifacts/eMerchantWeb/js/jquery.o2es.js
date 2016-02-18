/**
*wrote by BobbyNie
*you can use it ,Distribute it, and edit it
*email bobbynie@139.com
*/

(function ($) {
	if ($.toEvalString) return;

	var _meta = {
		'\b': '\\b',
		'\t': '\\t',
		'\n': '\\n',
		'\f': '\\f',
		'\r': '\\r',
		'"': '\\"',
		'\\': '\\\\'
	};
	var _escapeable = /["\\\x00-\x1f\x7f-\x9f]/g;

	var quoteString = function (string) {
		if (string.match(_escapeable)) {
			return '"' + string.replace(_escapeable, function (a) {
				var c = _meta[a];
				if (typeof c === 'string')
					return c;
				c = a.charCodeAt();
				return '\\u00' + Math.floor(c / 16).toString(16)
												+ (c % 16).toString(16);
			}) + '"';
		}
		return '"' + string + '"';
	};

	//replace . to .. in key
	var dk = function (k) {
		return k.replace(/\./ig, "..");
	}



	//mark obj members' reference infomation recursively
	var mark = function (obj, addr, opt) {
		if (obj != null && obj != undefined && typeof (obj) == 'object') {
			for (i = 0; i < opt.marked.length; i++) {
				if (opt.marked[i].obj === obj) {
					opt.referedAddrIndxs[addr] = opt.marked[i].name; //add to refered
					opt.firstreferedAddrIndxs[opt.marked[i].ref] = opt.marked[i].name; //add to first refered
					if (addr.indexOf(opt.marked[i].ref) == 0) {
						opt.referedBySelf[opt.marked[i].ref] = { name: opt.marked[i].name, cons: obj.constructor }; //the obj refered by it's descentdant 
					}
					return opt.marked[i].name;
				}
			}
			//the object not find in marked then push it into marked
			opt.marked.push({ obj: obj, name: "_" + opt.indx, ref: addr });
			opt.indx++;

			for (var k in obj) {
				mark(obj[k], [addr, dk(k)].join("."), opt);
			}
		}
	};


	/**
	*recursive function for toEvalString
	*/
	var conventer = function (o, out, addr, referedAddrIndxs, firstreferedAddrIndxs, referedBySelf) {

		if (referedAddrIndxs[addr] !== undefined && firstreferedAddrIndxs[addr] === undefined) {
			return referedAddrIndxs[addr];
		}

		var type = typeof (o);
		var rs = "";

		if (o === null) {
			return "null";
		}

		if (type == "undefined")
			return "undefined";

		switch (type) {
			case "number":
			case "boolean":
				rs = o + "";
				break;
			case "string":
				rs = quoteString(o);
				break;
			case 'object':
				if (o.constructor === Date) {
					rs = '"new Date(' + o.getTime() + ')"';
				} else if (o.constructor === Array) {
					var ret = [];
					for (var i = 0; i < o.length; i++) {
						if (referedBySelf[addr]) {
							out.push([referedBySelf[addr].name, "['", i, "']=", conventer(o[i], out, [addr, i].join("."), referedAddrIndxs, firstreferedAddrIndxs, referedBySelf), ";"].join(""));
						} else {
							ret.push(conventer(o[i], out, [addr, i].join("."), referedAddrIndxs, firstreferedAddrIndxs, referedBySelf));
						}
					}
					rs = "[" + ret.join(",") + "]";
				} else {
					var pairs = [];
					for (var k in o) {
						var name;
						type = typeof k;

						if (type == "number")
							name = '"' + k + '"';
						else if (type == "string")
							name = quoteString(k);
						else
							continue; // skip non-string or number keys 

						if (typeof o[k] == "function")
							continue; // skip pairs where the value is a function. 
						if (referedBySelf[addr]) {
							out.push([referedBySelf[addr].name, "[", name, "]=", conventer(o[k], out, [addr, dk(k)].join("."), referedAddrIndxs, firstreferedAddrIndxs, referedBySelf), ";"].join(""));
						} else {
							var val = conventer(o[k], out, [addr, dk(k)].join("."), referedAddrIndxs, firstreferedAddrIndxs, referedBySelf);
							pairs.push(name + ":" + val);
						}
					}
					rs = "{" + pairs.join(",") + "}";

				}

				if (firstreferedAddrIndxs[addr] !== undefined) {
					if (!referedBySelf[addr]) {
						out.push("var ");
						out.push(firstreferedAddrIndxs[addr]);
						out.push("=");
						out.push(rs);
						out.push(";");
					}
					rs = firstreferedAddrIndxs[addr];
				}
				break;
			case 'function':
				//can't convert functions
				break;
		}
		if (firstreferedAddrIndxs[addr] !== undefined) {
			return firstreferedAddrIndxs[addr];
		}

		return rs;
	};
 
	$.toEvalString = function (o) {
		var indx = 0, i;
		var marked = []; //rember marked objs
		var out = []; //buffer for output 
		var referedAddrIndxs = {}; //rember refered addrs
		var firstreferedAddrIndxs = {}; //rember first refered addrs 
		var referedBySelf = {};

		//mark refered 
		mark(o, "r", { marked: marked, indx: indx, referedAddrIndxs: referedAddrIndxs, firstreferedAddrIndxs: firstreferedAddrIndxs, referedBySelf: referedBySelf });

		//convent object
		var reto = conventer(o, out, "r", referedAddrIndxs, firstreferedAddrIndxs, referedBySelf);

		var vout = [];
		for (i in referedBySelf) {
			vout.push("var ");
			vout.push(referedBySelf[i].name);
			if (referedBySelf[i].cons === Array) {
				vout.push("=[];");
			} else {
				vout.push("={};");
			}
		}

		return "(function(){" + vout.join("") + out.join("") + "return " + reto + ";})()";

	}; 
})(jQuery);