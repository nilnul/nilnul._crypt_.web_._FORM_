<%@ Control Language="C#" AutoEventWireup="true" %>
<%--<%@ Page Language="C#" Inhe  * rits="System.Web.Mvc.ViewPage" %>--%>
<%--<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<  * 
  !--#include VIRTUAL="~/Views/Shared/Header.aspx"--			 * >
<!--#include file="/header/header.inc"-->--%>


<%-- 
--%>

<% #if false %>

<script>


<% #endif %>

	(function (nilnul) {

		/**
	   GCM does provide built-in authentication, and for this reason it's often recommended over the other two AES modes. 
	   @see _gcm
	   */
		const AES_CBC = "AES-CBC";
		const ivLen = 16;


		let
			/**
	Import an AES secret key from an ArrayBuffer containing the raw bytes.
	Takes an ArrayBuffer string containing the bytes, and returns a Promise
	that will resolve to a CryptoKey representing the secret key.
	
	@returns key; this is not secure enough; please use @see pass2imported  and  @see imported2key
	*/
			hashed2keyAsTask = function (hashed) {
				return window.crypto.subtle.importKey(
					"raw",
					rawKey,
					"AES-CBC"
					//"AES-GCM"
					,
					true,
					["encrypt", "decrypt"]
				);

			}
			,


			encrypt2base64Asyn_0txt_1pass = async function (plain,pass) {
				let 
					encoded = nilnul._crypt.txt.txt2uints(plain)
					,
					iv = crypto.getRandomValues(new Uint8Array(16))
					,
					pass2bytes =nilnul._crypt.txt.txt2uints( pass);

				var hashed = await crypto.subtle.digest("SHA-256", pass2bytes);

				var key = await hashed2keyAsTask(hashed);

				l			 * 
			et encrypted = await window.crypto.subtle.encrypt(
					{
						name: "AES-CBC",
						iv
					},
					key,
					encoded
				);

				var appended = nilnul._crypt.data.concatBuffer(iv, encrypted);

				var base64ed = nilnul._crypt.txt.uints2base64(new Uint8Array(appended));

				return base64ed;

			}
			,
			/**
@param cipher  in base64;
 */
			decrypt2txtAsyn_0base64_1pass = async function (cipher, pass) {


				var pass2bytes = nilnul._crypt.txt.txt2uints(pass);

				var hashed = await crypto.subtle.digest("SHA-256", pass2bytes);
				<%-- pass is not salted; that is not secure;--%>

				var key = await hashed2keyAsTask(hashed);

				let 
					decoded = nilnul._crypt.txt.base64ToUints(cipher)

					;
				let iv = decoded.slice(0, ivLen);

				let sliced = decoded.slice(ivLen);

				let decrypted = await window.crypto.subtle.decrypt(
					{
						name: "AES-CBC",
						iv
					},
					key,
					sliced
				);

				return nilnul_crypt.txt.uints2txt(decrypted);

			}



			;

		nilnul ??= globalThis.nilnul ?? {};
		nilnul.crypt_ ??= {};
		nilnul.crypt_.sym_ ??= {};
		nilnul.crypt_.sym_.aes_ ??= {};

		nilnul.crypt_.sym_.aes_.cbc = {
			AES_CBC: AES_CBC
			,
			hashed2key: hashed2key


		};

	})(nilnul);

<% #if false %>

</script>
<% #endif %>
