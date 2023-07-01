<%@ Control Language="C#" AutoEventWireup="true" %>
<%@ OutputCache Duration="36000000" Shared="true" VaryByParam="none" %>
<%@ Register Src="~/eg_/sym_/_aes/JsUp.ascx" TagPrefix="uc1" TagName="JsUp" %>
<%@ Register Src="~/eg_/sym_/aes_/_gcm/Js.ascx" TagPrefix="uc1" TagName="Js" %>



<uc1:JsUp runat="server" ID="JsUp" />
<uc1:Js runat="server" ID="Js" />
