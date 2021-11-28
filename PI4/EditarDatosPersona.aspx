<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEstudiante.Master" AutoEventWireup="true" CodeBehind="EditarDatosPersona.aspx.cs" Inherits="PI4.EditarDatosPersona" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 168px;
        }
        .auto-style3 {
            width: 23px;
        }
        .auto-style4 {
            width: 96px;
        }
        .auto-style7 {
            width: 138px;
        }
        .auto-style9 {
            width: 113px;
        }
        .auto-style10 {
            width: 443px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" BackColor="#2B3D51" ForeColor="White" Height="63px" style="text-align: center" Width="1059px">
        <br />
        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Editar datos "></asp:Label>
    </asp:Panel>
    <table style="width:100%;">
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table style="width:100%;">
        <tr>
            <td>
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server">
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style4">&nbsp;</td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Text="Datos personales"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style4">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <table style="width: 100%; height: 243px;">
                            <tr>
                                <td class="auto-style9"></td>
                                <td class="auto-style7">
                                    <asp:Label ID="Label3" runat="server" Font-Size="Medium" ForeColor="#F2B064" Text="Cédula:"></asp:Label>
                                </td>
                                <td class="auto-style3"></td>
                            </tr>
                            <tr>
                                <td class="auto-style9"></td>
                                <td class="auto-style15">
                                    <asp:TextBox ID="txtCedula" runat="server" Height="24px" Width="560px" Enabled="False"></asp:TextBox>
                                </td>
                                <td class="auto-style16">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style9"></td>
                                <td class="auto-style7">
                                    <asp:Label ID="Label4" runat="server" Font-Size="Medium" ForeColor="#F2B064" Text="Nombres:"></asp:Label>
                                </td>
                                <td class="auto-style3"></td>
                            </tr>
                            <tr>
                                <td class="auto-style9"></td>
                                <td class="auto-style15">
                                    <asp:TextBox ID="txtNombres" runat="server" Height="24px" Width="561px" Enabled="False"></asp:TextBox>
                                </td>
                                <td class="auto-style16">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style9"></td>
                                <td class="auto-style18">
                                    <asp:Label ID="Label5" runat="server" Font-Size="Medium" ForeColor="#F2B064" Text="Apellidos:"></asp:Label>
                                </td>
                                <td class="auto-style19"></td>
                            </tr>
                            <tr>
                                <td class="auto-style9"></td>
                                <td class="auto-style21">
                                    <asp:TextBox ID="txtApellidos" runat="server" Height="24px" Width="560px" Enabled="False"></asp:TextBox>
                                </td>
                                <td class="auto-style22">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style9"></td>
                                <td class="auto-style7">
                                    <asp:Label ID="Label7" runat="server" Font-Size="Medium" ForeColor="#F2B064" Text="Teléfono:"></asp:Label>
                                </td>
                                <td class="auto-style3"></td>
                            </tr>
                            <tr>
                                <td class="auto-style9"></td>
                                <td class="auto-style15">
                                    <asp:TextBox ID="txtTelefono" runat="server" Height="26px" Width="561px"></asp:TextBox>
                                </td>
                                <td class="auto-style16">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Ingrese su teléfono por favor."></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style9">&nbsp;</td>
                                <td class="auto-style15">
                                    <asp:Label ID="Label12" runat="server" Font-Size="Medium" ForeColor="#F2B064" Text="Correo:"></asp:Label>
                                </td>
                                <td class="auto-style16">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style9">&nbsp;</td>
                                <td class="auto-style15">
                                    <asp:TextBox ID="txtCorreo" runat="server" Height="26px" Width="558px"></asp:TextBox>
                                </td>
                                <td class="auto-style16">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCorreo" ErrorMessage="Ingrese su correo por favor."></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style9">&nbsp;</td>
                                <td class="auto-style15">
                                    &nbsp;</td>
                                <td class="auto-style16">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style9">&nbsp;</td>
                                <td class="auto-style15">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                <td class="auto-style16">
                                    <asp:Button ID="btnSiguientePersonal" runat="server" OnClick="btnSiguientePersonal_Click" Text="Siguiente" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style4">&nbsp;</td>
                                <td>
                                    <asp:Label ID="Label10" runat="server" Font-Size="X-Large" Text="Datos universitarios"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style4">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style2"></td>
                                <td class="auto-style34">
                                    <asp:Label ID="Label8" runat="server" Font-Size="Medium" ForeColor="#F2B064" Text="Facultad:"></asp:Label>
                                </td>
                                <td class="auto-style16"></td>
                            </tr>
                            <tr>
                                <td class="auto-style2"></td>
                                <td class="auto-style34">
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="NOMBRE" DataValueField="ID_FACULTAD" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" OnTextChanged="DropDownList1_TextChanged">
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style16"></td>
                            </tr>
                            <tr>
                                <td class="auto-style2"></td>
                                <td class="auto-style34">
                                    <asp:Label ID="Label9" runat="server" Font-Size="Medium" ForeColor="#F2B064" Text="Carrera universitaria:"></asp:Label>
                                </td>
                                <td class="auto-style16"></td>
                            </tr>
                            <tr>
                                <td class="auto-style2">&nbsp;</td>
                                <td class="auto-style34">
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="NOMBRE" DataValueField="ID_CARRERA">
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style16">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style2">&nbsp;</td>
                                <td class="auto-style34">&nbsp;</td>
                                <td class="auto-style16">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style2">&nbsp;</td>
                                <td class="auto-style34">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Atras" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Finalizar" />
                                </td>
                                <td class="auto-style16">
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:View>
                    <br />
                    <asp:View ID="View4" runat="server">
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style10"></td>
                                <td class="auto-style42"></td>
                                <td class="auto-style42"></td>
                            </tr>
                            <tr>
                                <td class="auto-style10">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style10">&nbsp;</td>
                                <td>
                                    <asp:Label ID="Label16" runat="server" Font-Size="X-Large" Text="Datos actualizados"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style10">&nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style10">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style10">&nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
