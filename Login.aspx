<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebItNow.Login" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <div class="container well contenedorLogin">
        <div class="row">
            <div class="col-xs-12">
                <h2> Iniciar Sesión</h2>
            </div>
        </div>
        <div class="form-group">
            <asp:Label ID="LblUsu" runat="server" Text="Usuario" CssClass="control-label co-sm-2"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"   
                ControlToValidate="TxtUsu" ErrorMessage="*" ForeColor="Red">
                </asp:RequiredFieldValidator>
            <div class="col-sm-12">
                <asp:TextBox ID="TxtUsu" runat="server" CssClass="form-control" placeholder="Usuario"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <asp:Label ID="LblPass" runat="server" Text="Contraseña" CssClass="control-label col-sm-2"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"   
                ControlToValidate="TxtPass" ErrorMessage="*" ForeColor="Red">
                </asp:RequiredFieldValidator>
            <div class="col-sm-12">
                <asp:TextBox ID="TxtPass" runat="server" CssClass="form-control" placeholder="Contraseña" MaxLength="10" TextMode="Password"></asp:TextBox>
            </div>
        </div>
        <div class="from-group">
                <div class="d-grid col-4 mx-auto">
                    <br />
                    <asp:Image ID="ImgCaptcha" runat="server" Height="55px" ImageUrl="~/Captcha.aspx" Width="186px" />
                    <br />
                    <asp:Label runat="server" ID="lblCaptchaMessage"></asp:Label>
                </div>
        </div>
        <div class="from-group">
            <asp:Label ID="lblVerificacion" runat="server" CssClass="control-label col-sm-2" Text="Código de verificación" ></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"   
                ControlToValidate="txtVerificationCode" ErrorMessage="*" ForeColor="Red">
                </asp:RequiredFieldValidator>
            <div class="col-sm-12">
                <asp:TextBox runat="server" ID="txtVerificationCode" placeholder="Código de verificación" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <div class="d-grid col-6 mx-auto">
                <asp:Label ID="Lbl_Message" runat="server" ForeColor="Red" Visible="False" ></asp:Label>
            </div>
        </div>
        <div class="from-group">
            <div class="d-grid col-6 mx-auto">
                    <button onclick="location.href='Forgot-Password.aspx'" class="btn btn-link">Olvidé mi contraseña</button>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-12">                
                <div class="d-grid gap-2 d-md-flex justify-content-center">
                    <asp:Button ID="BtnAceptar" runat="server" Text="Iniciar sesión"  Font-Bold="True"  CssClass="btn btn-primary me-md-2" OnClick="BtnAceptar_Click"/>
                    <asp:Button ID="BtnRegistrarse" runat="server" Font-Bold="True" Text="Registrarse" OnClick="BtnRegistrarse_Click" CssClass="btn btn-outline-primary"/>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="d-grid gap-2 d-md-flex justify-content-center">
                <ajaxToolkit:ModalPopupExtender ID="mpeMensaje" runat="server" PopupControlID="pnlMensaje"
                    TargetControlID="lblOculto" BackgroundCssClass="FondoAplicacion" OnOkScript="mpeMensajeOnOk()" >
                </ajaxToolkit:ModalPopupExtender>
                <asp:Label ID="lblOculto" runat="server" Text="Label" Style="display: none;" />
            </div>
        </div>
    </div>

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
                    <td><asp:Label ID="LblMessage" runat="server" Text="" /></td>
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
    </asp:UpdatePanel>
</asp:Content>
