<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loguin.aspx.cs" Inherits="PI4.loguin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Inicio de sesión</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="Shortcut Icon" type="image/x-icon" href="assets/icons/book.ico" />
    <script src="js/sweet-alert.min.js"></script>
    <link rel="stylesheet" href="css/sweet-alert.css"/>
    <link rel="stylesheet" href="css/material-design-iconic-font.min.css"/>
    <link rel="stylesheet" href="css/normalize.css"/>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="css/login.css"/>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-1.11.2.min.js"><\/script>')</script>
    <script src="js/modernizr.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/main.js"></script>
</head>
<body class="full-cover-background">
    <div class="form-container">
        <p class="text-center" style="margin-top: 17px;">
           <img src="assets/img/logoUTEQd.png" style="width:28%" />
       </p>
       <h4 class="text-center all-tittles" style="margin-bottom: 30px;">inicia sesión con tu cuenta</h4>
       <form id="form1" runat="server">
            <p class="text-center all-tittles" style="margin-bottom: 30px;">&nbsp;</p>
            <div id="loguin">
           <asp:Login ID="Login1" runat="server" Height="181px" TitleText="" Width="296px" TextLayout="TextOnTop" OnAuthenticate="Login1_Authenticate" LoginButtonImageUrl="~/assets/icons/Login_50px.png" LoginButtonText="" LoginButtonType="Image" PasswordLabelText="Contraseña " UserNameLabelText="Usuario ">
               <CheckBoxStyle Font-Names="Times New Roman" Font-Size="12pt" />
               <LabelStyle BorderWidth="0px" CssClass="labelloguin" Font-Bold="False" Font-Italic="False" Font-Size="13pt" Font-Strikeout="False" Font-Names="Times New Roman"/>
               <LoginButtonStyle CssClass="btnloguin" />
               <TextBoxStyle CssClass="textloguin" ForeColor="Black" />
               <ValidatorTextStyle CssClass="validacionloguin" Font-Names="Times New Roman" Font-Size="13pt" />
           </asp:Login>
                <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="White" PostBackUrl="~/AgregarUsuario.aspx" Font-Names="Times New Roman" Font-Overline="False" Font-Size="13pt" Font-Strikeout="False" Font-Underline="False">Registrarse</asp:LinkButton>
                <br />
                <asp:LinkButton ID="LinkButton2" runat="server" Font-Names="Times New Roman" Font-Size="13pt" ForeColor="White" PostBackUrl="~/RecuperacionPass.aspx">Has olvidado tu contraseña?</asp:LinkButton>
          </div>
        </form>
    </div>

</body>
</html>
