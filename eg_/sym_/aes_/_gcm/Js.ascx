<%@ Control Language="C#" AutoEventWireup="true" %>
<%--<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>--%>
<%--<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<!--#include VIRTUAL="~/Views/Shared/Header.aspx"--			 * >
<!--#include file="/header/header.inc"-->--%>


<%-- 
--%>

<% #if false %>

<script>


<% #endif %>

	(function (nilnul) {

		const AES_GCM = "AES-GCM" /**GCM does provide built-in authentication, and for this reason it's often recommended over the other two AES modes. */
			, IV_LENGTH = 16
			,
			SALT_LENGTH = 16
			,
			DERIVE_TIMES = 100000
		;

		let
			txt2uints = nilnul._crypt.txt.txt2uints
			,
			concatBuffer = nilnul._crypt.data.concatBuffer
			,
			uints2base64 = nilnul._crypt.txt.uints2base64
			,
			base64ToUints=nilnul._crypt.txt.base64ToUints
			,
	
			hash2importedAsTask = nilnul._crypt.key.of_.pass.hash2importedAsTask
			,

			/**	 from imported to key;
@param imported hide; pass (hashed) imported
@param salt 
 */
			imported2keyAsyn = async function (imported, salt) {
				const key = await window.crypto.subtle.deriveKey(
					{
						name: PBK // "PBKDF2",
						, salt: salt, //at least 16bytes;
						iterations: 100000, // the more, the stronger
						hash: "SHA-256",
					},
					imported
					,
					{
						name:
							"AES-GCM"
						, length: 256
					},
					true, //can be extracted|exported as a key file;
					["encrypt", "decrypt"]			 
			
				);

				return key;

			}
			,
			hash2keyAsyn = async function (hashed,salt) {
				return await imported2keyAsyn( await hash2importedAsTask(hashed),salt);
			}
			,
			pass2keyAsyn = async function (pass, salt) {
				//var pass2uints = txt2uints(pass);
				var hide = nilnul._crypt.key.of_.pass.pass2imported(pass);
				//let salt = crypto.getRandomValues(new Uint8Array(16));
				return await imported2key(hide, salt)

			}
			,
			/**
@returns iv and cipher;
 */
			encryptAsyn_1key = async function (data, key) {


				
				let iv = crypto.getRandomValues(new Uint8Array(16));

				let encrypted;
				try {
					encrypted = await window.crypto.subtle.encrypt(
						{
							name: AES_GCM,
							iv
						},
						key
						,
						data
					);

				} catch (e) {
					console.error(`When encrypting:${e}`);
					throw e;
				}

				var appended = concatBuffer(iv, encrypted);
				return appended;
			}
			,
			/**
@param msg msg
@param key key
@returns iv9cipher

		 */
			encryptAsyn_0txt_1key = async function (msg, key) {


				let
					encoded = txt2uints(msg)
					;
				return await encryptAsyn_1key(encoded, key);
			}
			,
			/**
@returns salt9iv9cipher;
 */
			encryptAsyn_1pass = async function (data, pass) {

				let salt = crypto.getRandomValues(new Uint8Array(16));
				
				var key = pass2keyAsyn(pass, salt);

			
				var encrypted = await encryptAsyn_1key(data, key); // prepended with 16bytes of iv;
				var appended = nilnul._crypt.data.concatBuffer(salt, encrypted); 
				return appended;
			}
			,
			/**
@returns salt9iv9cipher;
 */

			encryptAsyn_0txt_1pass = async function (msg, pass) {
				return await encryptAsyn_1pass(
					txt2uints(msg),pass
				);
			}
			,
			/**
@returns salt9iv9cipher;
 */

			encrypt2base64Asyn_0txt_1pass = async function (msg, pass) {
				return uints2base64(  await encryptAsyn_0txt_1pass(
					msg,pass
				));
			}

			,

			/**
@param imported the pass hashed and imported 
@param data salt9iv9cipher
 */
			decryptAsyn_1imported = async function (data, imported) {
				let salt = data.slice(IV_LENGTH, saltEnd);

				let iv = data.slice(0, IV_LENGTH);

				let saltEnd = IV_LENGTH + SALT_LENGTH;

				let key = await imported2keyAsyn(hashed, salt);

				let sliced = data.slice(saltEnd);

				let decrypted = await window.crypto.subtle.decrypt(
					{
						name: AES_GCM,
						iv
					},
					key,
					sliced
				);
				return decrypted;

			}
			,
			/**
@param hashed the pass hashed, but not yet imported
@param 
 */
			decryptAsyn_1hashed = async function (data, hashed) {


				let imported = await hash2importedAsTask(hashed);
				return await decryptAsyn_1imported(data, imported);

	

			}
			,
			decryptAsyn_1pass = async function (data, pass) {
				
				var imported = pass2imported(pass);

			
				var decipher = await decryptAsyn_1imported(data, imported); 
				return decipher;
			}
			,
			/**
@param msg msg
@param key key
@returns iv9cipher

		 */
			decryptAsyn_0base64_1imported = async function (base64, key) {


				let
					data = base64ToUints(base64)
					;
				return await decryptAsyn_1imported(data, key);
			}
			,
			decryptAsyn_0base64_1hashed = async function (base64, hashed) {
				return await decryptAsyn_0base64_1imported(base64,
await hash2importedAsTask(hashed)
				);
			}
			,

			decryptAsyn_0base64_1pass = async function (msg, pass) {
				return await decryptAsyn_0base64_1imported(
					msg,pass2imported( pass)
				);
			}
	

		;

		nilnul ??= globalThis.nilnul ?? {};
		nilnul.crypt_ ??= {};
		nilnul.crypt_.sym_ ??= {};
		nilnul.crypt_.sym_.aes_ ??= {};
		nilnul.crypt_.sym_.aes_._gcm ??= {};

		nilnul.crypt_.sym_.aes_._gcm._key ??= {};
		nilnul.crypt_.sym_.aes_._gcm.key ??= {};
		nilnul.crypt_.sym_.aes_._gcm.key.of_ ??= {};

		nilnul.crypt_.sym_.aes_.gcm = {
			AES_GCM: AES_GCM
			,
			imported2keyAsyn: imported2keyAsyn
			,
			pass2keyAsyn:pass2keyAsyn
			,
			encryptAsyn_1pass: encryptAsyn_1pass
			,
			encryptAsyn_1key: encryptAsyn_1key
			,
			encryptAsyn_0txt_1pass: encryptAsyn_0txt_1pass
			,
			encryptAsyn_0txt_1key: encryptAsyn_0txt_1key
			,
			decryptAsyn_1pass: decryptAsyn_1pass
			,
			decryptAsyn_1imported: decryptAsyn_1imported
			,
			decryptAsyn_0base64_1imported: decryptAsyn_0base64_1imported
			,
			decryptAsyn_0base64_1pass: decryptAsyn_0base64_1pass

		};

	})(nilnul);

<% #if false %>

</script>
<% #endif %>
