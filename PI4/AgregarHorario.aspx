<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEstudiante.Master" AutoEventWireup="true" CodeBehind="AgregarHorario.aspx.cs" Inherits="PI4.AgregarHorario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
        height: 22px;
            text-align: center;
        }
        .auto-style2 {
            height: 164px;
        }
        .auto-style3 {
            height: 22px;
        }
        .auto-style4 {
            width: 328px;
        }
        .auto-style5 {
            height: 22px;
            width: 263px;
        }
        .auto-style7 {
            height: 22px;
            width: 252px;
        }
        .auto-style9 {
            width: 263px;
        }
        .auto-style10 {
            width: 252px;
        }
    </style>
<%--    <script language="C#" runat="server">

      protected void FancyBtn_Click(object sender, EventArgs e)
      {  
        Message.InnerHtml = "Your name is: " + Name.Value; 
      }

</script>--%>
    <script runat="server">
        public void Button2_Click(object sender, EventArgs e)
        {
            int y = 0;
        }
        public void Button4_Click(object sender, EventArgs e)
        {
            int y = 0;
        }
    </script>
    <script>
        function pedirConfirmacion() {
            if (confirm("Esta seguro?")) {
                __doPostBack('', 'Save');
            }
        }
        function verbox() {
            swal({
                title: "¿Estás seguro?",
                text: "Desea guardar el siguiente horario",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#5cb85c",
                confirmButtonText: "Si, salir",
                cancelButtonText: "No, cancelar",
                animation: "slide-from-top",
                closeOnConfirm: false
            }, function () {
                __doPostBack('', 'Save');
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <table style="width:100%;">
    <tr>
        <td>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View2" runat="server">
                    <table style="width:100%;">
                        <tr>
                            <td>
                                <table style="width:100%;">
                                    <tr>
                                        <td class="auto-style5">
                                            Materias distribuidas por modulos</td>
                                        <td class="auto-style7">
                                            &nbsp;</td>
                                        <td class="auto-style3">&nbsp;</td>
                                        <td class="auto-style3"></td>
                                        <td class="auto-style3"></td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style9">
                                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="ID" DataValueField="MODULO">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="auto-style10">&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style9">&nbsp;</td>
                                        <td class="auto-style10">&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                                <br />
                                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="SELECT 'Seleccione una opcion' AS ID, '0' AS MODULO UNION ALL SELECT 'Modúlo ' + CONVERT (nvarchar(2), Modulo) AS MODULO, Modulo AS ID FROM (SELECT DISTINCT Modulo FROM TB_MATERIAS WHERE (ID_Carrera = @Carrera)) AS C">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="Label1" DefaultValue="0" Name="Carrera" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:Label ID="Label5" runat="server" Text="Label" Visible="False"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="CODIGO" DataSourceID="SqlDataSource2" Width="441px" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="CODIGO" HeaderText="CODIGO" InsertVisible="False" ReadOnly="True" SortExpression="CODIGO" />
                                        <asp:BoundField DataField="MATERIA" HeaderText="MATERIA" SortExpression="MATERIA" />
                                    </Columns>
                                    <HeaderStyle BackColor="#009933" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="SELECT ID_Materias AS CODIGO, Materia AS MATERIA FROM TB_MATERIAS WHERE (Modulo = @Modulo) order by Materia asc">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList1" DefaultValue="0" Name="Modulo" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2"></td>
                            <td class="auto-style2"></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel ID="Panel1" runat="server">
                                    <table style="width:100%;">
                                        <tr>
                                            <td class="auto-style1">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">
                                                <asp:Label ID="Label4" runat="server" style="text-align: center" Text="HORARIO DEL ESTUDIANTE"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" HorizontalAlign="Center" Width="960px">
                                                    <Columns>
                                                        <asp:BoundField DataField="HORA" HeaderText="HORA" SortExpression="HORA">
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Lunes" HeaderText="Lunes" ReadOnly="True" SortExpression="Lunes">
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Martes" HeaderText="Martes" ReadOnly="True" SortExpression="Martes">
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Miércoles" HeaderText="Miércoles" ReadOnly="True" SortExpression="Miércoles">
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Jueves" HeaderText="Jueves" ReadOnly="True" SortExpression="Jueves">
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Viernes" HeaderText="Viernes" ReadOnly="True" SortExpression="Viernes">
                                                        </asp:BoundField>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#009933" />
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="SPMOSTRAR" SelectCommandType="StoredProcedure" OnSelecting="SqlDataSource3_Selecting">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="Label5" DefaultValue="0" Name="US" PropertyName="Text" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="Button2" runat="server" Text="Cancelar" OnClick="Button2_Click2" />
                                                <asp:Button ID="Button3" runat="server" Text="Guardar" OnClick="Button3_Click2" OnClientClick="pedirConfirmacion()" CausesValidation="False" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>

                               <%-- <h3> Enter Name: <input id="Name" type="text" size="40" runat="server" />
            </h3>
                                <asp:Button ID="Button2" runat="server" Text="Confirmar" OnClientClick="javascript: return verbox();" CausesValidation="False" OnClick="Button2_Click" UseSubmitBehavior="False" />
                                <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                                <button id="Button4" runat="server" onclick="javascript:return verbox();">
                                    <br />
                                    Guardar
                                </button>
                                <h1>
             <span id="Message" runat="server"></span>
           </h1>
                                <button onclick="javascript:return verbox();" onserverclick=" FancyBtn_Click" runat="server" id="BUTTON3">
                                <b><i> Guardar</i> </b> 
                                </button>--%>
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="View4" runat="server">
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style4">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>
