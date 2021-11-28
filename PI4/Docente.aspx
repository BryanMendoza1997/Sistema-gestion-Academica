<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdministrador.Master" AutoEventWireup="true" CodeBehind="Docente.aspx.cs" Inherits="PI4.Docente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
        }
        .auto-style4 {
            width: 95px;
            height: 30px;
            text-align: left;
        }
        .auto-style6 {
            height: 30px;
            text-align: justify;
        }
        .auto-style7 {
            width: 6px;
            height: 30px;
        }
        .auto-style28 {
            width: 245px;
            height: 30px;
        }
        .auto-style29 {
            width: 245px
        }
        .auto-style30 {
            height: 30px;
            text-align: justify;
        }
        .auto-style31 {
            height: 30px;
            text-align: left;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="imagendiv">
                    <img src="assets/img/user02.png" alt="user" class="imgCentrada" style="max-width: 110px; width: 274px; height:229px;"/>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" DeleteCommand="ELIMINARDOCENTE" DeleteCommandType="StoredProcedure" InsertCommand="INSERTARDOCENTE" InsertCommandType="StoredProcedure" SelectCommand="SELECTDOCENTE" SelectCommandType="StoredProcedure" UpdateCommand="MODIFICARDOCENTE" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nombres" Type="String" />
                <asp:Parameter Name="apellidos" Type="String" />
                <asp:Parameter Name="cedula" Type="String" />
                <asp:Parameter Name="celular" Type="String" />
                <asp:Parameter Name="correo" Type="String" />
                <asp:Parameter Name="telefono" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="nombres" Type="String" />
                <asp:Parameter Name="apellidos" Type="String" />
                <asp:Parameter Name="cedula" Type="String" />
                <asp:Parameter Name="celular" Type="String" />
                <asp:Parameter Name="correo" Type="String" />
                <asp:Parameter Name="telefono" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
                <div class="parrafo1">
                    <div class="pa1">
                     Bienvenido a la sección para registrar, modificar, eliminar nuevos docentes. Para registrar un docente debes<br />
                     de llenar todos los campos del siguiente formulario, también puedes ver el listado de docentes  registrados. <br />
                    </div>
                </div>
        <br />
    <table style="width: 100%;">
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="2">&nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Agregar Nuevo Docente</asp:LinkButton>
            </td>
            <td>&nbsp;</td>
        </tr>
        </table>
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View3" runat="server">
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style29">&nbsp;</td>
                                <td colspan="2">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style29">&nbsp;</td>
                                <td colspan="2">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style28">&nbsp;</td>
                                <td class="auto-style4">NOMBRES:<br /> </td>
                                <td class="auto-style7"></td>
                                <td class="auto-style30">
                                    <asp:TextBox ID="TextNombre" runat="server" Width="252px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextNombre" ErrorMessage="Campo obligatorio." ForeColor="Red" ToolTip="Campo obligatorio.">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextNombre" ErrorMessage="*" ForeColor="#FF6600" ValidationExpression="^[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                                    <br />
                                </td>
                                <td class="auto-style6"></td>
                            </tr>
                            <tr>
                                <td class="auto-style28">&nbsp;</td>
                                <td class="auto-style4">APELLIDOS<br /> </td>
                                <td class="auto-style7">&nbsp;</td>
                                <td class="auto-style30">
                                    <asp:TextBox ID="TextApellido" runat="server" Width="253px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextApellido" ErrorMessage="Campo obligatorio." ForeColor="Red" ToolTip="Campo obligatorio.">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextApellido" ErrorMessage="*" ForeColor="#FF6600" ValidationExpression="^[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                                    <br />
                                </td>
                                <td class="auto-style6">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style28">&nbsp;</td>
                                <td class="auto-style31" colspan="2">CÉDULA:<br /> </td>
                                <td class="auto-style30">
                                    <asp:TextBox ID="TextCedula" runat="server" Width="223px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextCedula" ErrorMessage="Campo obligatorio." ForeColor="Red" ToolTip="Campo obligatorio.">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextCedula" ErrorMessage="*" ForeColor="#FF6600" ValidationExpression="^([0-9]){10}$"></asp:RegularExpressionValidator>
                                    <br />
                                </td>
                                <td class="auto-style6"></td>
                            </tr>
                            <tr>
                                <td class="auto-style28">&nbsp;</td>
                                <td class="auto-style31" colspan="2">CELULAR:<br /> </td>
                                <td class="auto-style30">
                                    <asp:TextBox ID="TextCelular" runat="server" Width="223px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextCelular" ErrorMessage="*" ForeColor="#FF6600" ValidationExpression="^([0-9]){10}$"></asp:RegularExpressionValidator>
                                    <br />
                                </td>
                                <td class="auto-style6"></td>
                            </tr>
                            <tr>
                                <td class="auto-style28">&nbsp;</td>
                                <td class="auto-style31" colspan="2">CORREO:<br /> </td>
                                <td class="auto-style30">
                                    <asp:TextBox ID="TextCorreo" runat="server" Width="223px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextCorreo" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextCorreo" ErrorMessage="*" ForeColor="#FF6600" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    <br />
                                </td>
                                <td class="auto-style6"></td>
                            </tr>
                            <tr>
                                <td class="auto-style28">&nbsp;</td>
                                <td class="auto-style6" colspan="2"><br /> </td>
                                <td class="auto-style30">
                                    <asp:TextBox ID="Textid" runat="server" Visible="False"></asp:TextBox>
                                    <br />
                                </td>
                                <td class="auto-style6"></td>
                            </tr>
                            <tr>
                                <td class="auto-style28">&nbsp;</td>
                                <td class="auto-style6" colspan="2">&nbsp;</td>
                                <td class="auto-style30">
                                    &nbsp;</td>
                                <td class="auto-style6">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style28">&nbsp;</td>
                                <td class="auto-style6" colspan="2">
                                    <asp:Button ID="btngrabar" runat="server" OnClick="Button1_Click" Text="GRABAR" Width="177px" />
                                </td>
                                <td class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btncancelar" runat="server" CausesValidation="False" OnClick="Button2_Click" Text="CANCELAR" Width="169px" />
                                </td>
                                <td class="auto-style6">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style28">&nbsp;</td>
                                <td class="auto-style6" colspan="2">&nbsp;</td>
                                <td class="auto-style6">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                                <td class="auto-style6">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style29">&nbsp;</td>
                                <td colspan="2">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                    </asp:View>
                    <asp:View ID="View1" runat="server">
                        <div class="ContenedorGrid">
                            <div class="GridView">
                                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_DOCENTE,ID_PERSONA" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="735px" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:CommandField ShowSelectButton="True" />
                                                        <asp:BoundField DataField="ID_DOCENTE" HeaderText="ID_DOCENTE" InsertVisible="False" ReadOnly="True" SortExpression="ID_DOCENTE" Visible="False" />
                                                        <asp:BoundField DataField="ID_PERSONA" HeaderText="ID_PERSONA" ReadOnly="True" SortExpression="ID_PERSONA" Visible="False" />
                                                        <asp:BoundField DataField="CEDULA" HeaderText="CEDULA" SortExpression="CEDULA" />
                                                        <asp:BoundField DataField="NOMBRES" HeaderText="NOMBRES" SortExpression="NOMBRES" />
                                                        <asp:BoundField DataField="APELLIDOS" HeaderText="APELLIDOS" SortExpression="APELLIDOS" />
                                                        <asp:BoundField DataField="CORREO" HeaderText="CORREO" SortExpression="CORREO" />
                                                        <asp:BoundField DataField="CELULAR" HeaderText="CELULAR" SortExpression="CELULAR" />
                                                        <asp:TemplateField ShowHeader="False">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("ID_PERSONA") %>' CommandName='<%# Eval("ID_PERSONA") %>' ForeColor="Black" OnClick="LinkButton2_Click">Eliminar</asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <EditRowStyle BackColor="#7C6F57" />
                                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#E3EAEB" />
                                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                                                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="SELECTDOCENTE" SelectCommandType="StoredProcedure" DeleteCommand="ELIMINARDOCENTE" DeleteCommandType="StoredProcedure">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="id" Type="Int32" />
                                                    </DeleteParameters>
                                                </asp:SqlDataSource>
                                </div>
                            </div>
                         </asp:View>
                 </asp:MultiView >
</asp:Content>
