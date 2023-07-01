<%@ Control Language="C#" AutoEventWireup="true" %>
<%@ OutputCache Duration="36000000" Shared="true" VaryByParam="none" %>

<%@ Register Src="~/eg_/sym_/_aes/Js.ascx" TagPrefix="uc1" TagName="Js" %>
<%@ Register Src="~/eg_/sym_/aes_/_gcm/Js.ascx" TagPrefix="uc2" TagName="Js" %>


<uc1:Js runat="server" id="Js" />
<uc2:Js runat="server" ID="Js1" />
