<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdministrador.Master" AutoEventWireup="true" CodeBehind="Aprobacion.aspx.cs" Inherits="PI4.Aprobacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 22px;
        }
        .auto-style2 {
            height: 22px;
            width: 231px;
        }
        .auto-style3 {
            width: 231px;
        }
        .auto-style4 {
            margin-right: 7px;
        }
        .auto-style5 {
            height: 22px;
            width: 570px;
        }
        .auto-style6 {
            width: 570px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" BackColor="White" ForeColor="Black" Height="63px" style="text-align: center" Width="1059px">
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Aprobar solicitudes de personas"></asp:Label>
    </asp:Panel>
    <br />
    <table style="width:100%;">
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style5"></td>
            <td class="auto-style1"></td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style6">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="auto-style4" DataSourceID="SqlDataSource1" Width="608px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="CEDULA" HeaderText="CEDULA" SortExpression="CEDULA" >
                        <HeaderStyle Font-Bold="True" Font-Names="Arial Narrow" Font-Size="13pt" />
                        <ItemStyle Font-Names="Arial Narrow" Font-Size="13pt" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NOMBRES" HeaderText="NOMBRES" SortExpression="NOMBRES" >
                        <HeaderStyle Font-Bold="True" Font-Names="Arial Narrow" Font-Size="13pt" />
                        <ItemStyle Font-Names="Arial Narrow" Font-Size="13pt" />
                        </asp:BoundField>
                        <asp:BoundField DataField="APELLIDOS" HeaderText="APELLIDOS" SortExpression="APELLIDOS" >
                        <HeaderStyle Font-Bold="True" Font-Names="Arial Narrow" Font-Size="13pt" />
                        <ItemStyle Font-Names="Arial Narrow" Font-Size="13pt" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CORREO" HeaderText="CORREO" SortExpression="CORREO" >
                        <HeaderStyle Font-Bold="True" Font-Names="Arial Narrow" Font-Size="13pt" />
                        <ItemStyle Font-Names="Arial Narrow" Font-Size="13pt" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="APROBACIÓN">
                            <ItemTemplate>
                                <asp:CheckBox ID="micheckbox" runat="server" />
                            </ItemTemplate>
                            <HeaderStyle Font-Bold="True" Font-Names="Arial Narrow" Font-Size="13pt" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="select p.CEDULA ,p.NOMBRES, p.APELLIDOS,p.CORREO from TB_PERSONA p where p.estado =0"></asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style6">
                &nbsp;</td>
            <td>
                                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Finalizar" />
                                </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
