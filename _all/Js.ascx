<%@ Control Language="C#" AutoEventWireup="true" %>
<%@ Register Src="~/_this/Js.ascx" TagPrefix="uc1" TagName="Js" %>
<%@ Register Src="~/_egs/JsUp.ascx" TagPrefix="uc1" TagName="JsUp" %>



<%--<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>--%>
<%--<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<!--#include VIRTUAL="~/Views/Shared/Header.aspx"-->
<!--#include file="/header/header.inc"-->--%>
<uc1:Js runat="server" id="Js" />

<uc1:JsUp runat="server" id="JsUp" />
