<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Js.ascx.cs" Inherits="nilnul._crypt_.web_._FORM_.eg_.comm_._ecdh.Js" %>


<%--<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>--%>
<%--<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<!--#include VIRTUAL="~/Views/Shared/Header.aspx"-->
<!--#include file="/header/header.inc"-->--%>


<%-- 

	--%>

<% #if false %>

<script>

<% #endif %>

	(function (nilnul) {
		let
			/**
@returns {privateKey,publicKey} keyPair|ducat
		 */
			generateDucatAsyn = async function () {
				return await window.crypto.subtle.generateKey(
					{
						name: "ECDH",
						namedCurve: "P-384"
					},
					false,
					["deriveKey"]
				);
			}
			,
			/*
			Derive an AES key, given:
			- our ECDH private key
			- their ECDH public key
			*/
			ducat2keyAsTask = function (privateKey, publicKey) {
				return window.crypto.subtle.deriveKey(
					{
						name: "ECDH",
						public: publicKey
					},
					privateKey,
					{
						name: "AES-GCM",
						length: 256
					},
					false,
					["encrypt", "decrypt"]
				);
			}		
		;
		nilnul ??= globalThis.nilnul ?? {};
		nilnul.crypt_ ??= {};
		nilnul.crypt_.comm_ ??= {};
		nilnul.crypt_.comm_.ecdh = {
			ducat2keyAsTask: ducat2keyAsTask
			,
			ducatAsyn:generateDucatAsyn
		};
		//nilnul.crypt_.comm_.ecdh.deriveKey ??= deriveKey;




	})(nilnul);

<% #if false %>

</script>
<% #endif %>
