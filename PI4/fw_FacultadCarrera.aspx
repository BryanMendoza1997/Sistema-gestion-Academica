<%@ Page Title="" Language="C#" MasterPageFile="~/UTEQ.Master" AutoEventWireup="true" CodeBehind="fw_FacultadCarrera.aspx.cs" Inherits="PI4.fw_FacultadCarrera" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">



        .auto-style6
        {
            width: 275px;
            height: 23px;
        }
        .auto-style5
        {
            height: 23px;
        }
        .auto-style2
        {
            width: 275px;
            height: 164px;
        }
        .auto-style3
        {
            height: 164px;
        }
        .auto-style1
        {
            width: 275px;
        }
        .auto-style4 {}
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <br />
<br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <p>
    </p>
    <asp:Panel ID="Panel3" runat="server">
        <table style="width:100%;">
            <tr>
                <td class="auto-style6"></td>
                <td class="auto-style5">
                    <asp:Button ID="btnMalla" runat="server" BorderStyle="None" CssClass="auto-style4" Font-Names="Times New Roman" Font-Size="Large" OnClick="btnMalla_Click" Text="Malla" Width="150px" Font-Bold="True" />
                    &nbsp; <asp:Button ID="btnHorario" runat="server" BorderStyle="None" CssClass="auto-style4" Font-Names="Times New Roman" Font-Size="Large" OnClick="btnHorario_Click" Text="Horario" Width="151px" Font-Bold="True" />
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Panel ID="Panel1" runat="server" style="margin-left: 0px" Width="165px">
                        &nbsp;
                        <asp:TreeView ID="trvFacultad" runat="server" ImageSet="BulletedList4" OnSelectedNodeChanged="trvFacultad_SelectedNodeChanged" ShowExpandCollapse="False">
                            <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                            <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                            <ParentNodeStyle Font-Bold="False" />
                            <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="0px" />
                        </asp:TreeView>
                    </asp:Panel>
                </td>
                <td class="auto-style3">
                    <asp:Panel ID="Panel2" runat="server" Height="160px">
                        <asp:MultiView ID="MultiView1" runat="server">
                            <asp:View ID="View1" runat="server">
                                <asp:Repeater ID="Repeater1" runat="server" ViewStateMode="Disabled">
                                    <ItemTemplate>
                                        <div class="col-md-4">
                                            <img class="img-responsive" src="data:image/jpg;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"Malla"))%>" />
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </asp:View>
                            <asp:View ID="View2" runat="server" ViewStateMode="Disabled">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" Height="187px" Width="584px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Nombre_Archivo">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:HyperLink ID="nombre" runat="server" Text='<%# Eval("Nombre") %>'></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Length" HeaderText="Tamaño" />
                                        <asp:TemplateField HeaderText="Descargar">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:HyperLink ID="descarga" runat="server" ImageUrl="~/Imagenes/icons8-descargando-actualizaciones-32.png" NavigateUrl='<%# Eval("ID", "~/Download.aspx?id={0}") %>'>
                               <img alt="" height="30px" src="http://localhost:5000/imagenes/download.gif" style="border-width:0px;" width="30px" />
                        </asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#594B9C" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#33276A" />
                                </asp:GridView>
                                <br />
                                <br />
                                <br />
                            </asp:View>
                        </asp:MultiView>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    <p>
        <br />
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
