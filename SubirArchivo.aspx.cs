﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebItNow
{
    public partial class SubirArchivo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //Image1.ImageUrl = System.IO.Path.GetDirectoryName(FileUpload1.PostedFile.FileName);
            //img.ImageUrl = Server.MapPath("./Images/") + "tierra-de-cristal-en-gras-131535893.jpg";

        }

        protected void BtnEnviar_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                // Get the name of the file to upload.
                string fileName = Server.HtmlEncode(FileUpload1.FileName);

                // Get the extension of the uploaded file.
                string extension = System.IO.Path.GetDirectoryName(fileName);

                //Lbl_Message.Text = "selecciono un archivo";
                //Obtener la extesion y el tamaño para delimitar si es necesario
                //string ext = System.IO.Path.GetExtension(FileUpload1.FileName);
                //ext = ext.ToLower();

                ////El tamaño esta en bytes
                //int tamArch = FileUpload1.PostedFile.ContentLength;

                ////podemos llevar a cabo la verificacion de extension y de tamaño
                //if(/*ext==".png" && */tamArch <= 1048576)
                //{
                FileUpload1.SaveAs(Server.MapPath("./Directorio/" + FileUpload1.FileName));
                Lbl_Message.Text = "EL archivo se subio exitosamente";

                Image1.ImageUrl = Server.MapPath("./Directorio/" + FileUpload1.FileName);

                //}
                //else
                //{
                //    Lbl_Message.Text = "Ocurrio un error al subir el archivo";
                //}

            }
            else {
                Lbl_Message.Text = "Debe seleccionar un archivo";
            }
            
        }

        protected void BtnSalir_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            string nomArch = FileUpload1.FileName;
        }
    }
}