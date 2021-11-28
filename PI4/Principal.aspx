<%@ Page Title="" Language="C#" MasterPageFile="~/UTEQ.Master" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="ProyectoIntegrador.Principal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1
        {
            height: 23px;
        }
        .auto-style2
        {
            height: 23px;
            width: 302px;
        }
        .auto-style3
        {
            height: 23px;
            width: 300px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%; height: 269px; margin-bottom: 1px;">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Panel ID="Panel2" runat="server" BorderStyle="Outset" Height="518px">
                            <div>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Imagenes/agregar-usuario.png" />
                                &nbsp;
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <asp:Button ID="Button3" runat="server" BackColor="#8FBC8F" BorderStyle="None" Font-Bold="True" Font-Names="Times New Roman" Height="62px" PostBackUrl="~/loguin.aspx" style="font-size: large; margin-top: 1px" Text="Iniciar Sesión" Width="298px" />
                            </div>
                        </asp:Panel>
                    </td>
                    <td class="auto-style3">
                        <asp:Panel ID="Panel3" runat="server" BorderStyle="Outset" Height="516px" style="font-weight: 700; margin-right: 0px">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Imagenes/beca.png" />
                        <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        <br />
                        <br />
                            <asp:Button ID="Button1" runat="server" BackColor="#8FBC8F" BorderStyle="None" Font-Bold="True" Font-Names="Times New Roman" Height="62px" style="font-size: large; margin-top: 19px" Text="Facultades y Carreras" Width="298px" PostBackUrl="~/fw_FacultadCarrera.aspx" />
                        </asp:Panel>
                    </td>
                    <td class="auto-style1">
                        <asp:Panel ID="Panel4" runat="server" Height="514px" style="margin-top: 0px">
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>
