<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdministrador.Master" AutoEventWireup="true" CodeBehind="MostrarHorarios.aspx.cs" Inherits="PI4.MostrarHorarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 186px;
        }
        .auto-style4 {
            width: 186px;
            height: 25px;
        }
        .auto-style5 {
            height: 25px;
        }
        .auto-style6 {
            width: 173px;
        }
        .auto-style7 {
            width: 173px;
            height: 25px;
        }
        .auto-style8 {
            height: 25px;
            width: 190px;
        }
        .auto-style9 {
            width: 190px
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6">Periodo:</td>
            <td class="auto-style2">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Periodo" DataValueField="ID" Width="193px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="select 0 as ID ,'Selecione' as Periodo
Union All
select ID_PERIODO,CAST(AÑO_INICIO  AS nvarchar(MAX))+' - '+CAST(AÑO_FIN AS nvarchar(MAX))  +' - '+CAST(PERIODO AS nvarchar(MAX)) from TB_PERIODO_ELECTIVO
" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
            </td>
            <td class="auto-style9">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style2">
                &nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="Label1" runat="server" Text="Carrera:" Visible="False"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Carrera" DataValueField="ID" Width="188px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Visible="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="select 0 as ID ,'Selecione' as Carrera
Union All
SELECT DISTINCT C.ID_CARRERA, C.NOMBRE FROM TB_PERIODO_SEMESTRE P INNER JOIN TB_SEMESTRE_CARRERA S ON P.ID_SEMESTRE_CARRERA=s.ID_SEMESTRE_CARRERA INNER JOIN TB_CARRERA C  ON S.ID_CARRERA=C.ID_CARRERA 
WHERE ID_PERIODO=@Periodo">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" DefaultValue="0" Name="Periodo" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td class="auto-style9">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7"></td>
            <td class="auto-style4"></td>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="Label2" runat="server" Text="Semestre:" Visible="False"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:DropDownList ID="DropDownList3" runat="server" Width="185px" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Semestre" DataValueField="ID" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" Visible="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="select 0 as ID ,'Selecione'as Semestre
Union All
SELECT P.ID_PERIODO_SEMESTRE,CAST(S.ID_SEMESTRE AS NVARCHAR(MAX)) +'-'+CAST(S.PARALELO AS NVARCHAR(MAX)) AS SEMESTRES FROM TB_SEMESTRE_CARRERA S INNER JOIN TB_PERIODO_SEMESTRE P  ON S.ID_SEMESTRE_CARRERA=P.ID_SEMESTRE_CARRERA WHERE ID_CARRERA=@Carrera  AND ID_PERIODO=@Periodo
">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" DefaultValue="0" Name="Carrera" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownList1" DefaultValue="0" Name="Periodo" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td class="auto-style9">&nbsp;</td>
            <td>
                <asp:Button ID="btnEliminar" runat="server" OnClick="btnEliminar_Click" OnClientClick="return confirm('¿Seguro que desea Eliminar el Presente Horario?');" Text="Eliminar Horario" Visible="False" />
            </td>
        </tr>
        <tr>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
     <div>
         <asp:MultiView ID="MultiView1" runat="server" OnActiveViewChanged="MultiView1_ActiveViewChanged">
             <asp:View ID="View1" runat="server">
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#00A651" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource4" GridLines="Vertical" Width="963px">
                     <AlternatingRowStyle BackColor="#DCDCDC" />
                     <Columns>
                         <asp:BoundField DataField="HORA" HeaderText="Hora" SortExpression="HORA">
                         <FooterStyle HorizontalAlign="Center" />
                         <HeaderStyle Font-Overline="False" HorizontalAlign="Right" />
                         </asp:BoundField>
                         <asp:BoundField DataField="Lunes" HeaderText="Lunes" ReadOnly="True" SortExpression="Lunes">
                         <HeaderStyle HorizontalAlign="Justify" />
                         </asp:BoundField>
                         <asp:BoundField DataField="Martes" HeaderText="Martes" ReadOnly="True" SortExpression="Martes">
                         <HeaderStyle HorizontalAlign="Justify" />
                         </asp:BoundField>
                         <asp:BoundField DataField="Miércoles" HeaderText="Miércoles" ReadOnly="True" SortExpression="Miércoles">
                         <HeaderStyle HorizontalAlign="Left" />
                         </asp:BoundField>
                         <asp:BoundField DataField="Jueves" HeaderText="Jueves" ReadOnly="True" SortExpression="Jueves">
                         <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                         </asp:BoundField>
                         <asp:BoundField DataField="Viernes" HeaderText="Viernes" ReadOnly="True" SortExpression="Viernes">
                         <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                         </asp:BoundField>
                     </Columns>
                     <FooterStyle BackColor="#00A651" ForeColor="Black" />
                     <HeaderStyle BackColor="#00A651" Font-Bold="True" ForeColor="White" />
                     <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                     <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                     <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                     <SortedAscendingCellStyle BackColor="#F1F1F1" />
                     <SortedAscendingHeaderStyle BackColor="#0000A9" />
                     <SortedDescendingCellStyle BackColor="#CAC9C9" />
                     <SortedDescendingHeaderStyle BackColor="#000065" />
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="select Z.HORA,case when Z.Lunes IS NULL then N'-    SIN ASIGNAR     -' else Z.Lunes end as Lunes,  
			   case when Z.Martes IS NULL then N'-     SIN ASIGNAR     -' else Z.Martes end as Martes,
			   case when Z.Miércoles IS NULL then N'-     SIN ASIGNAR     -' else Z.Miércoles end as Miércoles,
			   case when Z.Jueves IS NULL then N'-     SIN ASIGNAR     -' else Z.Jueves end as Jueves,
			   case when Z.Viernes IS null then N'-    SIN ASIGNAR     -' else Z.Viernes end as Viernes from (
select * from(
SELECT TB_DIA.DIA as Dia,TB_HORA.HORA as HORA ,TB_MATERIAS.Materia AS Materias
FROM TB_PERIODO_SEMESTRE INNER JOIN TB_HORARIO  ON TB_PERIODO_SEMESTRE.ID_PERIODO_SEMESTRE=TB_HORARIO.ID_PERIODO_SEMESTRE INNER JOIN TB_HORARIO_DETALLE ON TB_HORARIO.ID_HORARIO=TB_HORARIO_DETALLE.ID_HORARIO INNER JOIN TB_HORA ON TB_HORA.ID_HORA=TB_HORARIO_DETALLE.ID_HORA INNER JOIN TB_DIA ON TB_DIA.ID_DIA=TB_HORARIO_DETALLE.ID_DIA INNER JOIN TB_DOCENTE_MATERIA ON TB_HORARIO_DETALLE.ID_DOCENTE_MATERIA=TB_DOCENTE_MATERIA.ID_DOCENTE_MATERIA
INNER JOIN TB_MATERIAS ON TB_DOCENTE_MATERIA.ID_MATERIA=TB_MATERIAS.ID_Materias 
WHERE TB_PERIODO_SEMESTRE.ID_PERIODO_SEMESTRE=@IdSemestre) as T
PIVOT( MAX(T.Materias)  FOR T.Dia in ([Lunes],[Martes],[Miércoles],[Jueves],[Viernes])) as P) as Z

">
                     <SelectParameters>
                         <asp:ControlParameter ControlID="DropDownList3" DefaultValue="0" Name="IdSemestre" PropertyName="SelectedValue" />
                     </SelectParameters>
                 </asp:SqlDataSource>
                 <br />
                 &nbsp;<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#00A651" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource5" ForeColor="Black" GridLines="Horizontal" Width="565px">
                     <Columns>
                         <asp:BoundField DataField="Materias" HeaderText="Materias" SortExpression="Materias">
                         <FooterStyle Font-Underline="False" HorizontalAlign="Center" />
                         <HeaderStyle HorizontalAlign="Center" />
                         </asp:BoundField>
                         <asp:BoundField DataField="Docente" HeaderText="Docente" ReadOnly="True" SortExpression="Docente">
                         <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                         </asp:BoundField>
                     </Columns>
                     <FooterStyle BackColor="#00A651" ForeColor="Black" />
                     <HeaderStyle BackColor="#00A651" Font-Bold="True" ForeColor="White" />
                     <PagerStyle BackColor="#00A651" ForeColor="Black" HorizontalAlign="Right" />
                     <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                     <SortedAscendingCellStyle BackColor="#F7F7F7" />
                     <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                     <SortedDescendingCellStyle BackColor="#E5E5E5" />
                     <SortedDescendingHeaderStyle BackColor="#242121" />
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="SELECT distinct TB_MATERIAS.Materia AS Materias, CAST( LTRIM(RTRIM(TB_PERSONA.NOMBRES)) AS NVARCHAR(MAX))+' '+CAST( LTRIM(RTRIM(TB_PERSONA.APELLIDOS)) AS NVARCHAR(MAX)) as Docente
FROM TB_PERIODO_SEMESTRE INNER JOIN TB_HORARIO  ON TB_PERIODO_SEMESTRE.ID_PERIODO_SEMESTRE=TB_HORARIO.ID_PERIODO_SEMESTRE INNER JOIN TB_HORARIO_DETALLE ON TB_HORARIO.ID_HORARIO=TB_HORARIO_DETALLE.ID_HORARIO INNER JOIN TB_HORA ON TB_HORA.ID_HORA=TB_HORARIO_DETALLE.ID_HORA INNER JOIN TB_DIA ON TB_DIA.ID_DIA=TB_HORARIO_DETALLE.ID_DIA INNER JOIN TB_DOCENTE_MATERIA ON TB_HORARIO_DETALLE.ID_DOCENTE_MATERIA=TB_DOCENTE_MATERIA.ID_DOCENTE_MATERIA
INNER JOIN TB_MATERIAS ON TB_MATERIAS.ID_Materias=TB_DOCENTE_MATERIA.ID_MATERIA INNER JOIN TB_DOCENTE ON TB_DOCENTE_MATERIA.ID_DOCENTE=TB_DOCENTE.ID_DOCENTE INNER JOIN TB_PERSONA ON TB_DOCENTE.ID_PERSONA=TB_PERSONA.ID_PERSONA 
WHERE TB_PERIODO_SEMESTRE.ID_PERIODO_SEMESTRE=@Semestre">
                     <SelectParameters>
                         <asp:ControlParameter ControlID="DropDownList3" DefaultValue="0" Name="Semestre" PropertyName="SelectedValue" />
                     </SelectParameters>
                 </asp:SqlDataSource>
                 <br />
                 <br />
             </asp:View>
         </asp:MultiView>
     </div>
</asp:Content>
