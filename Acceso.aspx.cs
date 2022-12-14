using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using System.Data;
using System.Data.SqlTypes;
using System.Data.SqlClient;

// using Microsoft.Office.Interop.Excel;

namespace WebItNow
{

    public partial class Acceso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.Form.Attributes.Add("autocomplete", "off");
            }

        }

        protected void BtnAceptar_Click(object sender, EventArgs e)
        {
            if (TxtUsu.Text == "" || TxtPass.Text == "" || txtVerificationCode.Text == "")
            {
                LblMessage.Text = "Debes captura Usuario / Clave / " + "<br/>" + "Código de verificación.";
                this.mpeMensaje.Show();
            }
            else if(txtVerificationCode.Text.ToLower() != Session["CaptchaVerify"].ToString())
                {
                    lblCaptchaMessage.Text = "Por favor ingrese el captcha correcto";
                    lblCaptchaMessage.ForeColor = System.Drawing.Color.Red;
                }
            else
            {

                int result = Autenticar(TxtUsu.Text, TxtPass.Text);

                if (result >= 1)
                {
                    // Permisos Usuario
                    // System.Web.HttpContext.Current.Session["UsPrivilegios"] = dr1["UsPrivilegios"].ToString().Trim();
                    
                    Response.Redirect("Menu.aspx");
                }
                else if (result == 0)
                {
                    LblMessage.Text = "Usuario y/o Contraseña Incorrectos";
                    this.mpeMensaje.Show();
                }

                /*
                                ConexionBD Conecta = new ConexionBD();
                                NewMethod(Conecta);

                                try
                                {
                                    SqlCommand cmd1 = new SqlCommand("Select * From tbUsuarios Where Usuario = '" + TxtUsu.Text + "' and UsPassword = '" + TxtPass.Text + "'", Conecta.ConectarBD);
                                    SqlDataReader dr1 = cmd1.ExecuteReader();

                                    //Application.EnableVisualStyles();
                                    //Application.SetCompatibleTextRenderingDefault(false);

                                    if (dr1.Read())
                                    {
                                        //           Application.Run(new Menu());

                                        //Menu frm = new Menu();
                                        //frm.Show();
                                        //this.Visible = false;

                                        // Permisos Usuario
                                        // System.Web.HttpContext.Current.Session["UsPrivilegios"] = dr1["UsPrivilegios"].ToString().Trim();

                                        if (txtVerificationCode.Text.ToLower() == Session["CaptchaVerify"].ToString())
                                        {
                                            Response.Redirect("Menu.aspx");
                                        }
                                        else
                                        {
                                            lblCaptchaMessage.Text = "Por favor ingrese el captcha correcto";
                                            lblCaptchaMessage.ForeColor = System.Drawing.Color.Red;
                                        }
                                    }
                                    else
                                    {
                                        //string message = "Usuario no Autorizado";

                                        //System.Text.StringBuilder sb = new System.Text.StringBuilder();

                                        //sb.Append("alert('");
                                        //sb.Append(message);
                                        //sb.Append("');");

                                        //ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());
                                        // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ShowPopup", "alert('Usuario no Autorizado.');", true);

                                        LblMessage.Text = "Usuario no Autorizado.";
                                        this.mpeMensaje.Show();
                                    }

                                    cmd1.Dispose();
                                    dr1.Dispose();

                                    Conecta.Cerrar();
                                }
                                catch (Exception ex)
                                {
                                    Console.WriteLine(ex.ToString());
                                }
                */
            }
        }

        private static void NewMethod(ConexionBD Conecta)
        {
            Conecta.Abrir();
        }

        protected void BtnRegistrarse_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        public int Autenticar(String pUsuarios, String pContrasena)
        {
            ConexionBD Conecta = new ConexionBD();
            NewMethod(Conecta);

            try
            {

                SqlCommand cmd1 = new SqlCommand("sp_Login", Conecta.ConectarBD);
                cmd1.CommandType = CommandType.StoredProcedure;

                cmd1.Parameters.AddWithValue("@usuario", pUsuarios);
                cmd1.Parameters.AddWithValue("@password", pContrasena);

                SqlDataReader dr1 = cmd1.ExecuteReader();

                if (dr1.Read())
                {

                    return dr1.GetInt32(0);
                    
                }

                cmd1.Dispose();
                dr1.Dispose();

                Conecta.Cerrar();

            }
            catch (Exception ex)
            {
                // Show(ex.Message);
                LblMessage.Text = ex.Message;
                this.mpeMensaje.Show();
            }
            finally
            {

            }

            return -1;
        }

    }
}