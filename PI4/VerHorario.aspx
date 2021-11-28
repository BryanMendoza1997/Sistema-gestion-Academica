<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEstudiante.Master" AutoEventWireup="true" CodeBehind="VerHorario.aspx.cs" Inherits="PI4.VerHorario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
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
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <table style="width:90%;">
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text="Este usuario no cuenta con un horario disponible"></asp:Label>
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
                                    <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>HORARIO DEL ESTUDIANTE</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" HorizontalAlign="Center" Width="1024px" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                                        <Columns>
                                            <asp:BoundField DataField="HORA" HeaderText="HORA" SortExpression="HORA" />
                                            <asp:BoundField DataField="Lunes" HeaderText="Lunes" ReadOnly="True" SortExpression="Lunes" />
                                            <asp:BoundField DataField="Martes" HeaderText="Martes" ReadOnly="True" SortExpression="Martes" />
                                            <asp:BoundField DataField="Miércoles" HeaderText="Miércoles" ReadOnly="True" SortExpression="Miércoles" />
                                            <asp:BoundField DataField="Jueves" HeaderText="Jueves" ReadOnly="True" SortExpression="Jueves" />
                                            <asp:BoundField DataField="Viernes" HeaderText="Viernes" ReadOnly="True" SortExpression="Viernes" />
                                        </Columns>
                                        <HeaderStyle BackColor="#009933" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="spVerHor" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Label1" DefaultValue="0" Name="US" PropertyName="Text" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
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
