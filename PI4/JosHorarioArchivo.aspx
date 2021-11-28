<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdministrador.Master" AutoEventWireup="true" CodeBehind="JosHorarioArchivo.aspx.cs" Inherits="PI4.JosHorarioArchivo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 490px;
        }
        .auto-style2 {
            width: 162px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Image ID="Image1" runat="server" Height="87px" ImageUrl="~/Imagenes/kisspng-computer-icons-calendar-date-public-transport-time-schedule-5ac3fd60f0f358.9035113715227938249869.png" />
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="Aparajita" Font-Size="X-Large" style="font-size: xx-large" Text="Horarios "></asp:Label>
        <br />
    </p>
    <asp:Panel ID="Panel1" runat="server" Height="197px">
        <br />
        <table>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Italic="False" Font-Names="Aparajita" Font-Size="Large" Text="Carrera"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:DropDownList ID="cmbComboCarrera0" runat="server" DataSourceID="SqlDataSource1ComboCarrera_Horario0" DataTextField="NOMBRE" DataValueField="ID_CARRERA" Font-Names="Aparajita" Height="18px" Width="330px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1ComboCarrera_Horario0" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="select ID_CARRERA, NOMBRE  from tb_Carrera
UNION
SELECT 0 ID_CARRERA, 'SELECCIONE UNA CARRERA.'
"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Italic="False" Font-Names="Aparajita" Font-Size="Large" Text="Año Lectivo"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:DropDownList ID="cmbComboAnioLectivo0" runat="server" DataSourceID="SqlDataSourceComboPeriodoLectivo0" DataTextField="Column1" DataValueField="ID_PERIODO" Font-Names="Aparajita" Width="335px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceComboPeriodoLectivo0" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="
SELECT [ID_PERIODO], cast([AÑO_INICIO] AS VARCHAR)+' a '+ CAST([AÑO_FIN] AS VARCHAR) + ' - '+ CAST([PERIODO] AS VARCHAR) FROM [TB_PERIODO_ELECTIVO]
union 
select 0, 'SELECCIONE UN PERIODO LECTIVO.'"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Italic="False" Font-Names="Aparajita" Font-Size="Large" Text="Subir archivo"></asp:Label>
                </td>
                <td class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:FileUpload ID="FileUpload4" runat="server" accept=".pdf,.doc,.docx,.xls,.xlsx" Width="368px" />
                    &nbsp;&nbsp; </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button4" runat="server" Font-Names="Aparajita" Font-Size="X-Large" Height="28px" OnClick="Button4_Click" Text="Guardar" Width="163px" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <p>
    </p>
    <p>
    </p>
    <asp:Panel ID="Panel3" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" Font-Names="Aparajita" Font-Size="Large" HorizontalAlign="Center" Width="568px">
            <RowStyle ForeColor="#000066" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre Archivo">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Text='<%# Eval("Nombre") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Length" HeaderText="Tamaño" />
                <asp:TemplateField HeaderText="Descargar">
                    <ItemTemplate>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:HyperLink ID="descarga" runat="server" ImageUrl="~/Imagenes/icons8-descargando-actualizaciones-32.png" NavigateUrl='<%# Eval("ID", "~/Download.aspx?id={0}") %>'>
                               <img src="http://localhost:5000/imagenes/download.gif" alt="" width="30px" height="30px" style="border-width:0px;" />
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    </asp:Panel>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>
