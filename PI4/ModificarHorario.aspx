<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEstudiante.Master" AutoEventWireup="true" CodeBehind="ModificarHorario.aspx.cs" Inherits="PI4.ModificarHorario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <table style="width:100%;">
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text="Este usuario no tiene actualmente un horario creado"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <table style="width:100%;">
                            <tr>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                        <asp:ListItem>Seleccione una opción</asp:ListItem>
                                        <asp:ListItem>Dar de baja</asp:ListItem>
                                        <asp:ListItem>Agregar Materias</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="1008px">
                                        <Columns>
                                            <asp:BoundField DataField="HORA" HeaderText="HORA" SortExpression="HORA" />
                                            <asp:BoundField DataField="Lunes" HeaderText="Lunes" ReadOnly="True" SortExpression="Lunes" />
                                            <asp:BoundField DataField="Martes" HeaderText="Martes" ReadOnly="True" SortExpression="Martes" />
                                            <asp:BoundField DataField="Miércoles" HeaderText="Miércoles" ReadOnly="True" SortExpression="Miércoles" />
                                            <asp:BoundField DataField="Jueves" HeaderText="Jueves" ReadOnly="True" SortExpression="Jueves" />
                                            <asp:BoundField DataField="Viernes" HeaderText="Viernes" ReadOnly="True" SortExpression="Viernes" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="spVerHor" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Label5" DefaultValue="0" Name="US" PropertyName="Text" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:MultiView ID="MultiView2" runat="server">
                                        <asp:View ID="View3" runat="server">
                                            <table style="width:100%;">
                                                <tr>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Materias" DataSourceID="SqlDataSource2" Width="306px">
                                                            <Columns>
                                                                <asp:BoundField DataField="ID_Materias" HeaderText="ID_Materias" InsertVisible="False" ReadOnly="True" SortExpression="ID_Materias" />
                                                                <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                                                <asp:TemplateField HeaderText="Eliminar">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" OnClientClick="pedirConfirmacion()" Text="Eliminar" ToolTip='<%# Eval("ID_Materias") %>' CausesValidation="False" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="spEditar" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="Label5" DefaultValue="0" Name="USER" PropertyName="Text" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                </tr>
                                            </table>
                                        </asp:View>
                                        <asp:View ID="View4" runat="server">
                                            <table style="width:100%;">
                                                <tr>
                                                    <td class="auto-style1">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style1">Materias distribuidas por modulos</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="ID" DataValueField="MODULO">
                                                        </asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="SELECT 'Seleccione una opcion' AS ID, '0' AS MODULO UNION ALL SELECT 'Modúlo ' + CONVERT (nvarchar(2), Modulo) AS MODULO, Modulo AS ID FROM (SELECT DISTINCT Modulo FROM TB_MATERIAS WHERE (ID_Carrera = @Carrera)) AS C">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="Label1" DefaultValue="0" Name="Carrera" PropertyName="Text" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                                                        <asp:Label ID="Label5" runat="server" Text="Label" Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="CODIGO" DataSourceID="SqlDataSource3" OnSelectedIndexChanged="GridView4_SelectedIndexChanged" Width="298px">
                                                            <Columns>
                                                                <asp:CommandField SelectText="Agregar" ShowSelectButton="True" />
                                                                <asp:BoundField DataField="CODIGO" HeaderText="CODIGO" InsertVisible="False" ReadOnly="True" SortExpression="CODIGO" />
                                                                <asp:BoundField DataField="MATERIA" HeaderText="MATERIA" SortExpression="MATERIA" />
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="SELECT ID_Materias AS CODIGO, Materia AS MATERIA FROM TB_MATERIAS WHERE (Modulo = @Modulo) order by Materia asc">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="DropDownList2" DefaultValue="0" Name="Modulo" PropertyName="SelectedValue" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:View>
                                    </asp:MultiView>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
