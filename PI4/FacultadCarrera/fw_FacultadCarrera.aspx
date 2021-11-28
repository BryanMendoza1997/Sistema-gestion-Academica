<%@ Page Title="" Language="C#" MasterPageFile="~/UTEQ.Master" AutoEventWireup="true" CodeBehind="fw_FacultadCarrera.aspx.cs" Inherits="ProyectoIntegrador.FacultadCarrera.fw_FacultadCarrera" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1
        {
            width: 218px;
        }
        .auto-style2
        {
            width: 218px;
            height: 169px;
        }
        .auto-style3
        {
            height: 169px;
        }
        .auto-style5
        {
            height: 169px;
            width: 632px;
        }
        .auto-style6
        {
            width: 218px;
            height: 23px;
        }
        .auto-style7
        {
            width: 632px;
            height: 23px;
        }
        .auto-style8
        {
            height: 23px;
        }
        .auto-style9
        {
            width: 632px;
        }
        .auto-style10
        {
            width: 218px;
            height: 85px;
        }
        .auto-style11
        {
            width: 632px;
            height: 85px;
        }
        .auto-style12
        {
            height: 85px;
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
            &nbsp;&nbsp;&nbsp;&nbsp;
            <table style="width:100%;">
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style11">
                        <asp:Button ID="btnMalla" runat="server" BorderStyle="None" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Large" Height="43px" OnClick="btnMalla_Click" Text="Malla" Width="166px" />
                        <asp:Button ID="btnHorario" runat="server" BorderStyle="None" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Large" Height="43px" OnClick="btnHorario_Click" Text="Horario" Width="166px" />
                        <br />
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="Label" Font-Bold="True" Font-Names="Andalus" Font-Size="Medium" Visible="False"></asp:Label>
                        <br />
                    </td>
                    <td class="auto-style12"></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:TreeView ID="trvFacultad" runat="server" Font-Names="Times New Roman" ImageSet="Arrows" OnSelectedNodeChanged="trvFacultad_SelectedNodeChanged">
                            <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                            <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                            <ParentNodeStyle Font-Bold="False" />
                            <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="0px" />
                        </asp:TreeView>
                    </td>
                    <td class="auto-style5">
                        <asp:MultiView ID="MultiView1" runat="server">
                            <asp:View ID="View1" runat="server">
                                <asp:Repeater ID="Repeater1" runat="server">
                                       <ItemTemplate>
                                        <div class="col-md-4">
                                            <img class="img-responsive" src="data:image/jpg;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"Malla"))%>" />
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </asp:View>
                            <asp:View ID="View2" runat="server">
                            </asp:View>
                            <br />
                        </asp:MultiView>
                    </td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6"></td>
                    <td class="auto-style7"></td>
                    <td class="auto-style8"></td>
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
