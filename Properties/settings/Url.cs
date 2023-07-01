using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace nilnul._crypt_.web_._FORM_.Properties.settings
{
	public class Url : nilnul.web.Properties.settings._url.origin.WebApp
	{
		public Url() : base(Settings.Default.dnt)
		{
		}


		static public Url Singleton
		{
			get
			{
				return nilnul.obj_.Singleton<Url>.Instance;
			}
		}

	}
}