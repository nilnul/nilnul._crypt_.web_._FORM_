<%@ Control Language="C#" AutoEventWireup="true" %>
<%--<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>--%>
<%--<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<!--#include VIRTU			 * AL="~/Views/Shared/Header.aspx"-->
<!--#include file="/header/header.inc"-->--%>


<%-- 
	 the crypted may be salted, where the salt is append or prepend.

	module 
--%>

<% #if false %>

<script>


<%  #endif %>

	(function (nilnul) {

		 const PBK = "PBKDF2";

		 var
			txt2uintsEncoder = new TextEncoder()
			,
			uints2txtDecoder = new TextDecoder()
			,
			/**
make it as code;
encode|decode vs encrypt|decrypt

@txt a character string; unicode allowed;
@returns data; bytes; 
*/
			txt2uints = function (txt) {
				return txt2uintsEncoder.encode(txt);
			}
			 ,
			/**
@returns allow unicode;
 */
			uints2txt = function (uints) {
				return uints2txtDecode.decode(uints);
			}
			,

			/**
			@returns @see Uint8Array which is a subtype of ArrayBuffer (When creating an instance of a TypedArray subclass (e.g. Int8Array), an array buffer is created internally in memory or, if an ArrayBuffer object is given as constructor argument, that ArrayBuffer is used instead. developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray )
			 */
			base64ToUints = function (base64) {
				const binString = atob(base64); //base64 (ascii|alphanum encoded), to, bytesEncoded as txt
				return Uint8Array.from(binString, (m) => m.codePointAt(0));
			}
			,
			/**
			 @param bytes @see Uint8Array not ArrayBuffer, whence the binstring would be zero cuz maybe the length is nil;
			 */
			uints2base64 = function (bytes) {
				const binString = Array.from(bytes, (x) => String.fromCodePoint(x)).join("");
				return btoa(binString); //regard the str as a str of chars, where each char is a byte; hence this is not unicode compatible.
			 }
			,
			 buffer2base64 = function (buffer) {
				 return uints2base64(new Uint8Array(buffer));
			 }

			,
			/**
	
			Import an AES secret key from an ArrayBuffer containing the raw bytes.
			Takes an ArrayBuffer string containing the bytes, and returns a Promise
			that will resolve to a CryptoKey representing the secret key.
	
			@param pass8data  @see ArrayBuffer or @see bytes ; the raw data of pass might be too short, here we use the hash of pass, where the hash is ArrayBuffer|Uints|bytes; the length can be eg: 32bytes;
@returns @see Promise

			*/
			hash2importedAsTask = function (
				pass8data	//hash as arraybuffer;
			) {
				return globalThis.crypto.subtle.importKey(

					"raw"
					,
					pass8data	//arrayBuffer
					,
					PBK	//password based Kdf
					,
					false // for PBK, this must be false
					,
					[
						"deriveKey"
						//,
						//"deriveBits"
					]
				);
			 }
			 , pass2hashAsyn = async function (pass) {
				return await crypto.subtle.digest("SHA-256", pass2bytes);
			 }
			,
			/** hash first
				then import

				@returns Async
			*/
			pass2importedAsyn = async function (pass) {
				var pass2bytes = txt2uints(pass);
				// the length might be not long enough; so we would use hash here:

				/// 32bytes;
			 	var hashed = await crypto.subtle.digest("SHA-256", pass2bytes); // if pass is not salted before being hashed and stored in db, then this might be the same as that in db. but attach a salt here might be equivalent to add a salt in the following step: deriveKey;

				var key = await hash2importedAsTask(hashed);
				return key;
			}
			,

			///github.com/mdn/dom-examples/blob/main/web-crypto/import-key/spki.js
			___importKeySpki = function (
				key	//base64string
			) {
				key = base64ToBytes(key);
				crypto.importKey(
					'spki', key, rsaParams, false, ["encrypt"]
				).then(
					function (cryptokey) {
						resolve(cryptokey);
					}
				)
			}
			,
			/**
two arrayBuffer;
*/
			concatBuffer = function (buffer1, buffer2) {
				var tmp = new Uint8Array(buffer1.byteLength + buffer2.byteLength);
				tmp.set(new Uint8Array(buffer1), 0);
				tmp.set(new Uint8Array(buffer2), buffer1.byteLength);
				return tmp.buffer;
			}
			;

	

		globalThis.nilnul ??= {};
		nilnul = globalThis.nilnul;
		nilnul._crypt ??= {};

		nilnul._crypt = {
			data: {
				concatBuffer:concatBuffer
			}
			,
			txt: {
				txt2uints: txt2uints,
				txt2uintsEncoder: txt2uintsEncoder,

				uints2txt: uints2txt
				,
				uints2txtDecoder: uints2txtDecoder
				,

				uints2base64: uints2base64
				,
				base64ToUints: base64ToUints
				,
				buffer2base64:buffer2base64
			}
			,
			key: {
				of_: {
					pass: {
						hash2importedAsTask:hash2importedAsTask
	
						,
						pass2importedAsyn: pass2importedAsyn
						,
						pass2hashAsyn: pass2hashAsyn
					}
				}
			}

		};




	})(globalThis.nilnul);

<% #if false %>

</script>
<% #endif %>
