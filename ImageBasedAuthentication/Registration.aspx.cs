using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using System.Configuration;
public partial class Registration : System.Web.UI.Page
{
    string[] images = new string[3];
    int i = 0;
    byte[] b;
    DataTable dt;
    Random random;
    DataColumn dc;
    DataColumn dc1;
    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["conn"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            ViewState["images"] = images;
            ViewState["i"] = i;

            random = new Random();
            dt= new DataTable("tbl_Images");

            dc = new DataColumn("imgPath");
            dt.Columns.Add(dc);

            DataColumn dc1 = new DataColumn("randomNum");
            dt.Columns.Add(dc1);

            string str = Server.MapPath("Images/");
            string[] files;
           
            files = Directory.GetFiles(str);
            System.Drawing.Image img;
            System.Drawing.Bitmap bmp, bmpgrayscale;
          
            foreach (string f in files)
            {
                DataRow dr = dt.NewRow();
                string[] str1 = f.Split('\\');
                img = System.Drawing.Image.FromFile(Server.MapPath("Images/" + str1[str1.Length - 1].ToString()));
                bmp = (Bitmap)img;
                bmpgrayscale = converttograyscale(bmp);
                bmpgrayscale.Save(Server.MapPath("Images1/" + str1[str1.Length - 1].ToString()));
                dr[dc] = "~/Images1/" + str1[str1.Length - 1].ToString();
                dr[dc1] = random.Next(100, 1000);
                dt.Rows.Add(dr);


            }

            dt.AcceptChanges();




            //mycode
            
            //mycode




            ViewState["data"] = dt;
            rpImages.DataSource = dt;
            rpImages.DataBind();

        }
        //else
        //{

        //    DataTable dtnew = (DataTable)ViewState["data"];
        //    rpImages.DataSource = RepReload(dtnew);
        //    rpImages.DataBind();
        //}
    }
    string temp;
        int x1;
    protected DataTable RepReload(DataTable dt1)
    {
        random = new Random();
        for (int index1 = 0; index1 < dt1.Rows.Count; index1++)
        {
            temp = dt1.Rows[index1]["imgPath"].ToString();
            x1 = random.Next(0, dt1.Rows.Count);
            dt1.Rows[index1]["imgPath"] = dt1.Rows[x1]["imgPath"].ToString();
            dt1.Rows[x1]["imgPath"] = temp;

        }
        return dt1;
    }
    protected Bitmap converttograyscale(Bitmap bm)
    {
        Bitmap d;
        for (int i = 0; i < bm.Width; i++)
        {
            for (int j = 0; j < bm.Height; j++)
            {

                Color originalColor = bm.GetPixel(i, j);


                int grayScale = (int)((originalColor.R * .3) + (originalColor.G * .59)
                    + (originalColor.B * .11));


                Color newColor = Color.FromArgb(grayScale, grayScale, grayScale);


                bm.SetPixel(i, j, newColor);
            }
        }
        d = bm;
        return d;

    }
    //

    ImageButton RepImg;
    string repimgurl;
    protected void imagemouseover(object source, RepeaterItemEventArgs e)
    {
        RepImg = (ImageButton)e.Item.FindControl("img");
        string str = RepImg.ImageUrl;
        repimgurl = str.Replace("Images1", "Images");
        repimgurl = repimgurl.Remove(0, 2);
        //    repimgurl=Server.MapPath(Server.MapPath("Images/" + str1[str1.Length - 1].ToString()));
        RepImg.Attributes.Add("onmouseover", "this.src='" + repimgurl + "'");
        repimgurl = repimgurl.Replace("Images", "Images1");
    
        RepImg.Attributes.Add("onmouseout", "this.src='" + repimgurl + "'");
       
        //  RepImg.Attributes.Add();
    }

    protected void rpImages_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (ViewState.Values.Count != 0)
        {
            images = (string[])ViewState["images"];
            i = Convert.ToInt32(ViewState["i"]);
        }

        if (txtPwd.Text.Length > 8)
            ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript: alert('You can select only 3 images'); ", true);
        else
        {
            ImageButton ibtn = new ImageButton();
            ibtn = (ImageButton)e.Item.FindControl("img");
            images[i] = ibtn.ImageUrl;
            txtPwd.Text += e.CommandArgument;
            i++;
        }
        ViewState["images"] = images;
        ViewState["i"] = i;
            
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        images = (string[])ViewState["images"];

        if (txtPwd.Text.Length <= 8)
            ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript: alert('You have to select 3 images'); ", true);
        else
        {
            //Password field

            string imgIds = string.Empty;
            for (int i = 0; i < 3; i++)
            {
                string path = Server.MapPath(images[i]);
                FileStream f = new FileStream(path, FileMode.Open, FileAccess.Read);
                b = new Byte[f.Length];
                f.Read(b, 0, Convert.ToInt32(f.Length));
                f.Close();

                if (con.State == ConnectionState.Open)
                    con.Close();
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_insertImage";
                cmd.Connection = con;
                SqlParameter p = new SqlParameter("@img", SqlDbType.VarBinary, b.Length, ParameterDirection.Input, false, 0, 0, null, DataRowVersion.Current,b);
                cmd.Parameters.Add(p);
                int j = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                con.Close();
                if(i<2)
                imgIds = imgIds+j + ",";
                if (i == 2)
                    imgIds = imgIds + j;
            }

            if (con.State == ConnectionState.Open)
                con.Close();
            con.Open();

            SqlCommand cmd1 = new SqlCommand();
            cmd1.Connection = con;
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.CommandText = "sp_registerUser";

            SqlParameter p1 = new SqlParameter("@fname", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, null, DataRowVersion.Current, txtfname.Text);
            cmd1.Parameters.Add(p1);

            SqlParameter p2 = new SqlParameter("@lname", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, null, DataRowVersion.Current, txtlname.Text);
            cmd1.Parameters.Add(p2);

            SqlParameter p3 = new SqlParameter("@dob", SqlDbType.DateTime, 50, ParameterDirection.Input, false, 0, 0, null, DataRowVersion.Current,txtcal.Text );
            cmd1.Parameters.Add(p3);

            SqlParameter p4 = new SqlParameter("@gender", SqlDbType.Char, 10, ParameterDirection.Input, false, 0, 0, null, DataRowVersion.Current,rbtnGender.SelectedItem.Value);
            cmd1.Parameters.Add(p4);

            SqlParameter p5 = new SqlParameter("@mobile", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, null, DataRowVersion.Current,txtMobile.Text);
            cmd1.Parameters.Add(p5);

            SqlParameter p6 = new SqlParameter("@email", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, null, DataRowVersion.Current,txtEmail.Text);
            cmd1.Parameters.Add(p6);

            SqlParameter p7 = new SqlParameter("@address", SqlDbType.VarChar, 2000, ParameterDirection.Input, false, 0, 0, null, DataRowVersion.Current,txtAddr.Text);
            cmd1.Parameters.Add(p7);

            SqlParameter p8 = new SqlParameter("@username", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, null, DataRowVersion.Current,txtUsername.Text);
            cmd1.Parameters.Add(p8);

            SqlParameter p9 = new SqlParameter("@pwd", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, null, DataRowVersion.Current,imgIds);
            cmd1.Parameters.Add(p9);



            int result = cmd1.ExecuteNonQuery();
            ViewState.Clear();

            if (result > 0)
            {
                ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript: alert('Registered Successfully'); ", true);
                Response.Redirect("Login.aspx");
            }
                   

        }
    }
    protected void imgCal_Click(object sender, ImageClickEventArgs e)
    {
        cal.Visible = true;
    }
    protected void cal_SelectionChanged(object sender, EventArgs e)
    {
        txtcal.Text = cal.SelectedDate.ToShortDateString();
        cal.Visible = false;
    }
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Registration.aspx");
    }
    protected void gtpassweord_Click(object sender, EventArgs e)
    {
        try
        {
            if (gtpassweord.Text == "GetPassword")
            {
                DataTable dtnew = (DataTable)ViewState["data"];

                rpImages.DataSource = RepReload(dtnew);
                rpImages.DataBind();
                rpImages.Visible = true;
                gtpassweord.Text = "Hide Password";
            }
            else
            {
                gtpassweord.Text = "GetPassword";
                rpImages.Visible = false;
            }
        }
        catch(Exception ex)
        {
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Registration.aspx");
    }
}
