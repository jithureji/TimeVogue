using System;
using System.Web.UI;

namespace projectecom
{
    public partial class Site1 : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Optional: initialize anything here
            }
        }
    }
}
