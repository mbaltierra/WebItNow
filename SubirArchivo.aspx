
<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SubirArchivo.aspx.cs" Inherits="WebItNow.SubirArchivo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <br />
    <script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
    
    <ContentTemplate>
    <div class="container well contenedorLogin">
        <div class="row">
            <div class="col-xs-12">
                <h2>Subir Archivo</h2>
            </div>
        </div>
        <div class="form-group">
            <div class="d-grid col-4 mx-auto">
                <asp:Label ID="indicaciones" runat="server" Text="Seleccione el archivo a subir" CssClass="control-label co-sm-3" Font-Bold="False"></asp:Label>
            </div>
        </div>
        <br />
        <div class="form-group">
            <div class="d-grid col-5 mx-auto">
                <div class="dropdown">
                    <asp:DropDownList ID="ddlDocs" runat="server" CssClass="btn btn-outline-secondary" OnSelectedIndexChanged="ddlDocs_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="ine">INE</asp:ListItem>
                        <asp:ListItem Value="ComDom">comprovante de domicilio</asp:ListItem>
                        <asp:ListItem Value="siniestro">Siniestro</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <br />
        <div class="form-group">
            <div class="input-group mb-12">
                <div class="estilo-foto">
                    <asp:FileUpload ID="FileUpload1" runat="server" OnChange="FileUpload1_OnChange" CssClass="form-control"></asp:FileUpload>
                    <br />
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/icono-Subir-Archivo-morado.png"></asp:Image>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="d-grid col-6 mx-auto">
                <asp:Label ID="Lbl_Message" runat="server" ForeColor="Red" Visible="false"></asp:Label>
            </div>
        </div>
        <br />
        <div class="form-group">
            <div class="col-sm-12"> 
            <div class="d-grid gap-2 d-md-flex justify-content-center">
                <asp:Button ID="BtnSalir"  runat="server" Font-Bold="True" Text="    Salir     " OnClick="BtnSalir_Click" CssClass="btn btn-outline-primary"/>
                <asp:Button ID="BtnEnviar" runat="server" Font-Bold="True" Text="    Subir     " OnClick="BtnEnviar_Click" CssClass="btn btn-primary me-md-2" />
                
            </div>
            </div>
        </div>
        <div class="form-group">
            <div class="d-grid col-6 mx-auto">
                <ajaxToolkit:ModalPopupExtender ID="mpeMensaje" runat="server" PopupControlID="pnlMensaje"
                    TargetControlID="lblOculto" BackgroundCssClass="FondoAplicacion" OnOkScript="mpeMensajeOnOk()" >
                </ajaxToolkit:ModalPopupExtender>
                <asp:Label ID="lblOculto" runat="server" Text="Label" Style="display: none;" />
                <asp:Label ID="LblMessage" runat="server" Text="" />
            </div>
        </div>
    </div>
    <br />

    <asp:Panel ID="pnlMensaje" runat="server" CssClass="CajaDialogo" style="display: none;">

        <table border="0" width="287px" style="margin: 0px; padding: 0px; background-color: #0033CC; color: #FFFFFF;">
            <tr>
                <td align="left">
                    <asp:Label ID="Label6" runat="server" Text="I t n o w" />
                </td>
                <td>
                </td>
            </tr>
        </table>

        <div>
            <br />
            <table border="0" width="275px" style="margin: 0px; padding: 0px;" >
                <tr>
                    <td><asp:Label ID="Label1" runat="server" Text="El archivo se subio exitosamente" /></td>
                    <td></td>
                </tr>
            </table>
        </div>

        <div>
            <br />
            <table border="0" width="275px" style="margin: 0px; padding: 0px;">
                <tr>
                    <td align="center"><asp:Button ID="btnClose" runat="server" Text="Cerrar" /></td>
                    <td></td>
                </tr>
            </table>
        </div>

    </asp:Panel>
    
    
    </ContentTemplate>
</asp:Content>
