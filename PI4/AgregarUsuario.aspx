<%@ Page Title="" Language="C#" MasterPageFile="~/UTEQ.Master" AutoEventWireup="true" CodeBehind="AgregarUsuario.aspx.cs" Inherits="PI4.AgregarUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style3 {
        height: 30px;
    }
    .auto-style5 {
        width: 187px;
        height: 30px;
    }
    .auto-style7 {
        height: 30px;
        width: 569px;<a href="AgregarHorario.aspx">AgregarHorario.aspx</a>
    }
    .auto-style14 {
        width: 187px;
        height: 40px;
    }
    .auto-style15 {
        width: 569px;
        height: 40px;
    }
    .auto-style16 {
        height: 40px;
    }
    .auto-style17 {
        width: 187px;
        height: 31px;
    }
    .auto-style18 {
        height: 31px;
        width: 569px;
    }
    .auto-style19 {
        height: 31px;
    }
    .auto-style20 {
        width: 187px;
        height: 39px;
    }
    .auto-style21 {
        width: 569px;
        height: 39px;
    }
    .auto-style22 {
        height: 39px;
    }
        .auto-style23 {
            width: 61px;
        }
        .auto-style34 {
            height: 40px;
            width: 825px;
        }
        .auto-style39 {
            width: 185px;
            height: 40px;
        }
        .auto-style41 {
            width: 370px;
            height: 22px;
        }
        .auto-style42 {
            height: 22px;
        }
        .auto-style43 {
            width: 370px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" BackColor="White" ForeColor="Black" Height="63px" style="text-align: center" Width="1059px">
    <br />
    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Registrar un nuevo estudiante"></asp:Label>
</asp:Panel>
    <table style="width:100%;">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server">
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style23">&nbsp;</td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Text="Datos personales"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style23">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <table style="width: 100%; height: 243px;">
                            <tr>
                                <td class="auto-style5"></td>
                                <td class="auto-style7">
                                    <asp:Label ID="Label3" runat="server" Font-Size="Medium" ForeColor="#F2B064" Text="Cédula:"></asp:Label>
                                </td>
                                <td class="auto-style3"></td>
                            </tr>
                            <tr>
                                <td class="auto-style14"></td>
                                <td class="auto-style15">
                                    <asp:TextBox ID="txtCedula" runat="server" Height="24px" Width="560px" OnTextChanged="txtCedula_TextChanged"></asp:TextBox>
                                </td>
                                <td class="auto-style16">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCedula" ErrorMessage="Ingrese cédula por favor."></asp:RequiredFieldValidator>
                                    &nbsp;
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtCedula" ErrorMessage="*" ForeColor="#FF6600" ToolTip="Solo se Permiten Numeros y una longitud de 10 numeros" ValidationExpression="^([0-9]){10}$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5"></td>
                                <td class="auto-style7">
                                    <asp:Label ID="Label4" runat="server" Font-Size="Medium" ForeColor="#F2B064" Text="Nombres:"></asp:Label>
                                </td>
                                <td class="auto-style3"></td>
                            </tr>
                            <tr>
                                <td class="auto-style14"></td>
                                <td class="auto-style15">
                                    <asp:TextBox ID="txtNombres" runat="server" Height="24px" Width="561px"></asp:TextBox>
                                </td>
                                <td class="auto-style16">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCedula" ErrorMessage="Ingrese sus nombres por favor."></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style17"></td>
                                <td class="auto-style18">
                                    <asp:Label ID="Label5" runat="server" Font-Size="Medium" ForeColor="#F2B064" Text="Apellidos:"></asp:Label>
                                </td>
                                <td class="auto-style19"></td>
                            </tr>
                            <tr>
                                <td class="auto-style20"></td>
                                <td class="auto-style21">
                                    <asp:TextBox ID="txtApellidos" runat="server" Height="24px" Width="560px"></asp:TextBox>
                                </td>
                                <td class="auto-style22">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtApellidos" ErrorMessage="Ingrese sus apellidos por favor."></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5"></td>
                                <td class="auto-style7">
                                    <asp:Label ID="Label7" runat="server" Font-Size="Medium" ForeColor="#F2B064" Text="Teléfono:"></asp:Label>
                                </td>
                                <td class="auto-style3"></td>
                            </tr>
                            <tr>
                                <td class="auto-style14"></td>
                                <td class="auto-style15">
                                    <asp:TextBox ID="txtTelefono" runat="server" Height="26px" Width="561px"></asp:TextBox>
                                </td>
                                <td class="auto-style16">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Ingrese su teléfono por favor."></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style14">&nbsp;</td>
                                <td class="auto-style15">
                                    <asp:Label ID="Label12" runat="server" Font-Size="Medium" ForeColor="#F2B064" Text="Correo:"></asp:Label>
                                </td>
                                <td class="auto-style16">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style14">&nbsp;</td>
                                <td class="auto-style15">
                                    <asp:TextBox ID="txtCorreo" runat="server" Height="26px" Width="558px"></asp:TextBox>
                                </td>
                                <td class="auto-style16">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCorreo" ErrorMessage="Ingrese su correo por favor."></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style14">&nbsp;</td>
                                <td class="auto-style15">
                                    &nbsp;</td>
                                <td class="auto-style16">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style14">&nbsp;</td>
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
                                <td class="auto-style23">&nbsp;</td>
                                <td>
                                    <asp:Label ID="Label10" runat="server" Font-Size="X-Large" Text="Datos universitarios"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style23">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style39"></td>
                                <td class="auto-style34">
                                    <asp:Label ID="Label8" runat="server" Font-Size="Medium" ForeColor="#F2B064" Text="Facultad:"></asp:Label>
                                </td>
                                <td class="auto-style16"></td>
                            </tr>
                            <tr>
                                <td class="auto-style39"></td>
                                <td class="auto-style34">
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="NOMBRE" DataValueField="ID_FACULTAD" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" OnTextChanged="DropDownList1_TextChanged">
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style16"></td>
                            </tr>
                            <tr>
                                <td class="auto-style39"></td>
                                <td class="auto-style34">
                                    <asp:Label ID="Label9" runat="server" Font-Size="Medium" ForeColor="#F2B064" Text="Carrera universitaria:"></asp:Label>
                                </td>
                                <td class="auto-style16"></td>
                            </tr>
                            <tr>
                                <td class="auto-style39">&nbsp;</td>
                                <td class="auto-style34">
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="NOMBRE" DataValueField="ID_CARRERA">
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style16">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style39">&nbsp;</td>
                                <td class="auto-style34">&nbsp;</td>
                                <td class="auto-style16">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style39">&nbsp;</td>
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
                                <td class="auto-style41"></td>
                                <td class="auto-style42"></td>
                                <td class="auto-style42"></td>
                            </tr>
                            <tr>
                                <td class="auto-style43">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style43">&nbsp;</td>
                                <td>
                                    <asp:Label ID="Label16" runat="server" Font-Size="X-Large" Text="Espere confirmación"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style43">&nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style43">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style43">&nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="SELECT [NOMBRE], [ID_FACULTAD] FROM [TB_FACULTAD]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="SELECT [ID_CARRERA], [NOMBRE] FROM [TB_CARRERA] WHERE ([ID_FACULTAD] = @ID_FACULTAD)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="ID_FACULTAD" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="SELECT [ID_CURSO], [CURSO] FROM [TB_SEMESTRE]"></asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
