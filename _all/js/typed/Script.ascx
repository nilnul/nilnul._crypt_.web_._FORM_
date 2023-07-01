<%@ Control Language="C#" AutoEventWireup="true" %>
<%@ OutputCache Duration="36000000" Shared="true" VaryByParam="none" %>

<script runat="server">
	public string preRt { get {
			return nilnul._crypt_.web_._FORM_.Properties.settings.Url.Singleton.getPreRt();
		} }

	protected void Page_Load(object sender, EventArgs args) {
		var t = preRt;
	}
</script>

<script src="<%= 
	nilnul._crypt_.web_._FORM_.Properties.settings.Url.Singleton.preRt 
		+  ResolveUrl("../Type8js.aspx")
	%>"></script>
