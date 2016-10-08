var utils = {
    encMap: function (b) {
        if (b != "")
            return b.replace("<", "&lt;").replace(">", "&gt;").replace('"', "&quot;").replace("'", "&#39;").replace("&", "&amp;").replace(";", "；").replace(",", "，");
        else
            return "";
    },
    dateFormat: function (a, b) {
        var c = new Date;
        "object" == typeof a ? c = a : "string" == typeof a && (c = a.match(/\d{9,}/g) ? new Date(parseInt(a.replace(/\D+/g, ""))) : new Date(a.replace(/-/gi, "/")));
        var d = c.getFullYear(), e = c.getMonth() + 1, f = c.getDate(), g = c.getHours(), h = c.getMinutes(), i = c.getSeconds();
        return e = 10 > e ? "0" + e : e, f = 10 > f ? "0" + f : f, g = 10 > g ? "0" + g : g, h = 10 > h ? "0" + h : h, i = 10 > i ? "0" + i : i, b = b || "yy-mm-dd hh:min:sec", b.replace(/yy/gi, d).replace(/mm/gi, e).replace(/dd/gi, f).replace(/hh/gi, g).replace(/min/gi, h).replace(/sec/gi, i)
    },
    isEmpty: function (value) {
        value = value.replace(/\s+/g, '');
        return value === '' || value == null;
    }
};


